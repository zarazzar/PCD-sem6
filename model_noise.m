%model noise

clear;
clc;

load('randomVariabel');
rng(s);

I = imread("image_test.jpg");

%gaussian noise
mu = 0;
sigma = 0.05;
gauss_noise = random("Normal", mu, sigma, size(I));
img_gauss = im2double(I) + gauss_noise;
img_gauss = im2uint8(img_gauss);


%salt n paper noise
li = randperm(length(I(:)));
noise_sp = I;
noise_sp(li(1:(end/5))) = 255;
noise_sp(li(1:(end/10))) = 0;

%uniform noise
noise_uniform = random('Uniform', 0.1, 0.1, size(I));
img_uniform = im2double(I) + noise_uniform;
img_uniform = im2uint8(img_uniform);

%exponential noise
noise_exp = random('Exponential', 10, size(I));
img_exp = uint8(noise_exp);
img_exp = I + img_exp;

%gamma noise
noise_gamma = random('Gamma', 2,10, size(I));
img_gamma = uint8(noise_gamma);
img_gamma = I+img_gamma;

%Rayleigh Noise
noise_rayleigh = random('Rayleigh', 15, size(I));
img_ray = uint8(noise_rayleigh);
img_ray = I + img_ray;

%periodic noise
s = size(I);
[x,y] = meshgrid(1:s(1), 1:s(2));
p = sin(x/3+y/5)+1;
periodic_noise = (im2double(I)+p'/2)/2;

figure;
subplot(3, 3, 1); imshow(I); title('Original Image');
subplot(3, 3, 2); imshow(img_gauss); title('Gaussian Noise');
subplot(3, 3, 3); imshow(noise_sp); title('Salt and Pepper Noise');
subplot(3, 3, 4); imshow(img_uniform); title('Uniform Noise');
subplot(3, 3, 5); imshow(img_exp); title('Exponential Noise');
subplot(3, 3, 6); imshow(img_gamma); title('Gamma Noise');
subplot(3, 3, 7); imshow(img_ray); title('Rayleigh Noise');
subplot(3, 3, 8); imshow(periodic_noise); title('periodic Noise');
