function [ ifft_m ] = IterativeIFFT( vec )
    vec=double(vec);
    clear i;
    n = length(vec);
    ifft_m = BitReverseCopy(vec);
    for s = 1 : log2(n)
        m = power(2, s);
        wm = exp(2 * pi * i / m);
        for k = 0 : m : n - 1
            w = 1;
            for j = 0 : m / 2 - 1
                t = w * ifft_m(k + j + m / 2 + 1);
                u = ifft_m(k + j + 1);
                ifft_m(k + j + 1) = u + t;
                ifft_m(k + j + m / 2 + 1) = u - t;
                w = w * wm;
            end
        end
    end
    ifft_m = ifft_m ./ n;
end