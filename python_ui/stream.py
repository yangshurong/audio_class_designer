import sys
# from PCM_code import *
import queue
from utils import int_to_bit as PCMcode
from utils import bit_to_int as PCMdecode
from utils import AMIcode, AMIdecode, HDB3code, HDB3decode, ASKcode, ASKdecode
from utils import add_noise

import sounddevice as sd

# 配置输入设备参数
input_device = sd.default.device  # 默认输入设备
input_channels = 1  # 输入通道数
input_samplerate = 8000  # 输入采样率

# 配置输出设备参数
output_device = sd.default.device  # 默认输出设备
output_channels = 1  # 输出通道数
output_samplerate = 8000  # 输出采样率

q_cache = queue.Queue()

# 输入回调函数


def input_callback(indata, frames, time, status):
    # x = indata
    x = PCMcode(indata)
    x = HDB3code(x)
    x, plt_t = ASKcode(x)
    x = add_noise(x, 10)
    x = ASKdecode(x)
    x = HDB3decode(x)
    x = PCMdecode(x)
    q_cache.put(x.reshape(x.shape[0], 1))


# 输出回调函数
def output_callback(outdata, frames, time, status):
    outdata[:] = q_cache.get()
    pass


# 打开输入流
input_stream = sd.InputStream(device=input_device, channels=input_channels,
                              samplerate=input_samplerate, callback=input_callback, dtype='int16')
input_stream.start()

# 打开输出流
output_stream = sd.OutputStream(device=output_device, channels=output_channels,
                                samplerate=output_samplerate, callback=output_callback, dtype='int16')
output_stream.start()

# 保持程序运行
while True:

    try:
        sd.sleep(500)
    except KeyboardInterrupt:
        input_stream.stop()
        output_stream.stop()
        # 关闭输入和输出流，释放资源
        input_stream.close()
        output_stream.close()
        raise KeyboardInterrupt

# 关闭流
