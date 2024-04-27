function mfcc_s = mfcc_similarity(signal1,fs1,signal2,fs2)

    % Compute MFCCs for each signal
    [mfccs1,~,~,~] = mfcc(signal1, fs1);
    [mfccs2,~,~,~] = mfcc(signal2, fs2);
    
    
    % Reshape the MFCC matrices to 1D arrays for similarity calculation
    mfccs1_flat = mfccs1(:);
    mfccs2_flat = mfccs2(:);
    
    % Calculate cosine similarity
    mfcc_s = 1 - dot(mfccs1_flat, mfccs2_flat) / (norm(mfccs1_flat) * norm(mfccs2_flat)); 
end