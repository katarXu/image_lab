clc,clear,close all

rgb = imread('pout.bmp');

d0 = 50;
nn = 10;
a = 0.5;
b = 0.2;

i1 = lab48(rgb, d0, nn, a, b);
i2 = histeq(i1, 256);
rgb2 = histeq(rgb, 256);
i3 = lab48(rgb2, d0, nn, a, b);
figure
subplot 231
imshow(rgb,[])
subplot 232
imshow(i2, [])
subplot 233
histogram(i2)
subplot 235
imshow(i3,[])
subplot 236
histogram(i3)

function [new] = lab48(old, d0, nn, a, b)
    i1 = fft2(old);
    i2 = fftshift(i1);
    new = i2;
    [M, N] = size(i2);
    m = fix(M / 2);
    n = fix(N / 2);
    for i = 1 : M
        for j = 1 : N
            d = sqrt((i - m)^2 + (j - n)^2);
            h1 = 1 / (1 + (2^0.5 - 1) * (d0 / d)^(2 * nn));
            h2 = a + b * h1;
            new(i, j) = new(i, j) * h2;
        end
    end
    new = uint8(real(ifft2(ifftshift(new))));
end
