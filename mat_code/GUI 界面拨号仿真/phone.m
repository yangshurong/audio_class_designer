t1='123A';t2='456B';t3='789C';t4='*0#D'; % DTMF �źŴ����16 ����
tm=[double(t1);double(t2);double(t3);double(t4)];% DTMF �źŴ����16 ��ASCII ֵ
i=0;
N=205; %DFT ��������
K=[19,21,23,25,32,35,39,43]; %8 ����Ƶ��Ӧ��8 ��k ֵ
f1=[697,770,852,941]; % ��Ƶ������
f2=[1209,1336,1477,1633]; % ��Ƶ������
Y1=input(' ����绰����= ','s'); % ����һ������
Y2=double(Y1);% �����ַ������ASCII ��
T=length(Y2); %��������볤��
Y3=zeros(1,T);%���ն˵绰�����ֵΪ��
for l=1:T; %�ֱ��ÿλ�������ִ��������źţ����
d=Y2(l); %�������l λ��������
for p=1:4;
for q=1:4;
if tm(p,q)==d; break,end % �����l λ����������к�q
end
if tm(p,q)==d; break,end % �����l λ����������к�p
end
n=0:1023;
x = sin(2*pi*n*f1(p)/8000) + sin(2*pi*n*f2(q)/8000);% ����˫��Ƶ�ź�
pause(0.1) %�����ź�����֮���0.1 ��ͣ��
% ���ռ��˵ĳ���
X=fft(x,N) ; % ��FFT �㷨����DFT ����
val = abs(X(K)); % �г��˵�DFT ����
figure(1) 
subplot(4,3,l);
stem(K,val,'.');grid;xlabel('k');ylabel('|X(k)|') % ����8 ��DFT(k) �ķ���
axis([0 50 0 120]);
limit = 80; %��Ƶ�������Ϊ80
for s=5:8;
if val(s) > limit, break, end % �����к�
end
for r=1:4;
if val(r) > limit, break, end % �����к�
end
Y3(l)=tm(r,s-4); %�������ʾ��һ��ASCII ����
end
Y=char(Y3); %��ASCII ת�����ַ�����ʾ�ĵ绰����
disp('���ն˼�⵽�ĺ���Ϊ�� ')
disp(Y) % ��ʾ���յ��ĵ绰����