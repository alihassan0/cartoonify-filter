function [ out_img ] = my_erosion(myimg,se )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% i_image = (imread(myimg));
% level = graythresh(myimg);
% b_image = im2bw(myimg,level);

[width,height, colors] = size(myimg);
out_img = uint8(zeros(width,height,colors));

for i = ceil(se/2): width-(floor(se/2))
    for j = ceil(se/2) :height-(floor(se/2))
            bool = 1;
            for m = -floor(se/2):(floor(se/2))
                for n = -floor(se/2):floor(se/2)
                    dist = sqrt(sum(abs(myimg(i+m,j+n,:)-myimg(i, j,:))));
                    if  dist >5
                        bool=0;
                    end
                end
            end
        if bool == 1
            out_img(i,j,:) =  myimg(i, j, :);
        end
    end
end
end

