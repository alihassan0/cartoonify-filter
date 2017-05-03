function [ maskedImage ] = maskImage( img, mask )
%MASKIMAGE Summary of this function goes here
    % create mask from edges
    mask = double(~mask);
    % replace 
    mask = changem(mask,[.4],[0]);

    maskedImage = uint8(cat(3, img(:,:,1).*mask, img(:,:,2).*mask, img(:,:,3).*mask)); 
    
end

