function spektrogrammi = spektrogrammi(P1,P2,T,F,t)  
    f = figure;
    colormap gray;    
    
    P = abs(pow2db(P1)-pow2db(P2));
    P = P/max(P(:))+min(P(:));
    imagesc(T,F,P);
    axis xy
    xlabel("Samples")
    ylabel("Frequency (Hz)")
    title(t);   
    colorbar
    %mkdir('spectrogram');
    exportgraphics(f,strcat("C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\spectrogram\",t,"_spectrogram",".pdf"));
end