clc,clear,close all

%rgb = imread('lena.bmp');
rgb = imread('blood.bmp');

Sobel = [
    -1 -2 -1;
    0 0 0;
    1 2 1;
    ];
Prewitt = [
    -1 -1 -1;
    0 0 0;
    1 1 1;
    ];
Laplace1 = [
    0 1 0;
    1 -4 1;
    0 1 0;
    ];
Laplace2 = [
    -1 -1 -1;
    -1 8 -1;
    -1 -1 -1;
    ];
rgb1 = edge(rgb,'Roberts');
rgb21 = edge(rgb,'Sobel');
rgb22 = edge(rgb,'Sobel','horizontal');
rgb31 = edge(rgb,'Prewitt');
rgb32 = edge(rgb,'Prewitt','horizontal');

rgb41 = uint8(Translate(conv2(int16(rgb),Laplace1,'same')));
rgb42 = uint8(Translate(conv2(int16(rgb),Laplace2,'same')));
rgb5 = edge(rgb,'Canny');
figure
subplot(5,2,1)
imshow(rgb)
title('origin')
subplot(5,2,2)
imshow(rgb1)
title('Roberts')
subplot(5,2,3)
imshow(rgb21)
title('Sobel_1')
subplot(5,2,4)
imshow(rgb22)
title('Sobel_2')
subplot(5,2,5)
imshow(rgb31)
title('Prewitt_1')
subplot(5,2,6)
imshow(rgb32)
title('Prewitt_2')
subplot(5,2,7)
imshow(rgb41)
title('Laplace_1')
subplot(5,2,8)
imshow(rgb42)
title('Laplace_2')
subplot(5,2,9)
imshow(rgb5)
title('Canny')

function [new] = Translate(old)
    new = old;
    max_elment = max(max(old));
    min_elment = min(min(old));
    k = 255/(max_elment - min_elment); 
    [w, l] = size(new);
    for i = 1 : w
        for j = 1 : l
            new(i, j) = round(((new(i, j)-min_elment) * k));
        end
    end
end
