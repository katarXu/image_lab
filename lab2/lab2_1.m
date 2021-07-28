clc,clear,close all

rgb = imread('cameraman.bmp');

k = input('input k\n');
b = input('input b\n');
transform = LinearTransform(rgb, k, b);
figure
subplot(1,2,1)
imshow(rgb)
title('origin')
subplot(1,2,2)
imshow(transform)
title('transform')

function [new] = LinearTransform(old, k, d)
    new = old * k + d;
end