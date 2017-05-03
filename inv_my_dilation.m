function [ out_img ] = inv_my_dilation( myimg,se )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% i_image = (imread(myimg));
level = graythresh(myimg);
b_image = im2bw(myimg,level);

[width,height] = size(b_image);
out_img = ones(width,height);
% struct = ones(se,se);
for i = se-(floor(se/2)): width-(floor(se/2))
    for j = se-(floor(se/2)):height-(floor(se/2))
        if b_image(i,j) ==0
            for m = -floor(se/2):(floor(se/2))
                for n = -floor(se/2):floor(se/2)
                        out_img(i+m,j+n) = 0;  
                end
            end
        end
    end
end
end

