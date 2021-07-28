clc,clear,close all

rgb = imread('cameraman.bmp');

low = input('input low\n');
high = input('input high\n');
res = GrayScale(rgb);
figure
subplot(1,2,1)
imshow(rgb)
title('origin')
subplot(1,2,2)
bar(0:255, res)
xlim([low, high])
title('GrayScale')

function [res] = GrayScale(old)
    [w, h] = size(old);
    res = zeros(1, 256);
    for i = 1 : w
        for j = 1 : h
            g = old(i, j);
            res(g) = res(g) + 1; 
        end
    end
end