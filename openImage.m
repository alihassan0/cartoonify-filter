function [ dialatedImg ] = openImage( img, windowSize )
%OPENIMAGE performs an opening on the image to cleam rouge pixels
    c1 = greyScale_erosion(img(:,:,1),windowSize);
    c2 = greyScale_erosion(img(:,:,2),windowSize);
    c3 = greyScale_erosion(img(:,:,3),windowSize);
    c1 = greyScale_dialation(c1,windowSize);
    c2 = greyScale_dialation(c2,windowSize);
    c3 = greyScale_dialation(c3,windowSize);
    dialatedImg = uint8(cat(3, c1, c2, c3));
end

