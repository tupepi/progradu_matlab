clc;
% ajamalla main.m-scripti saadaan txt-tiedosto jossa on dataa äänitteistä
% Tämä tiedosto vertaa eri äänitteiden datoja keskenään
% Hakee koulutusajallisesti lähellä toisiaan olevien mallien äänitteet

% Haetaan data
P = "C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\output";
S = dir(fullfile(P,'*.txt'));


% HUOM KOVAKOODATTU!
% 1600 sekuntia
kesto = 1600.0;

% jos 0, vertaillaan normaalisti kestoa vastaavat inputit
% jos 1, vertaillaan muiden kanssa input0 ja 1 epoch
yhden_epochin_vertailu = 0;

% Vertailtavia äänitteitä on length(S)
% +1 otsakkerivin takia
% +1 yhden epochin rivin takia
tulos_rivit = length(S)+1+yhden_epochin_vertailu;
[~,sarakkeita] = size(readcell(fullfile(S(1).folder,S(1).name)));
samat_kestot = cell(tulos_rivit,sarakkeita);


% -2 eikä -1 koska input0 haetaan yhden epochin mallia vastaava
for k = 1:tulos_rivit-1-yhden_epochin_vertailu
    
    % Haetaan inputin kaikki vertailut
    input = readcell(fullfile(S(k).folder,S(k).name));
    [rivit,sarak] = size(input);
   
    % Alustetaan ekalla kierrolla yläsarake
    if (k==1)
        samat_kestot(1,:) = input(1,:,k);
    end
   
    % Otetaanko mukaan input0 ja yhden epochin vertailu
    if (yhden_epochin_vertailu)
        if (input(2,sarak)=="input0")
            for i = 1:sarak
                if (input(1,i)=="Epochit")
                    for j = 2:rivit
                        if (input{j,i}==1)
                            yksiepoch = input(j,:);
                            yksiepoch(1,sarak) = {'input0_1epoch'};
                            samat_kestot(tulos_rivit,:) = yksiepoch;
                        end
                    end
                end
            end
        end
        yhden_epochin_vertailu = 0;
    end

    % iffitellään että 7-sarake on CT
    CT_sarake = 1;
    for i = 1:sarak
        if (samat_kestot(1,i)=="CT")
            CT_sarake = i;
        end
    end
    
    % Kyseisen rivin kesto
    rivinkesto = 0;
    % indeksi jolla rivillä on sopivan kestoinen koulutus
    halutturivi = 2;
    for j = 2:rivit
        uudenrivinkesto = input{j,CT_sarake};
        % jos rivin kesto on pienempi kuin haluttu kesto ja se on lähempänä
        % haluttua kestoa kuin aiempi ideaali kesto
        if (uudenrivinkesto <= kesto && abs(rivinkesto-kesto) > abs(uudenrivinkesto-kesto))
            rivinkesto = uudenrivinkesto;
            halutturivi = j;
        else           
            break;
        end
    end
    % pistetään talteen
    samat_kestot(k+1,:) = input(halutturivi,:);
end

f = figure;%('units','normalized','outerposition',[0 0 1 1]);
t = tiledlayout(3,2);

% käännetään sarakkeet ja rivit päikseen
%tulokset = cell(sarak-1,tulos_rivit);
tulokset = rot90(samat_kestot);
[rivit, sarak] = size(tulokset);
tulokset(:,1:sarak);
for i = 2:rivit
     if (tulokset(i,1) == "Spectrogram")
        continue
     end

    if (i == 3)
        continue
    end

    X = categorical(tulokset(1,2:sarak));
    Y = cell2mat(tulokset(i,2:sarak));
    nexttile(t)
    bar(X,Y);
    yla = max(Y)*1.01;
    ala = min(Y)*0.99;
    rajat = [ala yla];

    ylim([abs(ala) abs(yla)]);
    title(tulokset(i,1));
end

mkdir('output_sama_aika');
writecell(tulokset,strcat("C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\output_sama_aika\", "eri_inputit",".txt"),'Delimiter','comma');
exportgraphics(f,strcat("C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\output_sama_aika\","eri_inputit",".pdf"));
    