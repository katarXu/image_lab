clc,clear,close all

rgb1 = imread('Rect1.bmp');
rgb2 = imread('Rect2.bmp');

i1 = lab43(rgb1);
i2 = lab43(rgb2);
figure
subplot(2, 2, 1)
imshow(rgb1,[])
subplot(2, 2, 2)
imshow(i1,[])
subplot(2, 2, 3)
imshow(rgb2,[])
subplot(2, 2, 4)
imshow(i2,[])

function [new] = lab43(old)
    i1 = fft2(old);
    new = uint8(255*mat2gray(abs(ifft2(angle(i1)))));
end