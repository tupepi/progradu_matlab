clc;
% ajamalla main.m-scripti saadaan txt-tiedosto jossa on dataa äänitteistä
% Tämä tiedosto vertaa eri äänitteiden datoja keskenään

% Haetaan data
P = "C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\output";
S = dir(fullfile(P,'*.txt'));

inputA = readcell(fullfile(P,"inputA.txt"));
inputB = readcell(fullfile(P,"inputB.txt"));
input0 = readcell(fullfile(P,"input0.txt"));
%inputK = readcell(fullfile("C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\data\kohinainen.txt"));
kestot = [1321 1497 1495 ];
lkm = 3;

tulos_rivit = lkm+1;
[~,sarakkeita] = size(readcell(fullfile(S(1).folder,S(1).name)));
eri_kestot = cell(tulos_rivit,sarakkeita);


for k = 1:lkm   
    switch k
        case 1
            input = inputA;
        case 2
            input = inputB;
        case 3
            input = input0;
    end
    [rivit,sarak] = size(input);
   
    % Alustetaan ekalla kierrolla yläsarake
    if (k==1)
        eri_kestot(1,:) = input(1,:,k);
    end
  
    % iffitellään että 7-sarake on CT
    CT_sarake = 1;
    for i = 1:sarak
        if (eri_kestot(1,i)=="CT")
            CT_sarake = i;
        end
    end
    
    % Kyseisen rivin kesto
    rivinkesto = 0;
    % indeksi jolla rivillä on sopivan kestoinen koulutus
    halutturivi = 2;
    haluttukesto = kestot(k);
    for j = 2:rivit
        uudenrivinkesto = input{j,CT_sarake};
        % jos rivin kesto on pienempi kuin haluttu kesto ja se on lähempänä
        % haluttua kestoa kuin aiempi ideaali kesto
        if (uudenrivinkesto <= haluttukesto && abs(rivinkesto-haluttukesto) > abs(uudenrivinkesto-haluttukesto))
            rivinkesto = uudenrivinkesto;
            halutturivi = j;
        else           
            break;
        end
    end
    % pistetään talteen
    eri_kestot(k+1,:) = input(halutturivi,:);
end

f = figure;%('units','normalized','outerposition',[0 0 1 1]);
t = tiledlayout(3,3);

% käännetään sarakkeet ja rivit päikseen
%tulokset = cell(sarak-1,tulos_rivit);
tulokset = rot90(eri_kestot);
[rivit, sarak] = size(tulokset);
  
for i = 2:rivit
    
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

mkdir('output_eri_aika');
writecell(tulokset,strcat("C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\output_eri_aika\", "eri_inputit",".txt"),'Delimiter','comma');
exportgraphics(f,strcat("C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\output_eri_aika\","eri_inputit",".pdf"));
    