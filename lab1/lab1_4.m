clc,clear,close all;

fixed = imread('alphabet1.jpg');
moving = imread('alphabet2.jpg');
[movingPoints,fixedPoints] = cpselect(moving,fixed,'Wait',true);

tform = fitgeotrans(movingPoints,fixedPoints,'projective');
Jregistered = imwarp(moving,tform,'OutputView',imref2d(size(fixed)));
f = figure()
subplot(2,2,1)
imshow(fixed)
title('origin')
subplot(2,2,2)
imshow(moving)
title('moving')
subplot(2,2,3)
imshowpair(fixed,Jregistered)
