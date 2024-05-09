path = './data/output-metal-rock.wav';
[op, ] = audioread(path );
pathA  = 'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\inputA\inputA_300epochs.wav';
[iA, ] = audioread(pathA );
pathB  = 'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\input4\input4_1epochs.wav';
[iB, ] = audioread(pathB );
path0  = 'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\input0\input0_300epochs.wav';
[i0, ] = audioread(path0 );

%%
close all;

[~,F,T,P]  = spectrogram(op,'yaxis');
[~,FA,TA,PA]  = spectrogram(iA,'yaxis');
[~,FB,TB,PB]  = spectrogram(iB,'yaxis');
[~,F0,T0,P0]  = spectrogram(i0,'yaxis');

F = F / pi * (48000/2);

spektrogrammi(P,PA,T,F,"inputA");
spektrogrammi(P,PB,T,F,"inputB");
spektrogrammi(P,P0,T,F,"input0");

