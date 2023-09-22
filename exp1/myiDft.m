function [ mifft2 ] = myIdft( data )
    h = size(data, 1);
    w = size(data, 2);
    mifft2 = data;

    if power(2, log2(h)) ~= h || power(2, log2(w)) ~= w
        disp('h and w must be the power of 2!')    
    else
        for i = 1 : h
            mifft2(i, :) = IterativeIFFT(mifft2(i, :));
        end

        for j = 1 : w
            mifft2(:, j) = IterativeIFFT(mifft2(:, j));
        end
    end
end