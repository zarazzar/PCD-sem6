%geometric mean filter
 
I = imread('image_test.jpg');

%gaussian noise
%gaussian noise
mu = 0;
sigma = 0.05;
gauss_noise = random("Normal", mu, sigma, size(I));
img_gauss = im2double(I) + gauss_noise;
img_gauss = im2uint8(img_gauss);

img_geo = uint8(nlfilter(double(img_gauss),[3 3], @fungsi_geometric));

figure,
subplot(1,3,1), imshow(I), title('original image');
subplot(1,3,2), imshow(img_gauss), title('gaus img');
subplot(1,3,3), imshow(img_geo), title('geo image');
