function y=hdb3(x)
% x=[0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 ]

n=length(x);%����ϵ�еĳ���

last_V=-1;%��ʼ��V�ķ���
last_one=-1;%��ʼ��1�ķ���
y=zeros(size(x));    %��ʼ���������
count=0;             %��0������

for i=1:n
     if x(i)==1       %��1���Է�ת
         y(i)=-last_one;
         last_one=y(i);
         count=0;
     else
         count=count+1;%��0����ĸ�����1
         if count==4   %��������4��0
             count=0;
             y(i)=-last_V;            %��4��������ΪV�����ڵ�V���Է�ת
             last_V=y(i);
             if y(i)*last_one==-1     %V��ǰһ����0���ű���ͬ���ԣ�����V֮��������ż����1����y(i)*last_one==-1������B���ţ����ߣ������롣��
                 y(i-3)=y(i);         
             end
             last_one=y(i);
         end
     end
end

%��ͼ����
% figure(4);
% subplot(3,1,1);
% stairs(0:length(x)-1,x);
% axis([0 length(x) -2 2]);
% title('PCM����'); grid; %������
% 
% subplot(3,1,2);
% stairs(0:length(y)-1,y);
% axis([0 length(y) -2 2]);
% title('HDB3����ͼ'); grid; %������
% 
% 
% y1=AMI(x)
% subplot(3,1,3);
% stairs(0:length(y1)-1,y1);
% axis([0 length(y1) -2 2]);
% title('AMI����ͼ'); grid; %������