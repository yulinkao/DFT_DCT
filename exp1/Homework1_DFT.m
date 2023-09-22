
clear all;
I0 = imread('tridog.jpg');
I1 = rgb2gray(I0);

dft=myDft(double(I1));
idft=myiDft(double(dft)/255);

subplot(1,3,1);imshow(I0),title('Original');
subplot(1,3,2);imshow(log(abs(double(dft)/255))),title('DFT');
subplot(1,3,3);imshow(idft),title('iDFT');

imwrite(log(abs(double(dft)/255)),'DFT.jpg');
imwrite(idft,'iDFT.jpg');
