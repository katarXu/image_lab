clc,clear,close all

rgb = imread('lena.bmp');
level = graythresh(rgb);
i1 = imbinarize(rgb, level);

figure
subplot 121
imshow(rgb)
subplot 122
imshow(i1)
