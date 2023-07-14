clc,clear
T=5;
fs1=8000;
[xr1,fs1]=audioread('D://桌面/图像sybg/实验一/语音采集信号.wav');
sound(xr1,fs1);
pause(5);
t1=(1:length(xr1))/fs1;
figure(1)
plot(t1,xr1);title('抽样8kHz信号');
figure(2)
N=length(xr1);
Y=fft(xr1);
f=(0:round(N/2)-1)*fs1/N;
 plot(f,abs(Y(1:round(N/2))));
code=PCMcode(xr1);
M=length(code);
max_xr=max(abs(xr1));  
figure(3)
t2=1:M;
plot(t2,code);title('PCM编码');
figure(4)
y1=AMI(code);
plot(t2,y1)
title('AMI码');
figure(5)
y2=hdb3(code);
plot(t2,y2);
title('HDB3码');
figure(9)

f0=10;
sample=50;
t3=(0:sample-1)/50/10;
carry1=repmat(sin(2*pi*f0*t3),1,4);
H0=code(170000:170032);
H=y2(170000:170032);
H1=y1(170000:170032);
plot(carry1);title('载波信号');
figure(10)
hdb_ask=kron(H,carry1);
N1=length(hdb_ask);
tau=(0:N1-1)/(sample-1)/f0;
subplot(211);plot(tau,hdb_ask);title("hdb3 ask调制信号")

ami_ask=kron(H1,carry1);
subplot(212);plot(tau,ami_ask);title("AMI ask调制信号")

figure(11)
ask=awgn(hdb_ask,30);
subplot(211);plot(tau,ask);title("hdb3 ask加噪调制信号");
ask1=awgn(ami_ask,30);
subplot(212);plot(tau,ask1);title("ami ask加噪调制信号");
figure(12)
carry2=kron(ones(size(H)),carry1);
dask=ask.*carry2;
dask1=ask1.*carry2;
subplot(211);plot(tau,dask);title("与载波相乘后信号(hdb3)");
subplot(212);plot(tau,dask1);title("与载波相乘后信号(ami)");

ddask=loww(dask);
dddask=panjue(ddask);
ddask1=loww(dask1);
dddask1=panjue(ddask1);
figure(16)
subplot(211);stairs(0:length(H)-1,H); axis([0 length(H) -2 2]); title('原HDB3码'); grid; 
subplot(212);stairs(0:length(dddask)-1,dddask); axis([0 length(dddask) -2 2]); title('判决后HDB3码'); grid;

figure(17)
subplot(211);stairs(0:length(H1)-1,H1); axis([0 length(H1) -2 2]); title('原AMI码'); grid; 
subplot(212);stairs(0:length(dddask1)-1,dddask1); axis([0 length(dddask1) -2 2]); title('判决后AMI码'); grid; 

figure(18)
edddask1=abs(dddask1);
edddask=decodehdb3(dddask);
subplot(311);stairs(0:length(H0)-1,H0); axis([0 length(H0) -2 2]); title('原PCM码'); grid; 
subplot(312);stairs(0:length(edddask)-1,edddask); axis([0 length(edddask) -2 2]); title('判决后HDB3码解码后PCM'); grid; 
subplot(313);stairs(0:length(edddask1)-1,edddask1); axis([0 length(edddask1) -2 2]); title('判决后AMI码解码后PCM'); grid; 

figure(19)
stairs(0:length(H0)-1,H0); axis([0 length(H0) -0.5 1.5]); title('PCM码(170000-170032)'); grid; 
i_pcm=PCMdecode(code,max_xr);

figure(20)
subplot(211);stairs(0:length(H)-1,H); axis([0 length(H) -2 2]); title('原HDB3码'); grid; 
subplot(212);stairs(0:length(H1)-1,H1); axis([0 length(H1) -2 2]); title('原AMI码'); grid; 

figure(6)
Z=fft(i_pcm);
subplot(221);plot(t1,i_pcm);title('译码后信号');
subplot(222);plot(t1,xr1);title('抽样初始信号');
subplot(223);plot(f,abs(Z(1:round(N/2))));title('译码后信号');
subplot(224);plot(f,abs(Y(1:round(N/2))));title('抽样初始信号');

figure(7)
decodeAMI=abs(y1);
i_pcm1=PCMdecode(decodeAMI,max_xr);
plot(t1,i_pcm1);title('AMI译码后信号');
figure(8)
decodeHDB3=decodehdb3(y2);
i_pcm2=PCMdecode(decodeHDB3,max_xr);
plot(t1,i_pcm2);title('HDB3译码后信号');
%播放音乐
sound(i_pcm,fs1);
pause(5);
%生成.wav文件
audiowrite('music_cy.wav',i_pcm,8000);
