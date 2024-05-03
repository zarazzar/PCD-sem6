I = imread("image_test.jpg");

%gaussian noise
mu = 0;
sigma = 0.05;
gauss_noise = random("Normal", mu, sigma, size(I));
img_gauss = im2double(I) + gauss_noise;
img_gauss = im2uint8(img_gauss);

%f = fspacial('average' , [5 5]); %filter ukran 5x5
f = fspecial('average'); %filter ukuran 3x3
hasil = imfilter(img_gauss, f, 'symmetric');

figure,
subplot(1,3,1), imshow(I), title('original image');
subplot(1,3,2), imshow(img_gauss), title('gauss noise');
subplot(1,3,3), imshow(hasil), title('citra hasil restorasi');
