function [ outputImg ] = HSVtoRGB(input)

inputImg = double(input);
[rows,cols,n]=size(inputImg);
outputImg = zeros(rows,cols);

for i = 1:1:rows
    for j = 1:1:cols
        H = inputImg(i,j,1);
        S = inputImg(i,j,2);
        V = inputImg(i,j,3);
        
        Hi = floor(H*6);
        f = (H*6) - Hi;
        p = V * (1-S);
        q = V * (1-(f*S));
        t = V * (1-((1-f)*S));
        
        if (Hi == 0)
            R = V;
            G = t;
            B = p;
        elseif(Hi == 1)
            R = q;
            G = V;
            B = p;
        elseif(Hi == 2)
            R = p;
            G = V;
            B = t;
        elseif(Hi == 3)
            R = p;
            G = q;
            B = V;
        elseif(Hi == 4)
            R = t;
            G = p;
            B = V;
        elseif(Hi == 5)
            R = V;
            G = p;
            B = q;
        end    
        
        outputImg(i,j,1)= R;
        outputImg(i,j,2)= G;
        outputImg(i,j,3)= B;
    end
end    
end

