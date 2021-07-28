clc,clear,close all;

rgb = im2double(imread('flower1.jpg'));

noise = imnoise(zeros(size(rgb)), 'gaussian', 0, 0.0001);
LEN = 30;
THETA = 45;
PSF = fspecial('motion', LEN, THETA);

blurred = imfilter(rgb, PSF, 'circular');
bg = blurred + noise;

wnr11 = deconvwnr(rgb, PSF);
wnr12 = deconvwnr(blurred, PSF);
wnr13 = deconvwnr(bg, PSF); 

Sn = abs(fft2(noise)).^2;
nA = sum(Sn(:)) / numel(noise);
SI = abs(fft2(rgb)).^2;
IA = sum(SI(:)) / numel(rgb);
R = nA / IA;

wnr21 = deconvwnr(rgb, PSF, R);
wnr22 = deconvwnr(blurred, PSF, R);
wnr23 = deconvwnr(bg, PSF, R);

figure 
subplot 331
imshow(rgb)
title('Original');
subplot 334
imshow(blurred)
title('Blurred');
subplot 337
imshow(bg)
title('Blurred + Noise')
subplot 332
imshow(wnr11)
subplot 335
imshow(wnr12);
subplot 338
imshow(wnr13);
subplot 333
imshow(wnr21);
subplot 336 
imshow(wnr22);
subplot 339
imshow(wnr23);

