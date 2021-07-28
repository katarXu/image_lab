clc,clear,close all

rgb1 = imread('alphabet1.jpg');
f = figure()
se = translate(strel(1),[100,100]);
rgb2 = imdilate(rgb1,se);
subplot(2,2,1)
imshow(rgb1)
title('origin')
subplot(2,2,2)
imshow(rgb2)
title('translation1')


