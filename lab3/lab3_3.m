clc,clear,close all

rgb = imread('lena.bmp');
rgb1 = imnoise(rgb, 'salt & pepper', 0.03);
rgb2 = imnoise(rgb, 'gaussian');
rgb3 = randomSaltPepper(rgb1);

rgb11 = MeanFilter(rgb1,3);
rgb21 = MeanFilter(rgb2,3);
rgb31 = MeanFilter(rgb3,3);
figure
subplot(4,2,1)
imshow(rgb)
title('origin')
subplot(4,2,3)
imshow(rgb1)
title('salt & pepper')
subplot(4,2,4)
imshow(rgb11)
subplot(4,2,5)
imshow(rgb2)
title('gaussian')
subplot(4,2,6)
imshow(rgb21)
subplot(4,2,7)
imshow(rgb3)
title('random')
subplot(4,2,8)
imshow(rgb31)

function [new] = randomSaltPepper(old)
    new = old;
    [w, l] = size(old);
    for i = 1 : w
        for j = 1 : l
            if new(i, j) == 255
                new(i, j) = round(rand() * 256);
            end
        end
    end
end


function [new] = MeanFilter(old, N)
    new = old;
    [w, l] = size(old);
    edge = (N - 1) / 2;
    for i = 1 : w
        for j = 1 : l
            temp = zeros(1, N * N);
            cnt = 0;
            for p = max(i - edge, 1) : min(i + edge, w)
                for q = max(j - edge, 1) : min(j + edge, l)
                    cnt = cnt + 1;
                    temp(cnt) = old(p,q);
                end
            end
            temp = sort(temp, 'descend');
            if mod(cnt, 2) == 0
                new(i, j) = (temp(cnt / 2 - 1) + temp(cnt / 2 + 1))/2;
            else
                new(i, j) = temp((cnt + 1) / 2);
            end
        end
    end                         
end