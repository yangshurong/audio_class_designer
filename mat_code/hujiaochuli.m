Fs=50000;                                                         %采样频率
T=101;                                                            %时间长度
n=Fs*T;                                                           %采样点数
f=450;                                                            %声音频率
TNr=0;
num=0;
%接收端电话号码初值为零
y=sin(2*pi*f*T*linspace(0,1,n+1));
T1=0.2;
n=Fs*T1;
y1=sin(2*pi*f*T1*linspace(0,1,n+1));
T2=0.35;
n=Fs*T2;
y2=sin(2*pi*f*T2*linspace(0,1,n+1));
T4=2;
n=Fs*T4;
y4=sin(2*pi*f*T4*linspace(0,1,n+1));
sound(y,Fs)
T5=0.1;%时间长度(三短一长，短音0.1s,间断0.1s，长音0.4s）
n5=Fs*T5;% 采样点数
tm=[1,2,3,65;4,5,6,66;7,8,9,67;42,0,35,68];           %DTMF信号代表的16个数
N=205;K=[18,20,22,24,31,34,38,42];
f1=[697,770,852,941];                                           %行频率向量
f2=[1209,1336,1477,1633];                                       %列频率向量
while (1)
    TNr=input('键入7位电话号码= ');
    if TNr==0
       sound(y,Fs)
       break
    else
        clear sound
        for i=1:7
         d=fix(TNr/10^(7-i));
         TNr=TNr-d*10^(7-i);
         for p=1:4
             for q=1:4
             if tm(p,q)==abs(d); break,end               %检测码相符的列号q
             end
             if tm(p,q)==abs(d); break,end               %检测码相符的行号p
         end
         n=0:1023;                                      %为了发声，加长序列
         x=sin(2*pi*n*f1(p)/8000)+sin(2*pi*n*f2(q)/8000);     %构成双频信号
         sound(x,8000);                                           %发出声音
         pause(0.2)
         %接收检测端的程序
         X=goertzel(x(1:205),K+1);           %用Goertzel算法计算八点DFT样本
         val=abs(X);                                       %列出八点DFT向量
         subplot(3,3,i);
         stem(K,val,'.');grid;xlabel('k');ylabel('|X(k)|')  %画出DFT(k)幅度
         axis([10 50 0 120])
         limit=80;
         for s=5:8
           if val(s)>limit,break,end                              %查找列号
         end
         for r=1:4
           if val(r)>limit,break,end                              %查找行号
         end
         TNr=TNr+tm(r,s-4)*10^(7-i);
        end
        disp('接收端是否空号')
        disp('输入0为空号，输入1为正常号码')
        num=input('输入为：')
         if num==0
                clear sound
                for q=1:2
                    [m1,fs]=audioread('konghaoyin.wav');%打开语音信号
                    sound(m1,fs);
                    pause(10)
                    y5=sin(2*pi*f*T5*linspace(0,1,n5+1));
                    sound(y5,Fs)
                    pause(0.4)
                    y5=sin(2*pi*f*T5*linspace(0,1,n5+1));
                    sound(y5,Fs)
                    pause(0.4)
                    y5=sin(2*pi*f*T5*linspace(0,1,n5+1));
                    sound(y5,Fs)
                    pause(0.4)
                    y6=sin(2*pi*f*4*T5*linspace(0,1,4*n5+1));
                    sound(y6,Fs)
                    pause(1.6)
                end
                break
            else
                if num==1
                    clear sound                           
        for p=1:9
            y=y4;
            sound(y,Fs)
            pause(5.88)
            disp('接收端是否挂机')
            disp('输入0为挂机，输入1为不挂机')
            num=input('输入为：');
            if num==0
                clear sound
                for q=1:9
                    y=y2;
                    sound(y,Fs)
                    pause(0.68)
                end
                break
            else
                if num==1
                    clear sound
                    y=y1;
                    sound(y,Fs)
                end
            end
        end
        break 
                end
         end
    end
end
