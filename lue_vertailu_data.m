clc;
P = "C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\output";
S = dir(fullfile(P,'*.txt'));
malli = readcell(fullfile(S(1).folder,S(1).name));
[r,s]=size(malli);
C = cell(r,s,length(S));
for k = 1:length(S)
        F = fullfile(S(k).folder,S(k).name);
        C(:,:,k) = readcell(F);        
end

% C(:,:,k) kaikki inputit
[rivit,sarak,input_lkm] = size(C);

% +1 otsakkeelle
samat_kestot = cell(input_lkm+1,sarak);

% input7 koulutuksen 100 epoch kesti 273 sekuntia, mikä oli pisin
% seitsemäsosalle
kesto = 274.0;

for k = 1:input_lkm
    if (k==1)
        samat_kestot(1,:) = C(1,:,k);
    end
    
    input = C(:,:,k);
    % Tässä voitaisin iffitellä että 7-sarake on CT
    rivinkesto = 0;
    halutturivi = 2;
    for j = 2:rivit
        uudenrivinkesto = input{j,7};
        if (uudenrivinkesto < kesto && abs(rivinkesto-kesto) > abs(uudenrivinkesto-kesto))
            rivinkesto = uudenrivinkesto;
            halutturivi = j;
        else           
            break;
        end
    end
    samat_kestot(k+1,:) = input(halutturivi,:);
end

figure(1);
t = tiledlayout(2,3);
for i = 1:5
    X = categorical(reshape([samat_kestot(2:input_lkm+1,8)],[1 10]));
    X = reordercats(X,reshape([samat_kestot(2:input_lkm+1,8)],[1 10]));
    Y = cell2mat(samat_kestot(2:input_lkm+1,i))';
    nexttile(t)
    bar(X,Y);
    yla = max(Y)*1.01;
    ala = min(Y)*0.99;
    rajat = [ala yla];

    ylim([ala yla]);
    title(samat_kestot{1,i});
    
end