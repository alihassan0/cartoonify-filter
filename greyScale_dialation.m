function [ out_img ] = greyScale_dialation(myimg,se )

    [width,height] = size(myimg);
    out_img = uint8(zeros(width,height));

    for i = ceil(se/2): width-(floor(se/2))
        for j = ceil(se/2) :height-(floor(se/2))
                out_img(i,j,:) =  max(max(myimg(i-floor(se/2):i+floor(se/2), j-floor(se/2) : j+floor(se/2))));
        end
    end
end

