function y=hdb3(x)
% x=[0 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 ]

n=length(x);%输入系列的长度

last_V=-1;%初始化V的符号
last_one=-1;%初始化1的符号
y=zeros(size(x));    %初始化输出序列
count=0;             %连0计数器

for i=1:n
     if x(i)==1       %遇1则极性反转
         y(i)=-last_one;
         last_one=y(i);
         count=0;
     else
         count=count+1;%遇0则零的个数加1
         if count==4   %遇到连续4个0
             count=0;
             y(i)=-last_V;            %遇4连零则置为V，相邻的V极性反转
             last_V=y(i);
             if y(i)*last_one==-1     %V与前一个非0符号必须同极性（相邻V之间如果间隔偶数个1，则y(i)*last_one==-1，插入B符号，否者，不插入。）
                 y(i-3)=y(i);         
             end
             last_one=y(i);
         end
     end
end

%绘图部分
% figure(4);
% subplot(3,1,1);
% stairs(0:length(x)-1,x);
% axis([0 length(x) -2 2]);
% title('PCM编码'); grid; %打开网格
% 
% subplot(3,1,2);
% stairs(0:length(y)-1,y);
% axis([0 length(y) -2 2]);
% title('HDB3编码图'); grid; %打开网格
% 
% 
% y1=AMI(x)
% subplot(3,1,3);
% stairs(0:length(y1)-1,y1);
% axis([0 length(y1) -2 2]);
% title('AMI编码图'); grid; %打开网格