function PSD = PSD(signal1,Fs1,signal2,Fs2)  
    % Compute PSDs
    [Pxx1, f1] = periodogram(signal1, hamming(length(signal1)), [], Fs1);
    [Pxx2, f2] = periodogram(signal2, hamming(length(signal2)), [], Fs2);
    
    % Compare PSDs
    PSD = dot(Pxx1, Pxx2) / (norm(Pxx1) * norm(Pxx2));
end