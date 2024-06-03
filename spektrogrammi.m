function spektrogrammi = spektrogrammi(P1,P2,T,F,t)  
    f = figure;
    colormap gray;    
    
    P = abs(pow2db(P1)-pow2db(P2));
    P = (P/96.24);
    %Pmax = max(P,[],"all");
    imagesc(T,F,P);
    clim([0 1]);
    axis xy
    xlabel("Sekunnit")
    ylabel("Taajuus (Hz)")
    xticks(round(T))
    title(t);   
    colorbar
    mkdir('spectrogram');
    exportgraphics(f,strcat("C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\spectrogram\",t,"_spectrogram",".pdf"));
end