output = './data/output-metal-rock.wav';
[op, ] = audioread(output);
outputk = './data/output-metal-rock-whitenoise.wav';
[opk, ] = audioread(outputk);
tulos = vertaile_aania(op,opk);

sarakkeet = tulos(1,:);
[~,mittari_lkm] = size(sarakkeet);

% Lisätää meta-tiedoista sarakkeita
sarakkeet = [sarakkeet,{"Epochit","CT","input_nimi"}];
[~,sarake_lkm] = size(sarakkeet);
tulokset = cell(1,sarake_lkm);
tulokset(1,1:mittari_lkm) = tulos(2,:);

input_nimi = "kohinainen";
tulokset{1,mittari_lkm+1} = 0;
tulokset{1,mittari_lkm+2} = 0;
tulokset{1,mittari_lkm+3} = input_nimi;
output = [sarakkeet; tulokset];
writecell(output,strcat("C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\data\",input_nimi,".txt"),'Delimiter','comma');