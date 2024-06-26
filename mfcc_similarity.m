function mfcc_s = mfcc_similarity(signal1,fs1,signal2,fs2)

    [mfccs1,~,~,~] = mfcc(signal1, fs1,Window=hamming(4096,"periodic"),OverlapLength=2048);
    [mfccs2,~,~,~] = mfcc(signal2, fs2,Window=hamming(4096,"periodic"),OverlapLength=2048);
    
    [~,length]=size(mfccs1);
    cs = zeros(length,1);
    
    for i = 1:length
        m1 = mfccs1(:,i);
        m2 = mfccs2(:,i);
        csm = dot(m1, m2) / (norm(m1) * norm(m2)); 
        cs(i) = csm;
    end

    mfcc_s = 1 - mean(cs);
end