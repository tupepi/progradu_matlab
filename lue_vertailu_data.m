P = "C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\output";
S = dir(fullfile(P,'*.txt'));
malli = readcell(fullfile(S(1).folder,S(1).name));
[r,s]=size(malli);
C = cell(r,s,length(S));
for k = 1:length(S)
        F = fullfile(S(k).folder,S(k).name);
        C(:,:,k) = readcell(F);        
end