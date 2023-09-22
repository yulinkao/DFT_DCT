function [ mfft2 ] = myDft( data )
    h = size(data, 1);
    w = size(data, 2);
    mfft2 = data;
    if power(2, log2(h)) ~= h || power(2, log2(w)) ~= w
        disp('h and w must be the power of 2!')
    else
        for i = 1 : h
            mfft2(i, :) = IterativeFFT(mfft2(i, :));
        end
        for j = 1 : w
            mfft2(:, j) = IterativeFFT(mfft2(:, j));
        end
    end
end