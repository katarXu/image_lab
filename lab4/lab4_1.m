clc,clear,close all

rgb1 = imread('Rect1.bmp');
rgb2 = imread('Rect2.bmp');

i1 = lab41(rgb1);
i2 = lab41(rgb2);
figure
subplot(2, 2, 1)
imshow(rgb1,[])
subplot(2, 2, 2)
imshow(i1,[])
subplot(2, 2, 3)
imshow(rgb2,[])
subplot(2, 2, 4)
imshow(i2,[])

function [new] = lab41(old)
    i1 = fft2(old);
    i2 = fftshift(i1);
    i3 = uint8(log(abs(i2) + 1));
    max1 = double(max(i3(:)))/255;
    new = imadjust(i3, [0, max1], []);
end