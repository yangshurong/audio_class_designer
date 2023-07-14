function y=decodehdb3(Sn)
dchdbn = Sn;  %定义一个输出数组
count = 0;

for j = 1 : length(Sn)  
    if Sn(j) == 0 
        count  = count + 1;
        if  count == 3  %若3连“0”前后非零脉冲同极性，则将最后一个非零元素译为零
            if dchdbn(j + 1) * dchdbn(j - 3) == 1
                dchdbn(j + 1) = 0;
            end
        end
        if count == 2 %若2连 “0”前后非零脉冲极性相同，则两零前后都译为零
            if dchdbn(j + 1) * dchdbn(j  - 2) == 1;
                dchdbn(j  - 2) = 0;
                dchdbn(j + 1) = 0;
            end
        end
    else
         count = 0;   
    end
end

%极性变换
for n = 1 : length(Sn) %再将所有的-1变换成+1后，就可以得到原消息代码
    if dchdbn(n) == -1
        dchdbn(n) = 1;    
    end
end
y=dchdbn;