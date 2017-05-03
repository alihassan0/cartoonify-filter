function [ maskedImage ] = maskImage( img, mask )
%MASKIMAGE Summary of this function goes here
    % create mask from edges
    mask = double(~mask);
    % replace 
    mask = changem(mask,[.4],[0]);
    
    [h,w] = size(mask );
    for y=1:h
        for x=1:w
            if(mask(y,x) ==0)
                mask(y,x) = .1;
            end
        end
    end

    maskedImage = uint8(cat(3, img(:,:,1).*mask, img(:,:,2).*mask, img(:,:,3).*mask)); 
    
end

