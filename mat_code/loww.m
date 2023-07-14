function y=loww(x)
N=length(x)
fs=500;
T=1/fs;
D=2/(N);
X=T*fftshift(fft(x));          
k=floor(-(N-1)/2:(N-1)/2);         
figure(13);
subplot(211),plot(x);title('ԭ�ź�');xlabel('n');ylabel('x(n)');

subplot(212),plot(k*D,abs(X)) ; title('ԭ�ź�Ƶ��');  
xlabel('\Omega/pi'),ylabel('|X(\Omega)|')
alpha=100;
M=2*alpha+1;
hn=fir1(M-1,0.03,'low',hamming(M));%��ͨ�˲��� 
%hn=fir1(M-1,0.36,'high',hamming(M));%��ͨ�˲��� 
%hn=fir1(M-1,[0.1,0.2],'low',hamming(M));%��ͨ�˲��� 

y=conv(x,hn);
figure(14);
Y=T*fftshift(fft(y));
N1=length(Y);
D1=2/N1
k1=floor(-(N1-1)/2:(N1-1)/2); 
subplot(211),plot(k*D,abs(X)) ;title('�˲�ǰƵ��');  
xlabel('\Omega/pi'),ylabel('|X(\Omega)|')
subplot(212),plot(k1*D1,abs(Y));title('�˲���Ƶ��');
xlabel('\Omega/pi'),ylabel('|Y(\Omega)|')
figure(15);
subplot(211),plot(x) ; title('ԭ�ź�');xlabel('n');ylabel('x(n)');

subplot(212),plot(y);title('�˲����ź�');xlabel('n');ylabel('y(n)');