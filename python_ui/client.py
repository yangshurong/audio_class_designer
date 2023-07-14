import sounddevice as sd
import requests
import queue
import numpy as np
import subprocess
from time import time
PUSH_URL = f"rtmp://10.0.117.224:1935/live/1"
PULL_URL = f"rtmp://10.0.117.224:1935/live/2"
BUFFER_SIZE = 32
SAMPLE_RATE = 44100
DTYPE = 'float32'
CHANNELS = 1

FFMPEG_TYPE = 's16le' if DTYPE == 'uint16' else 'f32le'
BYTE_SIZE = int(np.dtype(DTYPE).itemsize)
NOISE_DATA = np.random.uniform(-0.01, 0.01,
                               size=(BUFFER_SIZE, CHANNELS)).astype(DTYPE)
PUSH_CMD = [
    'ffmpeg',
    '-f', FFMPEG_TYPE,
    '-ac', str(CHANNELS),
    '-ar', str(SAMPLE_RATE),
    '-i', '-',
    '-c:a', 'aac',
    '-f', 'flv',
    PUSH_URL
]

PULL_CMD = [
    'ffmpeg',
    '-i', PULL_URL,
    '-f', FFMPEG_TYPE,
    '-ac', str(CHANNELS),
    '-ar', str(SAMPLE_RATE),
    '-'
]
pull_process = subprocess.Popen(
    PULL_CMD, stdout=subprocess.PIPE, bufsize=BUFFER_SIZE)
push_process = subprocess.Popen(
    PUSH_CMD, stdin=subprocess.PIPE, bufsize=BUFFER_SIZE)

def push_audio_callback(indata, frames, time, status):
    # print('arrive push')
    # print('input is ', indata.dtype, indata.shape, np.unique(indata))
    push_process.stdin.write(indata.tobytes())

def pull_audio_callback(outdata, frames, time, status):
    # print('arrive pull')
    try:
        data = pull_process.stdout.read(frames * CHANNELS * BYTE_SIZE)  # 每个样本占两个字节
        data = np.frombuffer(data, dtype=DTYPE).reshape(-1, CHANNELS)
    except Exception as e:
        print(str(e))
        data = NOISE_DATA
        
    # print('output is ', data.dtype, data.shape, np.unique(data))
    outdata[:] = data

if __name__ == '__main__':


    input_stream = sd.InputStream(
        callback=push_audio_callback, channels=CHANNELS, samplerate=SAMPLE_RATE, blocksize=BUFFER_SIZE)
    output_stream = sd.OutputStream(
        callback=pull_audio_callback, samplerate=SAMPLE_RATE, channels=CHANNELS, blocksize=BUFFER_SIZE)

    # output_stream.start()
    # sd.sleep(int(2 * 1000))
    input_stream.start()
    output_stream.start()
    while True:
        try:
            sd.sleep(int(0.5 * 1000))
        except KeyboardInterrupt:
            # 停止音频输入
            
            output_stream.stop()
            output_stream.close()
            input_stream.stop()
            input_stream.close()
            push_process.terminate()
            pull_process.terminate()
            break
