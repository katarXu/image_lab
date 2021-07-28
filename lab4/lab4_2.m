clc,clear,close all

rgb1 = imread('Rect1.bmp');
rgb2 = imread('Rect2.bmp');

i1 = lab42(rgb1);
i2 = lab42(rgb2);
figure
subplot(2, 2, 1)
imshow(rgb1,[])
subplot(2, 2, 2)
imshow(i1)
subplot(2, 2, 3)
imshow(rgb2,[])
subplot(2, 2, 4)
imshow(i2)

function [new] = lab42(old)
    i1 = fft2(old);
    i2 = fftshift(i1);
    i2 = ifftshift(i2);
    new = abs(ifft2(abs(i2)));
    new = uint8(255*mat2gray(log(new+1)));
end