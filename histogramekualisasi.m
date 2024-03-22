I = imread('pout.tif');
[countI, binI] = imhist(I);
cI = cumsum(countI)./numel(I);

I_HE = histeq(I); %histogram ekualisasi
[countI_HE, binI_HE] = imhist(I_HE);
cI_HE = cumsum(countI_HE)./numel(I);

figure,
subplot(2,3,1), imshow(I), title("original image");
subplot(2,3,2), imhist(I), title("hist image");
subplot(2,3,3), stairs(0:1:255, cI), title("CDF Original Image");
subplot(2,3,4), imshow(I_HE), title("citra HE");
subplot(2,3,5), imhist(I_HE), title("hist citra HE");
subplot(2,3,6), stairs(0:1:255, cI_HE), title("CDF Citra HE");
