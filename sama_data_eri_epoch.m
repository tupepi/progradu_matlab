% Argumenttina hakemiston nimi, josta sitten haetaan kaikki wav-tiedostot
% ja meta.json tiedosto ja vertaillaan äänitteitä kovakoodattuun
% äänitteeseen
% Tallentaa vertailudatat kuvaajina ja txt-tiedostoom
function output = sama_data_eri_epoch(P)
    % Ladataan annetusta hakemistosta kaikki äänitteet ja meta-tiedot
    [~,input_nimi,~] = fileparts(P);
    meta_text = fileread(fullfile(P,"meta.json"));
    meta_data = jsondecode(meta_text);
    S = dir(fullfile(P,'*.wav'));
    audiolkm = numel(S);

    % Ladataan äänite johon verrataan aiemmin ladattuja
    output = './data/output-metal-rock.wav';
    [op, ] = audioread(output);
    

    % Nämä varmistetaan myöhemmin oikeiksi
    mittari_lkm=4;
    sarake_lkm=8;

    % käydään läpi kaikki äänitteet ja verrataan testidataan
    for k = 1:audiolkm
        F = fullfile(P,S(k).name);
        [y,] = audioread(F);
        tulos = vertaile_aania(op,y);
        if (k == 1)
            % Ekalla kerralla varmistetaan sarakkeiden ja mittareiden lkm
            sarakkeet = {tulos{1,:}};
            [~,mittari_lkm] = size(sarakkeet);

            % Lisätää meta-tiedoista sarakkeita
            sarakkeet = [sarakkeet,{"Epochit","CT","input_nimi"}];
            [~,sarake_lkm] = size(sarakkeet);
            tulokset = cell(audiolkm,sarake_lkm);
        end

        % sijoitetaan vertailu data
        tulokset(k,1:mittari_lkm) = tulos(2,:);
        
        % Sijotetaan muu data
        [~,nimi,~] = fileparts(F);
        epochs = getfield(meta_data,nimi,"epochs");
        ct = getfield(meta_data,nimi,"CT");
        tulokset{k,mittari_lkm+1} = epochs;
        tulokset{k,mittari_lkm+2} = ct;
    end
    % Järjestellään epoch järjestyksessä HUOM: luotetaan että epoch sarake
    % on heti vertailu-sarakkeiden jälkeen
    tulokset = sortrows(tulokset,mittari_lkm+1);
    
    % Kuvaajat kustakin inputista epochit x-akselilla
    f = figure('visible','off');
    for k=1:mittari_lkm
        subplot(2,3,k)
        x = [tulokset{:,mittari_lkm+1}];
        y = [tulokset{:,k}];
        plot(x,y)
        title(strcat(input_nimi,': ',sarakkeet{k}))
        xlabel('Epochit');
    end
    
    % Tallennetaan tiedostoksi kuvaaja
    mkdir('output')
    exportgraphics(f,strcat("C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\output\",input_nimi,".pdf"));
    

    % Lisätää sarake, jossa on inputin nimi
    % Helpottaa myöhemmin kun voidaan ottaa yksi rivi sellaisenaan
    nimi_sarake = cell(1,audiolkm);
    for k=1:audiolkm
        nimi_sarake{1,k} = input_nimi;
    end
        
    tulokset(:,sarake_lkm) = nimi_sarake;
    
    % ja tallenetaan tiedostoon koko homma
    output = [sarakkeet; tulokset];
    writecell(output,strcat("C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\output\",input_nimi,".txt"),'Delimiter','comma');
end