% Vertaillaan annettuja ääniä 
function output = vertaile_aania(s1,s2)
    % Näytteenottotaajuus
    fs = 48000;

    % highpass lowpass
    %s1 = highpass(s1,700,fs);
    %s2 = highpass(s2,700,fs);
    %s1 = lowpass(s1);
    %s2 = lowpass(s2);
  
    % Alkamaan samasta kohtaa
    [s1,s2] = alignsignals(s1,s2);

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
    rmse_s     = rmse(s1, s2); % Suoraan matlabin oma
    mfcc_s     = mfcc_similarity(s1,fs,s2,fs); 
    esr_s      = esr(s1,s2); 
    fft_s      = FFTs(s1,s2);
    psd_s      = PSD(s1,fs,s2,fs);
    spec       = spectrogram_diff(s1,s2);
    
    output = {"MFCC", "RMSE", "ESR", "PSD", "FFT", "Spectrogram";
               mfcc_s, rmse_s, esr_s, psd_s, fft_s, spec};

end