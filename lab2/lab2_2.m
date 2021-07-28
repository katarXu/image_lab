clc,clear,close all

rgb = imread('cameraman.bmp');

x1 = input('input x1\n');
y1 = input('input y1\n');
x2 = input('input x2\n');
y2 = input('input y2\n');
transform = Stretch(rgb, x1, y1, x2, y2);
figure
subplot(1,2,1)
imshow(rgb)
title('origin')
subplot(1,2,2)
imshow(transform)
title('transform')

function [new] = Stretch(old, x1, y1, x2, y2)
    new = old;
    [w, h] = size(new);
    k1 = y1/x1;
    k2 = (y2 - y1)/(x2 - x1);
    k3 = (255 - y2)/(255 - y1);
    for i = 1 : w
        for j = 1 : h
            gray = new(i, j);
            if gray < x1
                new(i, j) = gray * k1;
            elseif gray <= x2
                new(i, j) = gray * k2 + y1;
            else
                new(i, j) = gray * k3 + y2;
            end
        end
    end
end