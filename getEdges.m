function [ finalimage ] = getEdges( image )
%getEdges return edges of all the image
for c=1:3
    
img = image(:,:,c);
[h,w] = size(img);

f=fspecial('gaussian',17,3);
img=imfilter(img,f,'conv');

% img=mean_filter(img);

gxf = [-1 0 1;-2 0 2;-1 0 1];
gyf = [-1 -2 -1;0 0 0;1 2 1];

g = zeros(h,w);
g1 = zeros(h,w);
g2 = zeros(h,w);
angel = zeros(h,w);

img = double(img);

for y=2:h-1
    for x=2:w-1
        gx =0;
        gy =0;
        for i=-1:1
            for j=-1:1
                gx = gx + (img(y+j,x+i)* gxf(j+2,i+2));
                gy = gy + (img(y+j,x+i)* gyf(j+2,i+2));
            end
        end
        g(y,x) = sqrt((gx^2) +(gy^2));
        a = gy/gx;
        if gx == 0 ;
            angel(y,x) = 0;
        else
            angels = atand(a);
            angel(y,x) = angels;
        end
        if angel(y,x) <0
            angel(y,x) = angel(y,x)+360 ; 
        end
    end
end

ng =g ;

for y=2:h-1
    for x=2:w-1
        if g(y,x) > 0
             if (angel(y,x)<22.5 || angel(y,x)>= 237.5) || (angel(y,x)<202.5 && angel(y,x)>= 157.5)
                angel(y,x) = 0;
%                 if g(y,x+1)>0 && g(y,x-1) > 0
%                 else
%                     ng(y,x) = 0;
%                 end
             elseif (angel(y,x)<67.5 && angel(y,x)>= 22.5) || (angel(y,x)<247.5 && angel(y,x)>= 202.5)
                angel(y,x) = 45;
%                 if g(y+1,x-1)>0 && g(y-1,x+1) > 0
%                 else
%                     ng(y,x) = 0;
%                 end
             elseif (angel(y,x)<112.5 && angel(y,x)>= 67.5) || (angel(y,x)<292.5 && angel(y,x)>= 247.5)
                 angel(y,x) = 90;
%                 if g(y+1,x)>0 && g(y-1,x) > 0
%                 else
%                     ng(y,x) = 0;
%                 end
             elseif (angel(y,x)<157.5 && angel(y,x)>= 112.5) || (angel(y,x)<337.5 && angel(y,x)>= 292.5)
                 angel(y,x) = 135;
%                 if g(y+1,x+1)>0 && g(y-1,x-1) > 0
%                 else
%                     ng(y,x) = 0;
%                 end
             end
        end
    end
end

g =ng ;
for y=2:h-1
    for x=2:w-1
        if g(y,x) <35
            ng(y,x) = 0;
        elseif g(y,x) < 70
            if angel(y,x) == 0
                if g(y,x+1)>70 && g(y,x-1) >70
                else
                    ng(y,x) = 0;
                end
             elseif angel(y,x) == 45
                if g(y+1,x-1)>70 && g(y-1,x+1) >70
                else
                    ng(y,x) = 0;
                end
             elseif angel(y,x) == 90
                if g(y+1,x)>70 && g(y-1,x) >70
                else
                    ng(y,x) = 0;
                end
             elseif angel(y,x) == 135
                if g(y+1,x+1)>70 && g(y-1,x-1) >70
                else
                    ng(y,x) = 0;
                end
             end
        end
    end
end

g=ng;
fi{c} = g ;
end

finalimage = zeros(h,w);
for y=1:h
    for x=1:w
        if fi{1}(y,x) > 0 || fi{2}(y,x)>0 || fi{3}(y,x) >0
            finalimage(y,x) = 255;
        end
    end
end

finalimage = logical(finalimage/255);

end

