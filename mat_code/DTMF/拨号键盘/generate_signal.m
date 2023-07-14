function generate_signal(handles,c,r)
global xt fs fc fr l h power m n;
fs=8000;%������
t=(0:2000)/fs;
fc = [697 770 852 941];%��
fr = [1209 1336 1477];%��
%�к��е�Ӣ������С��Ū���ˣ�����Ӱ���������
l=fc(c);h=fr(r);
num=['1' '2' '3'; '4' '5' '6'; '7' '8' '9'; '*' '0' '#'];
set(handles.edit1,'string',num(c,r));
xt = sin(l*2*pi*t)+sin(h*2*pi*t);

power=get(handles.slider1,'value');
set(handles.edit2,'string',power);

if power ~= 0
[m,n]=size(xt);
noise=wgn(m,n,power);
xt = xt + noise;
end

%ģ�������DTMF������һ�鰴���źŵ�ʱƵͼ
axes(handles.axes1);
plot(t,xt);xlabel('ʱ��/s');
axis([0,0.04,-10,10]);
grid on;
sound(xt,fs);%ģ�ⷢ���ź���
