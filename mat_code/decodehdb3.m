function y=decodehdb3(Sn)
dchdbn = Sn;  %����һ���������
count = 0;

for j = 1 : length(Sn)  
    if Sn(j) == 0 
        count  = count + 1;
        if  count == 3  %��3����0��ǰ���������ͬ���ԣ������һ������Ԫ����Ϊ��
            if dchdbn(j + 1) * dchdbn(j - 3) == 1
                dchdbn(j + 1) = 0;
            end
        end
        if count == 2 %��2�� ��0��ǰ��������弫����ͬ��������ǰ����Ϊ��
            if dchdbn(j + 1) * dchdbn(j  - 2) == 1;
                dchdbn(j  - 2) = 0;
                dchdbn(j + 1) = 0;
            end
        end
    else
         count = 0;   
    end
end

%���Ա任
for n = 1 : length(Sn) %�ٽ����е�-1�任��+1�󣬾Ϳ��Եõ�ԭ��Ϣ����
    if dchdbn(n) == -1
        dchdbn(n) = 1;    
    end
end
y=dchdbn;