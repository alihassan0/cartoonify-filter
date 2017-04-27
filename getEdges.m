function [ edges ] = getEdges( img )
%getEdges return edges of all the image
    edges = edge(img(:,:,1),'Sobel')|edge(img(:,:,2),'Sobel')|edge(img(:,:,3),'Sobel');
%     BW = imdilate(BW,strel('line',2, 0));
end

