% read image
img = imread('test2.jpg');

% convert image to HSV
hsv = rgb2hsv(img);

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
rgb = hsv2rgb(hsv);

%create a 3*3 structrung element;
structuringElement =  strel('disk',1);

% open rgb image to clear rouge pixels
rgb2 = imopen(rgb, structuringElement);

% get original Image edges
BW = edge(img(:,:,1),'Sobel')|edge(img(:,:,2),'Sobel')|edge(img(:,:,3),'Sobel');
BW = imdilate(BW,strel('line',2, 0));


% create mask from edges
mask = double(~BW)
% replace 
mask = changem(BW,[.4],[0]);

imgwithEdges = cat(3, rgb2(:,:,1).*mask, rgb2(:,:,2).*mask, rgb2(:,:,3).*mask); 
% merge image mask with result from part 1

% apply mean filter to colored image;
h = fspecial('average', [3 3]);
averagedImg1 = filter2(h, imgwithEdges(:,:,1));
averagedImg2 = filter2(h, imgwithEdges(:,:,2));
averagedImg3 = filter2(h, imgwithEdges(:,:,3));
averagedImg = cat(3, averagedImg1, averagedImg2, averagedImg3);


subplot(2,3,1), imshow(img), title('originalImage');
subplot(2,3,2), imshow(rgb), title('hsvtorgb');
subplot(2,3,3), imshow(rgb2), title('opened Image');
subplot(2,3,4), imshow(BW), title('3 channel edges');
subplot(2,3,5), imshow(imgwithEdges), title('img with edges');
subplot(2,3,6), imshow(averagedImg), title('smoothed edges');
