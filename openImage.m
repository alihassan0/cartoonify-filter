function [ openedImage ] = openImage( img )
%OPENIMAGE performs an opening on the image to cleam rouge pixels
    
    %create a 3*3 structrung element;
    structuringElement =  strel('disk',1);

    % open rgb image to clear rouge pixels
    openedImage = imopen(img, structuringElement);
    openedImage = uint8(openedImage*255);
end

