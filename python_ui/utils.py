import matplotlib.pyplot as plt
from math import pi
import numpy as np
from numba import jit

ASK_FS = 100
ASK_FC = 3
ASK_THRED = 0.3


@jit(nopython=True)
def int_to_bit(intarray):
    ans = np.zeros((16*intarray.shape[0]), dtype='uint8')
    for i, x in enumerate(intarray):
        if x < 0:
            ans[i*16] = 1
            x = -x
        for j in range(0, 15):
            if (x & (2**j)):
                ans[i*16+15-j] = 1
    return ans


@jit(nopython=True)
def bit_to_int(bitarray):
    ans = np.zeros((int(bitarray.shape[0]/16)), dtype='int16')
    len_bit = bitarray.shape[0]
    for i in range(0, len_bit, 16):
        for j in range(0, 15):
            if bitarray[i+15-j]:
                ans[int(i/16)] += 2**j
        if bitarray[i]:
            ans[int(i/16)] *= -1
    return ans


@jit(nopython=True)
def AMIcode(x):
    y = np.zeros(x.shape, dtype='int8')
    number1 = 0
    number0 = 0
    len_x = len(x)
    for i in range(len_x):
        if x[i] == 1:
            number1 = number1 + 1
            if number1 / 2 == np.trunc(number1 / 2):
                y[i] = 1  # AMI码的1码
            else:
                y[i] = -1  # AMI码的-1码
        if x[i] == 0:
            number0 = number0 + 1
            y[i] = 0  # AMI的0码

    return y


@jit(nopython=True)
def AMIdecode(x):
    y = np.zeros(x.shape, dtype='uint8')
    len_x = len(x)
    for i in range(len_x):
        if x[i] == 1 or x[i] == -1:
            y[i] = 1

    return y


@jit(nopython=True)
def ASKcode(x):
    t = np.arange(0, x.shape[0], 1.0/ASK_FS)
    tar_x = np.zeros((x.shape[0]*ASK_FS))
    carry = np.sin(2*pi*ASK_FC*t)
    for i in range(tar_x.shape[0]):
        tar_x[i] = x[int(i/ASK_FS)]*carry[i]
    return tar_x


@jit(nopython=True)
def ASKdecode(x):
    t = np.arange(0, int(x.shape[0]/ASK_FS), 1.0/ASK_FS)
    mid = np.sin(2*pi*ASK_FC*t)*x
    ans = np.zeros((int(mid.shape[0]/ASK_FS)), dtype='int8')
    len_s = ans.shape[0]
    for i in range(len_s):
        media = np.mean(mid[i*ASK_FS:(i+1)*ASK_FS])
        if media < -ASK_THRED:
            ans[i] = -1
        elif media > ASK_THRED:
            ans[i] = 1
        else:
            ans[i] = 0
    return ans, mid

@jit(nopython=True)
def HDB3code(x):
    n = len(x)  # 输入序列的长度
    last_V = -1  # 初始化V的符号
    last_one = -1  # 初始化1的符号
    y = np.zeros((x.shape[0]), dtype='int8')  # 初始化输出序列
    count = 0  # 连0计数器

    for i in range(n):
        if x[i] == 1:  # 遇到1则极性反转
            y[i] = -last_one
            last_one = y[i]
            count = 0
        else:
            count += 1  # 遇到0则零的个数加1
            if count == 4:  # 遇到连续4个0
                count = 0
                y[i] = -last_V  # 遇到4连零则置为V，相邻的V极性反转
                last_V = y[i]
                if y[i] * last_one == -1:  # V与前一个非0符号必须同极性（相邻V之间如果间隔偶数个1，则y[i]*last_one==-1，插入B符号，否则不插入。）
                    y[i-3] = y[i]
                last_one = y[i]

    return y

@jit(nopython=True)
def HDB3decode(Sn):
    dchdbn = np.copy(Sn)  # 定义一个输出数组
    count = 0

    for j in range(1, len(Sn)):
        if Sn[j] == 0:
            count += 1
            if count == 3:  # 若3连“0”前后非零脉冲同极性，则将最后一个非零元素译为零
                if dchdbn[j + 1] * dchdbn[j - 3] == 1:
                    dchdbn[j + 1] = 0
            if count == 2:  # 若2连“0”前后非零脉冲极性相同，则两零前后都译为零
                if dchdbn[j + 1] * dchdbn[j - 2] == 1:
                    dchdbn[j - 2] = 0
                    dchdbn[j + 1] = 0
        else:
            count = 0
    
    # 极性变换
    for n in range(len(Sn)):
        if dchdbn[n] == -1:
            dchdbn[n] = 1
    
    return dchdbn


@jit(nopython=True)
def add_noise(signal, nsr_dB):
    nsr = 10**(nsr_dB / 10.0)  # 将噪声比从分贝转换为线性比例
    power = np.mean(np.abs(signal)**2)  # 信号的功率

    noise_power = power * nsr  # 计算噪声的功率
    noise = np.random.normal(0, np.sqrt(noise_power), signal.shape)  # 生成符合高斯分布的噪声

    noisy_signal = signal + noise  # 添加噪声到信号上

    return noisy_signal

if __name__ == '__main__':
    x = []
    x = np.random.randint(2, size=12)
    x = HDB3code(x)
    print(x)

    x, t = ASKcode(x)
    x = add_noise(x,10)
    plt.subplot(2, 1, 1)
    plt.plot(t, x)
    plt.xlabel('x')
    plt.ylabel('ask')
    plt.title('Sine Function')
    plt.grid(True)

    print(x.shape)
    x = ASKdecode(x)
    print(x)



    # 显示图像
    plt.show()
