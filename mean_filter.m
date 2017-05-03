function [ new_SP ] = mean_filter(ImageNoise)

ImageNoise = double(ImageNoise);
[X,Y]=size(double(ImageNoise));

new_SP= int16(ones(X,Y)*255);

for i=2:X-1
    for j=2:Y-1
       
       new_SP(i,j)=floor(0.0+(ImageNoise(i-1,j-1)+ImageNoise(i-1,j)+ImageNoise(i-1,j+1)+ImageNoise(i,j-1)+ImageNoise(i,j)+ImageNoise(i,j+1)+ImageNoise(i+1,j-1)+ImageNoise(i+1,j)+ImageNoise(i+1,j+1))/9);

    end
end 
new_SP = uint8(new_SP);
   
end