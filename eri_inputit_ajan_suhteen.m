
close all;
P = "C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\output_kaikki";
S = dir(fullfile(P,'*.txt'));
inputC = readcell("C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\output_kaikki\inputC.txt");
input0 = readcell("C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\output_kaikki\input0.txt");

sizeC = size(inputC);
size0 = size(input0);


xc = 2:sizeC(1,1);
x0 = 2:size0(1,1);

xc = 2:12;
x0 = 2:12;


f = figure;
for k=1:5
        subplot(2,3,k)
        x = cell2mat(inputC(xc,8));
        y = cell2mat(inputC(xc,k));
        plot(x,y);
        hold on;
        x = cell2mat(input0(x0,8));
        y = cell2mat(input0(x0,k));
        plot(x,y);
        title(inputC(1,k))
        xlabel('CT');
        legend('inputC','input0')
end
exportgraphics(f,strcat("C:\Users\tuukk\Desktop\gradu\testidata_vertailtavaksi\output\","cja0",".pdf"));