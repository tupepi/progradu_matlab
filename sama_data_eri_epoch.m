function output = sama_data_eri_epoch(P)
    [qwe,input_nimi,asd] = fileparts(P);
    output = './data/output-metal-rock.wav';
    [op, ] = audioread(output);
    meta_text = fileread(fullfile(P,"meta.json"));
    meta_data = jsondecode(meta_text);
    S = dir(fullfile(P,'*.wav'));
    audiolkm = numel(S);
    %%
    clc;
    %sarakkeet = {"MFCC","RMSE","ESR","MSE","PSD","Epochit","CT","input_nimi"};
    mittari_lkm=5;
    sarake_lkm=8;
    for k = 1:audiolkm
        F = fullfile(P,S(k).name);
        [y,] = audioread(F);
        tulos = vertaile_aania(op,y,S(k).name);
        if (k == 1)
            % Ekalla kerralla varmistetaan sarakkeiden ja mittareiden lkm
            sarakkeet = {tulos{1,:}};
            [r,mittari_lkm] = size(sarakkeet);
            sarakkeet = [sarakkeet,{"Epochit","CT","input_nimi"}];
            [r,sarake_lkm] = size(sarakkeet);
            tulokset = cell(audiolkm,sarake_lkm);
        end
        tulokset(k,1:5) = {tulos{2,:}};
        [asd,nimi,qwe] = fileparts(F);
        epochs = getfield(meta_data,nimi,"epochs");
        ct = getfield(meta_data,nimi,"CT");
        tulokset{k,mittari_lkm+1} = epochs;
        tulokset{k,mittari_lkm+2} = ct;
    end
    %%
    tulokset = sortrows(tulokset,mittari_lkm+1);

    f = figure('visible','off');
    for k=1:mittari_lkm
        subplot(2,3,k)
        x = [tulokset{:,mittari_lkm+1}];
        y = [tulokset{:,k}];
        plot(x,y)
        title(strcat(input_nimi,': ',sarakkeet{k}))
        xlabel('Epochit');
    end
    
    mkdir('output')
    exportgraphics(f,strcat("C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\output\",input_nimi,".pdf"));
    
    nimi_sarake = cell(1,audiolkm);
    for k=1:audiolkm
        nimi_sarake{1,k} = input_nimi;
    end
        
    tulokset(:,sarake_lkm) = nimi_sarake;

    output = [sarakkeet; tulokset];
    writecell(output,strcat("C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\output\",input_nimi,".txt"),'Delimiter','comma');

end