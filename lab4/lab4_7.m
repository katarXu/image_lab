clc,clear,close all

rgb1 = imread('pout.bmp');
rgb2 = imread('Girl.bmp');

d0 = 50;
nn = 5;

[i1, i2, i3] = lab47(rgb1, d0, nn);
[i4, i5, i6] = lab47(rgb2, d0, nn);
figure
subplot 241
imshow(rgb1,[])
subplot 242
imshow(i1, [])
subplot 243
imshow(i2, [])
subplot 244
imshow(i3, [])
subplot 245
imshow(rgb2,[])
subplot 246
imshow(i4, [])
subplot 247
imshow(i5, [])
subplot 248
imshow(i6, [])

function [new1, new2, new3] = lab47(old, d0, nn)
    i1 = fft2(old);
    i2 = fftshift(i1);
    new1 = i2;
    new2 = i2;
    new3 = i2;
    [M, N] = size(i2);
    m = fix(M / 2);
    n = fix(N / 2);
    for i = 1 : M
        for j = 1 : N
            d = sqrt((i - m)^2 + (j - n)^2);
            if d < d0
                new1(i, j) = 0;
            end
            h1 = 1 / (1 + (2^0.5 - 1) * (d0 / d)^(2 * nn));
            new2(i, j) = new2(i, j) * h1;
            h2 = 1 - exp(-(d.^2)./ (2 * (d0^2)));
            new3(i, j) = new3(i, j) * h2;
        end
    end
    new1 = uint8(real(ifft2(ifftshift(new1))));
    new2 = uint8(real(ifft2(ifftshift(new2))));
    new3 = uint8(real(ifft2(ifftshift(new3))));
end
