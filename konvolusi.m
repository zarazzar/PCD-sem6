konvolusi1
clear;
clc;

citra = [5 8 3 4 6 2 3 7;
         3 2 1 1 9 5 1 0;
         0 9 5 3 0 4 8 3;
         4 2 7 2 1 9 0 6;
         9 7 9 8 0 4 2 4;
         5 2 1 8 4 1 0 9;
         1 8 5 4 9 2 3 8;
         3 7 1 2 3 4 4 6;
         ];

kernel = [2 1 0; 1 1 -1; 0 -1 -2];

hasil1 = conv2(citra, kernel, 'same')
hasil2 = conv2(citra, kernel, 'valid')
hasil3 = conv2(citra, kernel, 'full')
hasil4 = imfilter(citra, kernel, 'conv', 'same')
hasil5 = imfilter(citra, kernel, 'conv', 'full')

hasil6 = filter2(kernel, citra, 'same')
hasil7 = filter2(kernel, citra, 'valid')
hasil8 = filter2(kernel, citra, 'full')
hasil9 = imfilter(citra, kernel, 'corr', 'same')
hasil10 = imfilter(citra, kernel, 'corr', 'full')

konvolusi2
clear;
clc;

img = imread('cameraman.tif');

%filter_sharpen/Penajaman citra
filter_sharpen = [0 -1 0; -1 5 -1; 0 -1 0];

%filter_edge_detect/Deteksi Tepi
filter_edge = [0 -1 0; -1 4 -1; 0 -1 0];

%Filter Blur
filter_blur1 = 1/9*[1 1 1; 1 1 1; 1 1 1];

%Filter Blur (Gaussian)
filter_blur2 = 1/16*[1 2 1; 2 4 2; 1 2 1];

%Filter Embos
filter_embos = [-2 -1 0; -1 1 1; 0 1 2];

%Lakukan konvolusi terhadap kelima filter diatas menggunakan fungsi
%imfilter kemudian tampilkan  citra asli dan citra hasil
sharpen = imfilter(img,filter_sharpen, 'conv');
edge = imfilter(img, filter_edge, 'conv');
blur1 = imfilter(img, filter_blur1, 'conv');
blur2 = imfilter(img, filter_blur2, 'conv');
embos = imfilter(img, filter_embos, 'conv');

figure, 
subplot(2, 3, 1), imshow(img), title('Original Image')
subplot(2, 3, 2), imshow(sharpen), title('Sharpen')
subplot(2, 3, 3), imshow(edge), title('Edge')
subplot(2, 3, 4), imshow(blur1), title('Blur 1')
subplot(2, 3, 5), imshow(blur2), title('Blur 2')
subplot(2, 3, 6), imshow(embos), title('Embos')


konvolusi3
clear;
clc;

img = imread('cameraman.tif');

%Filter special
A = fspecial('average'); %Filter average/mean
B = fspecial('disk');
%C = fspecial('gasussian')
D = fspecial('laplacian');
E = fspecial('log');
F = fspecial('motion');
G = fspecial('prewitt');
H = fspecial('sobel');

gauss = imgaussfilt(img, 2);

avg = imfilter(img, A, 'conv');
dsk = imfilter(img, B, 'conv');
lpc = imfilter(img, D, 'conv');
log = imfilter(img, E, 'conv');
mtn = imfilter(img, F, 'conv');
prw = imfilter(img, G, 'conv');
sbl = imfilter(img, H, 'conv');

figure, 
subplot(2, 4, 1), imshow(avg), title('Average')
subplot(2, 4, 2), imshow(dsk), title('Disk')
subplot(2, 4, 3), imshow(lpc), title('Laplacian')
subplot(2, 4, 4), imshow(log), title('Log')
subplot(2, 4, 5), imshow(mtn), title('Motion')
subplot(2, 4, 6), imshow(prw), title('prewitt')
subplot(2, 4, 7), imshow(sbl), title('Sobel')
subplot(2, 4, 8), imshow(gauss), title('Gaussian')
