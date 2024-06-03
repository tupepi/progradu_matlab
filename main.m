% Luodaan vertailudata kunkin syötetiedoston kaikista malleista

% Ladataan äänite johon verrataan aiemmin ladattuja
output = './data/output-metal-rock.wav';
[op, ] = audioread(output);
path = "C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\";
%sama_data_eri_epoch(strcat(path,"input0"),op);
%sama_data_eri_epoch(strcat(path,"input1"),op);
%sama_data_eri_epoch(strcat(path,"input2"),op);
%sama_data_eri_epoch(strcat(path,"input3"),op);
%sama_data_eri_epoch(strcat(path,"input4"),op);
%sama_data_eri_epoch(strcat(path,"input5"),op);
%sama_data_eri_epoch(strcat(path,"input6"),op);
%sama_data_eri_epoch(strcat(path,"input7"),op);
%sama_data_eri_epoch(strcat(path,"inputA"),op);
%sama_data_eri_epoch(strcat(path,"inputB"),op);
%sama_data_eri_epoch(strcat(path,"inputC"),op);
%sama_data_eri_epoch(strcat(path,"inputD"),op);
%sama_data_eri_epoch(strcat(path,"inputE"),op);
%sama_data_eri_epoch(strcat(path,"inputF"),op);
%sama_data_eri_epoch(strcat(path,"inputG"),op);
%%
[z,] = audioread("C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\input0\input0_107epochs.wav");
[c] = audioread("C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\inputC\inputC_125epochs.wav");
tulosz = vertaile_aania(op,z);
tulosc = vertaile_aania(op,c);
