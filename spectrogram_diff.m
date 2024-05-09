function spectrogramgram_diff = spectrogram_diff(signal1,signal2)  
    s1 = spectrogram(signal1);
    s2 = spectrogram(signal2);
    A = abs(s1-s2);
    spectrogramgram_diff = sum(A,"all") ;
end