clc,clear,close all

rgb1 = imread('Rect1.bmp');
rgb2 = imread('Rect2.bmp');

i1 = lab42(rgb1);
i2 = lab42(rgb2);
i3 = lab43(rgb1);
i4 = lab43(rgb2);
figure
subplot 241
imshow(rgb1,[])
subplot 242
imshow(i1)
subplot 243
imshow(i3,[])
subplot 244
imshowpair(i1, i3)
subplot 245
imshow(rgb2,[])
subplot 246
imshow(i2)
subplot 247
imshow(i4,[])
subplot 248
imshowpair(i2, i4)

function [new] = lab42(old)
    i1 = fft2(old);
    i2 = fftshift(i1);
    i3 = uint8(log(abs(i2) + 1));
    max1 = double(max(i3(:)))/255;
    i4 = imadjust(i3, [0, max1], []);
    new = ifft2(i4);
end
function [new] = lab43(old)
    i1 = fft2(old);
    new = real(ifft2(angle(i1)));
end