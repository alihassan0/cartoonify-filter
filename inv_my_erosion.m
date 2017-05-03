function [ out_img ] = inv_my_erosion(myimg,se )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% i_image = (imread(myimg));
level = graythresh(myimg);
b_image = im2bw(myimg,level);
bool=0;
[width,height] = size(b_image);
out_img = ones(width,height);

for i = ceil(se/2): width-(floor(se/2))
    for j = ceil(se/2) :height-(floor(se/2))
            bool = 0;
            for m = -floor(se/2):(floor(se/2))
                for n = -floor(se/2):floor(se/2)
                    if  b_image(i+m,j+n) == 1
                        bool=1;
                    end
                end
            end
        if bool == 0
            out_img(i,j) =0;
        end
    end
end
end

