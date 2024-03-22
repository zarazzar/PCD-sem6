clear; clc;

img1 = imread("office_1.jpg");
img1 =rgb2gray(img1);
img2 = imread("office_3.jpg");
img2 = rgb2gray(img2);

normHist2 = imhist(img2)./numel(img2);


%histogram
HS_1 = histeq(img1,normHist2);
HS_2 = imhistmatch(img1,img2,256);

%tampilkan citra asli dan hasil, histoghram asli dan hasil , cdf asli dan
%hasil
figure;
subplot(2,2,1),imshow(img1), title ('img 1');
subplot(2,2,2),imshow(img2), title ('img 1');
subplot(2,2,3),imhist(HS_1), title ('HS 1');
subplot(2,2,4),imhist(HS_2), title ('HS 2');
