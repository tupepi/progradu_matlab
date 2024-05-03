function FFT = FFTs(signal1,signal2)  
    % Compute FFT
    S1 = abs(fft(signal1));
    S2 = abs(fft(signal2));
    
    % Compare FFTs
    FFT = 1 - dot(S1, S2) / (norm(S1) * norm(S2));
end