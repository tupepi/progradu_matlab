function esr = esr(signal1,signal2)  
    diff = signal1 - signal2;
    [numerator,] = sumsqr(diff);
    denominator = sumsqr(signal1);
    esr = numerator/denominator;
end