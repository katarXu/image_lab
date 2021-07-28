clc,clear,close all

rgb = imread('Girl.bmp');
rgb1 = imnoise(rgb, 'salt & pepper', 0.03);
rgb2 = imnoise(rgb, 'gaussian');

d0 = 50;

i1 = lab46(rgb1, d0);
i2 = lab46(rgb2, d0);
figure
subplot 231
imshow(rgb,[])
subplot 232
imshow(rgb1)
subplot 233
imshow(i1)
subplot 235
imshow(rgb2)
subplot 236
imshow(i2)

function [new] = lab46(old, d0)
    i1 = fft2(double(old));
    i2 = fftshift(i1);
    new = i2;
    [M, N] = size(i2);
    m = fix(M / 2);
    n = fix(N / 2);
    for i = 1 : M
        for j = 1 : N
            d = sqrt((i - m)^2 + (j - n)^2);
            if d >= d0
                new(i, j) = 0;
            end
        end
    end
    new = uint8(real(ifft2(ifftshift(new))));
end
