Fs=50000;                                                         %����Ƶ��
T=101;                                                            %ʱ�䳤��
n=Fs*T;                                                           %��������
f=450;                                                            %����Ƶ��
TNr=0;
num=0;
%���ն˵绰�����ֵΪ��
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
T5=0.1;%ʱ�䳤��(����һ��������0.1s,���0.1s������0.4s��
n5=Fs*T5;% ��������
tm=[1,2,3,65;4,5,6,66;7,8,9,67;42,0,35,68];           %DTMF�źŴ����16����
N=205;K=[18,20,22,24,31,34,38,42];
f1=[697,770,852,941];                                           %��Ƶ������
f2=[1209,1336,1477,1633];                                       %��Ƶ������
while (1)
    TNr=input('����7λ�绰����= ');
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
             if tm(p,q)==abs(d); break,end               %�����������к�q
             end
             if tm(p,q)==abs(d); break,end               %�����������к�p
         end
         n=0:1023;                                      %Ϊ�˷������ӳ�����
         x=sin(2*pi*n*f1(p)/8000)+sin(2*pi*n*f2(q)/8000);     %����˫Ƶ�ź�
         sound(x,8000);                                           %��������
         pause(0.2)
         %���ռ��˵ĳ���
         X=goertzel(x(1:205),K+1);           %��Goertzel�㷨����˵�DFT����
         val=abs(X);                                       %�г��˵�DFT����
         subplot(3,3,i);
         stem(K,val,'.');grid;xlabel('k');ylabel('|X(k)|')  %����DFT(k)����
         axis([10 50 0 120])
         limit=80;
         for s=5:8
           if val(s)>limit,break,end                              %�����к�
         end
         for r=1:4
           if val(r)>limit,break,end                              %�����к�
         end
         TNr=TNr+tm(r,s-4)*10^(7-i);
        end
        disp('���ն��Ƿ�պ�')
        disp('����0Ϊ�պţ�����1Ϊ��������')
        num=input('����Ϊ��')
         if num==0
                clear sound
                for q=1:2
                    [m1,fs]=audioread('konghaoyin.wav');%�������ź�
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
            disp('���ն��Ƿ�һ�')
            disp('����0Ϊ�һ�������1Ϊ���һ�')
            num=input('����Ϊ��');
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
