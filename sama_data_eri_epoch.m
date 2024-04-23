function output = sama_data_eri_epoch(P)
    [qwe,input_nimi,asd] = fileparts(P);
    output = './data/output-metal-rock.wav';
    [op, ] = audioread(output);
    meta_text = fileread(fullfile(P,"meta.json"));
    meta_data = jsondecode(meta_text);
    S = dir(fullfile(P,'*.wav'));
    audiolkm = numel(S);
    %audiot = ones(audiolkm,1);
    %%
    clc;
    % HUOM: 
    % MITTAREIDEN LUKUMÄÄRÄ = 5
    % +epoch-sarake=1
    % +CT-sarake=1
    % +inputin nimi=1
    mittari_lkm=5;
    muut_sarakkeet=3;
    sarakkeet = {"MFCC","RMSE","ESR","MSE","PSD","Epochit","CT","input_nimi"};
    tulokset = ones(audiolkm,mittari_lkm+muut_sarakkeet);
    for k = 1:audiolkm
        F = fullfile(P,S(k).name);
        [y,] = audioread(F);
        tulos = vertaile_aania(op,y,S(k).name);
        tulokset(k,1:5) = tulos;
        [asd,nimi,qwe] = fileparts(F);
        epochs = getfield(meta_data,nimi,"epochs");
        ct = getfield(meta_data,nimi,"CT");
        tulokset(k,mittari_lkm+1) = epochs;
        tulokset(k,mittari_lkm+2) = ct;
    end
    %%
    tulokset = sortrows(tulokset,6);

    f = figure('visible','off');
    for k=1:mittari_lkm
        subplot(2,3,k)
        x = tulokset(:,mittari_lkm+1)';
        y = tulokset(:,k);
        plot(x,y)
        title(strcat(input_nimi,': ',sarakkeet{k}))
        xlabel('Epochit');
    end
    
    mkdir('output')
    exportgraphics(f,strcat("C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\output\",input_nimi,".pdf"));
    tcell = num2cell(tulokset);
    
    nimi_sarake = cell(1,audiolkm);
    for k=1:audiolkm
        nimi_sarake{1,k} = input_nimi;
    end
        
    tcell(:,mittari_lkm+muut_sarakkeet) = nimi_sarake;

    output = [sarakkeet; tcell];
    writecell(output,strcat("C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\output\",input_nimi,".txt"),'Delimiter','comma');

end