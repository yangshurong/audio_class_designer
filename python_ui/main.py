import sys
from PySide2.QtWidgets import *
from PySide2.QtUiTools import *
from PySide2.QtCore import *
from PySide2.QtGui import *
import queue
from utils import int_to_bit as PCMcode
from utils import bit_to_int as PCMdecode
from utils import AMIcode, AMIdecode, HDB3code, HDB3decode, ASKcode, ASKdecode
from utils import add_noise
import matplotlib.pyplot as plt
from matplotlib.backends.backend_qt5agg import FigureCanvasQTAgg as FigureCanvas
from matplotlib.figure import Figure
import sounddevice as sd
import numpy as np
import time
from utils import ASK_FS, ASK_FC, ASK_THRED
# params worker could set
TRANS_CODE_LIST = ['AMI编码', 'HDB3编码']
CHANNLES = 1
SAMPLE_RATES = 8000
BUFFER_SIZE = 1104
TIME_WATCH_IMAGE = 30


# params user set by UI
NSR = 0
CODE_WORKER = AMIcode
DECODE_WORKER = AMIdecode
TIME_INIT_INPUT = time.time()
TIME_INIT_OUTPUT = time.time()

q_cache = queue.Queue()
plt_info_input = queue.Queue()
plt_info_output = queue.Queue()


def input_callback(indata, frames, t, status):
    global CODE_WORKER
    global NSR
    global TIME_INIT_INPUT
    global TIME_WATCH_IMAGE
    pcm_x = PCMcode(indata)
    chan_x = CODE_WORKER(pcm_x)
    x = ASKcode(chan_x)
    if time.time()-TIME_INIT_INPUT > TIME_WATCH_IMAGE/1000:
        plt_info_input.put((indata, x))
        TIME_INIT_INPUT = time.time()
    x = add_noise(x, NSR)
    q_cache.put(x)


# 输出回调函数
def output_callback(outdata, frames, t, status):
    global DECODE_WORKER
    global TIME_INIT_OUTPUT
    x = q_cache.get()
    x, mid_carry = ASKdecode(x)
    x = DECODE_WORKER(x)
    x = PCMdecode(x)
    if time.time()-TIME_INIT_OUTPUT > TIME_WATCH_IMAGE/1000:
        plt_info_output.put((mid_carry, x))
        TIME_INIT_OUTPUT = time.time()
    outdata[:] = x.reshape(x.shape[0], 1)
    pass

from multiprocessing import Pool
import multiprocessing as mp
from threading import Thread

