function [ averagedImg ] = smoothImage( img )
%SMOOTHIMAGE returns a smoothed version of the image
    
    averagedImg1 = mean_filter(img(:,:,1));
    averagedImg2 = mean_filter(img(:,:,2));
    averagedImg3 = mean_filter(img(:,:,3));
    averagedImg = uint8(cat(3, averagedImg1, averagedImg2, averagedImg3));

end

