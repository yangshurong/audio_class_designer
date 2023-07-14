function y = AMI(input)
    y = zeros(size(input));  
    number1 = 0; 
    number0 = 0; 

    for i=1:length(input)
        if input(i)==1
            number1 = number1+1;
            if number1/2==fix(number1/2)
                y(i)=1;
            else
                y(i)=-1;
            end
        end
        if input(i)==0
            number0 = number0+1;
            y(i) = 0;
        end
    end
end