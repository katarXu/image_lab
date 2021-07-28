clc,clear,close all

rgb = imread('cameraman.bmp');
[h,w,c] = size(rgb);
rgb1 = imresize(rgb,0.5);
rgb2 = imresize(rgb,[h/2,w],'bilinear');
rgb3 = imresize(rgb,[h/2,w],'nearest');

f = figure()
subplot(2,2,1)
imshow(rgb)
title('origin')
subplot(2,2,2)
imshow(rgb1)
title('resize1')
subplot(2,2,3)
imshow(rgb2)
title('resize2')
subplot(2,2,4)
imshow(rgb3)
title('resize3')