class MyWindow(QMainWindow):
    def __init__(self):
        super(MyWindow, self).__init__()
        self.show_ui('./main.ui')
        self.set_code_chose()
        self.set_noise_chose()
        self.is_run = False
        self.ui.pushButton_2.clicked.connect(self.start_trans)
        self.ui.pushButton.clicked.connect(self.close_trans)
        self.ui.show()

    def show_ui(self, location):
        qfile_staus = QFile(location)
        qfile_staus.open(QFile.ReadOnly)
        qfile_staus.close()
        self.ui = QUiLoader().load(qfile_staus)
        self.ui.setWindowTitle("实时语音信号")

    def set_code_chose(self):
        self.ui.comboBox.addItems(TRANS_CODE_LIST)
        self.ui.comboBox.setCurrentIndex(0)
        self.ui.comboBox.currentIndexChanged.connect(self.code_chose_event)

    def code_chose_event(self, idx):
        global CODE_WORKER
        global DECODE_WORKER
        if idx == 0:
            CODE_WORKER = AMIcode
            DECODE_WORKER = AMIdecode
        else:
            CODE_WORKER = HDB3code
            DECODE_WORKER = HDB3decode

    def set_noise_chose(self):
        self.ui.spinBox.valueChanged.connect(self.noise_chose_event)

    def noise_chose_event(self):
        global NSR
        noise_value = self.ui.spinBox.value()
        NSR = noise_value

    def start_trans(self):
        # 打开输入流
        self.input_stream = sd.InputStream(device=sd.default.device, channels=CHANNLES,
                                           samplerate=SAMPLE_RATES, callback=input_callback, dtype='int16', blocksize=BUFFER_SIZE)
        # 打开输出流
        self.output_stream = sd.OutputStream(device=sd.default.device, channels=CHANNLES,
                                             samplerate=SAMPLE_RATES, callback=output_callback, dtype='int16', blocksize=BUFFER_SIZE)

        self.input_stream.start()
        self.output_stream.start()
        self.is_run = True
        self.timer_input = QTimer()
        self.timer_input.start(TIME_WATCH_IMAGE)
        self.timer_input.timeout.connect(self.show_figure_input)

    def close_trans(self):
        self.timer_input.stop()
        self.is_run = False
        self.input_stream.stop()
        self.output_stream.stop()
        # 关闭输入和输出流，释放资源
        self.input_stream.close()
        self.output_stream.close()
        del self.input_stream
        del self.output_stream

        global q_cache
        while not q_cache.empty():
            _ = q_cache.get()
        global plt_info_input
        while not plt_info_input.empty():
            _ = plt_info_input.get()
        global plt_info_output
        while not plt_info_output.empty():
            _ = plt_info_output.get()

    def show_figure_input(self):

        # with mp.get_context('spawn').Pool(processes=NUM_PROCESSOR) as pool:
        if not plt_info_input.empty():
            origin_y, askcode_y = plt_info_input.get()
            # pool.apply_async(self.plt_ask_f, (askcode_y,))
            # pool.apply_async(self.plt_origin_f, (origin_y,))
            # plt_origin(origin_y,self.ui.label_3)
            # pool.apply_async(self.plt_ask, (askcode_y,))
            # print('arrive, in')
            self.plt_ask_f(askcode_y)
            self.plt_origin_f(origin_y)
            self.plt_origin(origin_y)
            self.plt_ask(askcode_y)
        if not plt_info_output.empty():
            midcarray_y, recall_y = plt_info_output.get()
            # pool.apply_async(self.plt_midcarry_f, (midcarray_y,))
            # pool.apply_async(self.plt_midcarray, (midcarray_y,))
            # pool.apply_async(self.plt_recall, (recall_y,))
            # print('arrive, out')
            self.plt_midcarry_f(midcarray_y)
            self.plt_midcarray(midcarray_y)
            self.plt_recall(recall_y)

    def plt_origin(self, origin_y):
        # self.ui.label_3.clear()
        x = np.arange(0, BUFFER_SIZE/SAMPLE_RATES,
                      (BUFFER_SIZE/SAMPLE_RATES)/(origin_y.shape[0]))
        plt.cla()
        plt.plot(x, origin_y)
        plt.xlabel('time')
        plt.ylabel('origin signal')
        plt.ylim(-100000, 100000)
        plt.savefig('./figure/origin_signal.png')
        pic = QPixmap('./figure/origin_signal.png')
        self.ui.label_3.setPixmap(pic)
        self.ui.label_3.setScaledContents(True)

    def plt_ask(self, askcode_y):
        askcode_y = askcode_y[0:12*ASK_FS]
        x = np.arange(0, 12*ASK_FS, 1)
        plt.cla()
        plt.plot(x, askcode_y)
        plt.xlabel('number list')
        plt.ylabel('ASK result')
        plt.savefig('./figure/ask_signal.png')
        pic = QPixmap('./figure/ask_signal.png')
        self.ui.label_9.setPixmap(pic)
        self.ui.label_9.setScaledContents(True)

    def plt_origin_f(self, y):
        n = len(y)
        _y = np.fft.fft(y)
        fs1 = SAMPLE_RATES
        f = np.arange(0, n/2)*(fs1/n)  # 计算频率轴f，从0到N/2-1，乘以采样率fs1除以样本数N
        plt.cla()
        plt.plot(f, np.abs(_y[0:int(n/2)]))  # 绘制频谱图
        plt.xlabel('Frequency (Hz)')  # 设置横轴标签
        plt.ylabel('Magnitude')  # 设置纵轴标签
        plt.savefig('./figure/origin_f_signal.png')
        pic = QPixmap('./figure/origin_f_signal.png')
        self.ui.label_5.setPixmap(pic)
        self.ui.label_5.setScaledContents(True)

    def plt_ask_f(self, y):
        n = len(y)
        _y = np.fft.fft(y)
        fs1 = SAMPLE_RATES*ASK_FS
        f = np.arange(0, n/2)*(fs1/n)  # 计算频率轴f，从0到N/2-1，乘以采样率fs1除以样本数N
        plt.cla()
        plt.plot(f, np.abs(_y[0:int(n/2)]))  # 绘制频谱图
        plt.xlabel('Frequency (Hz)')  # 设置横轴标签
        plt.ylabel('Magnitude')  # 设置纵轴标签
        plt.savefig('./figure/ask_f_signal.png')
        pic = QPixmap('./figure/ask_f_signal.png')
        self.ui.label_13.setPixmap(pic)
        self.ui.label_13.setScaledContents(True)

    def plt_midcarry_f(self, y):
        n = len(y)
        _y = np.fft.fft(y)
        fs1 = SAMPLE_RATES*ASK_FS
        f = np.arange(0, n/2)*(fs1/n)  # 计算频率轴f，从0到N/2-1，乘以采样率fs1除以样本数N
        plt.cla()
        plt.plot(f, np.abs(_y[0:int(n/2)]))  # 绘制频谱图
        plt.xlabel('Frequency (Hz)')  # 设置横轴标签
        plt.ylabel('Magnitude')  # 设置纵轴标签
        plt.savefig('./figure/midcarray_f_signal.png')
        pic = QPixmap('./figure/midcarray_f_signal.png')
        self.ui.label_16.setPixmap(pic)
        self.ui.label_16.setScaledContents(True)

    def plt_midcarray(self, y):
        _y = y[0:12*ASK_FS]
        x = np.arange(0, 12*ASK_FS, 1)
        plt.cla()
        plt.plot(x, _y)
        plt.xlabel('number list')
        plt.ylabel('midcarray result')
        plt.savefig('./figure/midcarray_signal.png')
        pic = QPixmap('./figure/midcarray_signal.png')
        self.ui.label_11.setPixmap(pic)
        self.ui.label_11.setScaledContents(True)

    def plt_recall(self, y):
        x = np.arange(0, BUFFER_SIZE/SAMPLE_RATES,
                      (BUFFER_SIZE/SAMPLE_RATES)/(y.shape[0]))
        plt.cla()
        plt.plot(x, y)
        plt.xlabel('time')
        plt.ylabel('origin signal')
        plt.ylim(-100000, 100000)
        plt.savefig('./figure/origin_signal.png')
        pic = QPixmap('./figure/origin_signal.png')
        self.ui.label_17.setPixmap(pic)
        self.ui.label_17.setScaledContents(True)


if __name__ == "__main__":
    app = QApplication([])
    MainWindow = QMainWindow()
    statu = MyWindow()
    statu.ui.show()
    app.exec_()
