clc,clear,close all

rgb = imread('cameraman.bmp');

k1 = 80;
k2 = 20;
i1 = split(rgb, k1);
i2 = combine(rgb, i1, k2);
i2 = combine(rgb, i2, k2);
i2 = combine(rgb, i2, k2);
figure
subplot 131
imshow(rgb)
subplot 132
imshow(i1)
subplot 133
imshow(i2)

function [new] = split(old, k)
    [m, n] = size(old);
    new = old;
    if m <= 2 || n <= 2
        return
    end
    c1 = sum(old(:)) / (m * n);
    c2 = sum(sum((old - c1).^2)) / (m * n);
    if c2 > k
        mm = fix(m / 2);
        mn = fix(n / 2);
        new = [
            split(old(1 : mm, 1 : mn), k) split(old(1 : mm, mn + 1 : n), k)
            split(old(mm + 1 : m, 1 : mn), k) split(old(mm + 1 : m, mn + 1 : n), k)
        ];
        new(mm, 1 : n) = 255 * ones(1, n);
        new(1 : m, mn) = 255 * ones(m, 1);
    end
end

function [new] = combine(old, sp, k)
    [m, n] = size(old);
    mark = zeros(m, n);
    new = sp;
    for i = 1 : 2 : m
        for j = 1 : 2 : n
            if mark(i, j) == 1
                continue
            end
            [a, b] = getBoundary(new, i, j);
            mark(i : a + 1, j : b + 1) = ones(a - i + 2, b - j + 2);
            [c0, c1] = H(old, i, a + 1, j, b + 1);
            i1 = a + 2;
            if i1 <= m
                j1 = j;
                while j1 <= b
                    [a1, b1] = getBoundary(new, i1, j1);
                    [c2, c3] = H(old, i1, a1 + 1, j1, b1 + 1);
                    if abs(c0 - c2) < k && abs(c1 - c3) < k
                        new(a + 1, j1 : b1) = old(a + 1, j1 : b1);
                    end
                    j1 = b1 + 2;
                end
            end
            j1 = b + 2;
            if j1 <= n
                i1 = i;
                while i1 <= a
                    [a1, b1] = getBoundary(new, i1, j1);
                    c2 = H(old, i1, a1 + 1, j1, b1 + 1);
                    if abs(c0 - c2) < k && abs(c1 - c3) < k
                        new(i1 : a1, b + 1) = old(i1 : a1, b + 1);
                    end
                    i1 = a1 + 2;
                end
            end
        end
    end
end


function [a, b] = getBoundary(new, i, j)
    [m, n] = size(new);
    a = i;
    b = j;
    while a + 1 <= m && new(a + 1, j) ~= 255
        a = a + 2;
    end
    while b + 1 <= n && new(i, b + 1) ~= 255
        b = b + 2;
    end
    while a > m
        a = a - 2;
    end
    while b > n
        b = b - 2;
    end
end


function [a, b] = H(old, a1, a2, b1, b2)
    n = (a2 - a1 + 1) * (b2 - b1 + 1);
    a = sum(sum(old(a1 : a2, b1 : b2))) / n;
    b = sum(sum((old(a1 : a2, b1 : b2) - a).^2)) / n;
end