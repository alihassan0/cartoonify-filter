function [ resultImg ] = cartoonify( imgFile )
%CARTOONIFY: takes an image into cartoonish version
    % read image
    img = imread(imgFile);

    %---------------------- PART 1 ---------------------------------
    % apply transformation to image in the HSV domain
    hsvFilteredImage = hsvFilter(img);
    
    %---------------------- PART 3.A ---------------------------------
    % clean rouge pixels.
    openedImage = openImage( hsvFilteredImage );
    
    
    
    %---------------------- PART 2 ---------------------------------
    % get image edges 
    edges = getEdges(openedImage);
    
    % add edges to cleaned Image from 3.A
    imgwithEdges = maskImage(openedImage, edges);
    
    %---------------------- PART 3.B ---------------------------------
    % apply mean filter to colored image;
    smoothedImg = smoothImage(imgwithEdges);
    

    %---------------------- Show images ---------------------------------
    subplot(2,3,1), imshow(img), title('originalImage');
    subplot(2,3,2), imshow(hsvFilteredImage), title('hsvtorgb');
    subplot(2,3,3), imshow(openedImage), title('opened Image');
    subplot(2,3,4), imshow(edges), title('3 channel edges');
    subplot(2,3,5), imshow(imgwithEdges), title('img with edges');
    subplot(2,3,6), imshow(smoothedImg), title('smoothed edges');
    
    resultImg = smoothedImg;
end

