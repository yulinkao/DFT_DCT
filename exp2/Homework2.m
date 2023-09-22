clear all;
I0 = imread('tridog.jpg');
I1 = rgb2gray(I0);

[row,col] = size(I1);
row = round(row/8) * 8; 
col = round(col/8) * 8;
I1 = imresize(I1, [row, col]);

I2 = zeros(row, col);
for i=1:8:row-7
    for j=1:8:col-7
        img_block = I1(i:i+7, j:j+7);
        dct_block = myDct(img_block);
        for m = 1:8;
            for n = 1:8;
                if (m+n)>7 
                    dct_block(m,n)=0;
                end
            end
        end
        I2(i:i+7, j:j+7) = dct_block;
    end
end

I3 = zeros(row,col);
for i=1:8:row-7
    for j=1:8:col-7
        dct_block = I2(i:i+7, j:j+7);
        img_block = myiDct(dct_block);
        I3(i:i+7, j:j+7) = img_block;
    end
end

subplot(1,3,1);imshow(I0);title('Original');
subplot(1,3,2);imshow(I2);title('DCT');
subplot(1,3,3);imshow(mat2gray(I3));title('iDCT');

imwrite(mat2gray(I2),'try0.jpg')
imwrite(mat2gray(I3),'try1.jpg')
