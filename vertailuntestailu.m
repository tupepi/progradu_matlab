%% Ladataan tiedostot
fender = './data/fender.wav';
jcm = './data/jcm.wav';
jp2c = './data/jp2c.wav';
nam0 = './data/nam0.wav';
nam1 = './data/nam1.wav';
nam2 = './data/nam2.wav';
nam3 = './data/nam3.wav';
nam4 = './data/nam4.wav';
nam5 = './data/nam5.wav';
nam6 = './data/nam6.wav';
nam7= './data/nam7.wav';
nam67t = './data/6_7-t.wav';
nam57 = './data/nam-5_7.wav';
namb= './data/nam-bonus.wav';
output = './data/output-metal-rock.wav';
ir_polku = './data/V30_SM57.wav'; 

%[fe, ] = audioread(fender);
%[jc, ] = audioread(jcm);
[jp, ] = audioread(jp2c);
[n0, ] = audioread(nam0);
[n1, ] = audioread(nam1);
%[n2, ] = audioread(nam2);
%[n3, ] = audioread(nam3);
[n4, ] = audioread(nam4);
%[n5, ] = audioread(nam5);
%[n6, ] = audioread(nam6);
%[n7, ] = audioread(nam7);
[n67, ] = audioread(nam67t);
%[n57, ] = audioread(nam57);
%[nb, ] = audioread(namb);
[op, ] = audioread(output);

%% testi
testi = ones([50000,1]);

%% Ajetaan vertailu
clc;
%vertaile(testi,testi,'identtiset:');
%vertaile(op,fe,'Fender:');
%vertaile(op,jp,'JP2C:');
%vertaile(op,jc,'JCM:');
%vertaile(op,n0,'0:');
%vertaile(op,n1,'1:');
%vertaile(op,n2,'2:');
%vertaile(op,n3,'3:');
%vertaile(op,n4,'4:');
%vertaile(op,n5,'5:');
%vertaile(op,n6,'6:');
%vertaile(op,n7,'7:');
%vertaile(op,n57,'57:');
vertaile(op,n67,'67t:');
%vertaile(op,nb,'Bonus:');
