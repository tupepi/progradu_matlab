function spektrogrammi = spektrogrammi(P1,P2,T,F,t)  
    figure;
    imagesc(T,F,pow2db(P1)-pow2db(P2))
    axis xy
    xlabel("Samples")
    ylabel("Frequency (Hz)")
    title(t);   
    colorbar
end