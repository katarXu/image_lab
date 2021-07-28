clc,clear,close all

rgb1 = imread('Rect1.bmp');
rgb2 = imread('Rect2.bmp');

i1 = lab44(rgb1);
i2 = lab44(rgb2);
figure
subplot 231
imshow(rgb1,[])
subplot 232
imshow(i1,[])
subplot 233
imshowpair(rgb1, i1)
subplot 234
imshow(rgb2,[])
subplot 235
imshow(i2,[])
subplot 236
imshowpair(rgb2, i2)

function [new] = lab44(old)
    i1 = fft2(old);
    i2 = conj(i1);
    new = ifft2(i2);
end