t1='123A';t2='456B';t3='789C';t4='*0#D'; % DTMF 信号代表的16 个数
tm=[double(t1);double(t2);double(t3);double(t4)];% DTMF 信号代表的16 个ASCII 值
i=0;
N=205; %DFT 采样点数
K=[19,21,23,25,32,35,39,43]; %8 个基频对应的8 个k 值
f1=[697,770,852,941]; % 行频率向量
f2=[1209,1336,1477,1633]; % 列频率向量
Y1=input(' 键入电话号码= ','s'); % 输入一串数字
Y2=double(Y1);% 输入字符串变成ASCII 码
T=length(Y2); %求输入号码长度
Y3=zeros(1,T);%接收端电话号码初值为零
for l=1:T; %分别对每位号码数字处理：产生信号，检测
d=Y2(l); %计算出第l 位号码数字
for p=1:4;
for q=1:4;
if tm(p,q)==d; break,end % 检测与l 位号码相符的列号q
end
if tm(p,q)==d; break,end % 检测与l 位号码相符的行号p
end
n=0:1023;
x = sin(2*pi*n*f1(p)/8000) + sin(2*pi*n*f2(q)/8000);% 构成双音频信号
pause(0.1) %相邻信号响声之间加0.1 秒停顿
% 接收检测端的程序
X=fft(x,N) ; % 用FFT 算法计算DFT 样本
val = abs(X(K)); % 列出八点DFT 的摸
figure(1) 
subplot(4,3,l);
stem(K,val,'.');grid;xlabel('k');ylabel('|X(k)|') % 画出8 点DFT(k) 的幅度
axis([0 50 0 120]);
limit = 80; %基频检测门限为80
for s=5:8;
if val(s) > limit, break, end % 查找列号
end
for r=1:4;
if val(r) > limit, break, end % 查找行号
end
Y3(l)=tm(r,s-4); %将号码表示成一个ASCII 向量
end
Y=char(Y3); %将ASCII 转化成字符串表示的电话号码
disp('接收端检测到的号码为： ')
disp(Y) % 显示接收到的电话号码