function [ copy ] = BitReverseCopy( vec )
    vec=double(vec);
    n = length(vec);
    copy = zeros(1, n);
    bitn = log2(n);
    for i = 0 : n - 1
        revi = bin2dec(fliplr(dec2bin(i, bitn)));
        copy(revi + 1) = vec(i + 1);
    end
end