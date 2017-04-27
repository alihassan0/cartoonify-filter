function [ averagedImg ] = smoothImage( img )
%SMOOTHIMAGE returns a smoothed version of the image
    
    h = fspecial('average', [3 3]);
    averagedImg1 = filter2(h, img(:,:,1));
    averagedImg2 = filter2(h, img(:,:,2));
    averagedImg3 = filter2(h, img(:,:,3));
    averagedImg = cat(3, averagedImg1, averagedImg2, averagedImg3);

end

