function output = vertaile_aania(s1,s2,str)
    fs = 48000;
    
    % highpass lowpass
    %s1 = lowpass(highpass(s1,60,fs),17000,fs);
    %s2 = lowpass(highpass(s2,60,fs),17000,fs);

    % Joku normalisointi voisi olla paikallaan
    %s1 = normalize(s1(:,1),"scale");
    %s2 = normalize(s2(:,1),"scale");

    % Alkamaan samasta kohtaa
    %[s1,s2] = alignsignals(s1,s2);

   
    % Nollia lyhyemmän perään
    eri_mittaiset = true;
    if (eri_mittaiset)
        if (length(s1) > length(s2))
            s2 = padarray(s2,length(s1)-length(s2),'post');
        else 
            s1 = padarray(s1,length(s2)-length(s1),'post');
        end
    end

    % Vertailtavat mittarit
    mfcc_s     = mfcc_similarity(s1,fs,s2,fs);
    rmse_s     = rmse(s1, s2);
    esr_s      = esr(s1,s2); 
    mse_s      = immse(s1,s2);
    psd_s      = PSD(s1,fs,s2,fs);
    
    
    s = strcat(str,['\n' ...
        'mfcc: %.3f\n' ...
        'rmse: %.3f\n' ...
        'esr: %.3f\n' ...
        'mse: %.3f\n' ...
        'psd: %.3f\n' ...
        '---------------------\n\n']);
    fprintf(s', mfcc_s, rmse_s, esr_s,mse_s,psd_s);

    output = [mfcc_s rmse_s esr_s mse_s psd_s];
end