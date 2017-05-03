function [ outputImg ] = RGBtoHSV(input)

inputImg = double(input);
[rows,cols,n]=size(inputImg);
outputImg = zeros(rows,cols);

for i = 1:1:rows
    for j = 1:1:cols
        red = inputImg(i,j,1)/255;
        green = inputImg(i,j,2)/255;
        blue = inputImg(i,j,3)/255;
        minimum = min( min( red, green), blue );
        maximum = max( max( red, green), blue );
        delta = maximum - minimum;
        V = maximum;
        if ( maximum ~= 0)
            S = delta/maximum;
        else
            S = 0;
        end  
        if(maximum == minimum)
            H = 0;
        elseif ( maximum == red && green >= blue)
            H = 60 *((green - blue)/delta);
        elseif ( maximum == red && green < blue)
            H = (60 *((green - blue)/delta)) + 360;    
        elseif( maximum == green)
            H = (60 *((blue - red)/delta)) + 120;
        elseif( maximum == blue)
            H = (60 *((red - green)/delta)) + 240;
        end  
        if( H < 0)
            H = H + 360;
        end
        
        outputImg(i,j,1)= H/360;
        outputImg(i,j,2)= S;
        outputImg(i,j,3)= V;
        %output= cat(3, H, S, V);
        
    end
end    
 
end

