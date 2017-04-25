img = imread('img.jpg');

hsv = rgb2hsv(img);
% subplot(3,3,4), imhist(img(:,:,1)) , title('red channel')
% subplot(3,3,5), imhist(img(:,:,2)), title('blue channel')
% subplot(3,3,6), imhist(img(:,:,3)), title('green channel')

hueMat = hsv(:, :, 1);
saturationMat = hsv(:, :, 2);
valueMat = hsv(:, :, 3);
hue = hsv(:, :, 1);

quantize = @(pixel, quantizationStep ) (floor(pixel/quantizationStep)+.5)*quantizationStep;

% modify hue mat
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
[rows, cols] = size(mat)
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
[rows, cols] = size(mat)
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

    
% saturation(:) = 1;
% value(:) = 0;
hsv = cat(3, hueMat, saturationMat, valueMat);
rgb = hsv2rgb(hsv);

structuringElement =  strel('disk',1);
rgb2 = imopen(rgb, structuringElement)
rgb3 = imopen(img, structuringElement)

BW = edge(img(:,:,1),'Sobel')|edge(img(:,:,2),'Sobel')|edge(img(:,:,3),'Sobel')
BW = imdilate(BW,strel('line',2, 0))

subplot(2,3,1), imshow(img), title('originalImage');
subplot(2,3,2), imshow(rgb), title('hsvtorgb');
subplot(2,3,3), imshow(rgb2), title('opened Image');
subplot(2,3,4), imshow(BW), title('3 channel edges');
BW = double(~BW)
BW = changem(BW,[.2],[0])

imgwithEdges = cat(3, rgb2(:,:,1).*BW, rgb2(:,:,2).*BW, rgb2(:,:,3).*BW); 
subplot(2,3,5), imshow(imgwithEdges), title('img with edges');

h = fspecial('average', [3 3]);
averagedImg1 = filter2(h, imgwithEdges(:,:,1));
averagedImg2 = filter2(h, imgwithEdges(:,:,2));
averagedImg3 = filter2(h, imgwithEdges(:,:,3));
averagedImg = cat(3, averagedImg1, averagedImg2, averagedImg3);

subplot(2,3,6), imshow(averagedImg), title('smoothed edges');


% BW = edge(averagedImg1,'Sobel')+edge(averagedImg2,'Sobel')+edge(averagedImg3,'Sobel')