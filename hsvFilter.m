function [ rgb ] = hsvFilter( img )
%HSVFILTER Performs some mutations on the Image in the HSV 
%   Detailed explanation goes here
    
    % convert image to HSV
    hsv = Rgb2Hsv(img);

    % seperate HSV into it's three channels
    hueMat = hsv(:, :, 1);
    saturationMat = hsv(:, :, 2);
    valueMat = hsv(:, :, 3);

    quantize = @(pixel, quantizationStep ) (floor(pixel/quantizationStep)+.5)*quantizationStep;

    % modify hue channel 

    mat = hueMat;
    [rows, cols] = size(mat);
    for i=1:1:rows
        for j=1:1:cols
            pixel = mat(i, j);
            mat(i, j) = quantize(pixel, 1/32);
        end
    end
    hueMat = mat ;

    % modify saturation mat
    mat = saturationMat;
    [rows, cols] = size(mat);
    for i=1:1:rows
        for j=1:1:cols

            pixel = mat(i, j);
            if pixel < .2
                mat(i, j) = 0;
            else
                mat(i, j) = .5+pixel*.5;
            end
        end
    end
    saturationMat= mat ;

    % modify value mat
    mat = valueMat;
    [rows, cols] = size(mat);
    for i=1:1:rows
        for j=1:1:cols
            pixel = mat(i, j);
            if pixel < .15
                mat(i, j) = .1;
            elseif pixel < .5
                mat(i, j) = .3;
            else
                mat(i, j) = .9;
            end
            mat(i, j);

        end
    end
    valueMat= mat ;

    %merge hsv channels
    hsv = cat(3, hueMat, saturationMat, valueMat);

    %convert HSV image to RGB 
    rgb = Hsv2Rgb(hsv);

end

