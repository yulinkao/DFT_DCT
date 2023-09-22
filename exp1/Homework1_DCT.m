
clear all;
I0 = imread('tridog.jpg');
I1 = rgb2gray(I0);

dct=myDct(I1);
idct=myiDct(dct)/255;

subplot(1,3,1);imshow(I0);title('original');
subplot(1,3,2);imshow(log(1+abs(dct)));title('DCT');
subplot(1,3,3);imshow(idct);title('iDCT');

imwrite(log(1+abs(dct)),'DFT.jpg');
imwrite(idct,'iDFT.jpg');
