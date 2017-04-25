img = imread('img.png');
subplot(3,3,1), imshow(img), title('originalImg')

% trial 1 quantization
[x, map] = rgb2ind(img, 8, 'nodither');
subplot(3,3,2), imshow(x,map), title('8 colors quantization')

% trial 2 calcualting edges
subplot(3,3,3), edge(rgb2gray(img)), title('edges')

% trial 3 histograms
h = rgb2hsv(img);
subplot(3,3,4), imhist(img(:,:,1)) , title('red channel')
subplot(3,3,5), imhist(img(:,:,2)), title('blue channel')
subplot(3,3,6), imhist(img(:,:,3)), title('green channel')

subplot(3,3,7), hsv , title('HSV colors');

% trial 4 HSV
hsv = rgb2hsv(img);



hue = hsv(:, :, 1);
saturation = hsv(:, :, 2);
value = hsv(:, :, 3);
saturation(:) = 1;
% value(:) = 0;
hsv = cat(3, hue, saturation, saturation);
subplot(3,3,7), imshow(hsv2rgb(hsv)) , title('HSV colors')

subplot(3,3,8), imshow(hsv2rgb(hsv)) , title('HSV colors')