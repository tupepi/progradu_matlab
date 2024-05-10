path = './data/output-metal-rock.wav';
[op, ] = audioread(path );

paths={'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\input0\input0_107epochs.wav', 'input0';
 'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\input1\input1_600epochs.wav', 'input1';
 'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\input2\input2_600epochs.wav', 'input2';
 'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\input3\input3_600epochs.wav', 'input3';
 'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\input4\input4_600epochs.wav', 'input4';
 'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\input5\input5_600epochs.wav', 'input5';
 'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\input6\input6_600epochs.wav', 'input6';
 'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\input7\input7_600epochs.wav', 'input7';
 'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\inputA\inputA_127epochs.wav', 'inputA';
 'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\inputB\inputB_130epochs.wav', 'inputB';
 'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\inputC\inputC_125epochs.wav', 'inputC';
 'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\inputD\inputD_123epochs.wav', 'inputD';
 'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\inputE\inputE_120epochs.wav', 'inputE';
 'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\inputF\inputF_125epochs.wav', 'inputF';
 'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\inputG\inputG_127epochs.wav', 'inputG'};


paths2={ 'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\input0\input0_1epochs.wav', 'input0 1 epoch';
         'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\input0\input0_10epochs.wav', 'input0 10 epochia';
         'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\input0\input0_20epochs.wav', 'input0 20 epochia';
         'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\input0\input0_30epochs.wav', 'input0 30 epochia';
         'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\input0\input0_40epochs.wav', 'input0 40 epochia';
         'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\input0\input0_50epochs.wav', 'input0 50 epochia';
         'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\input0\input0_60epochs.wav', 'input0 60 epochia';
         'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\input0\input0_80epochs.wav', 'input0 80 epochia';
         'C:\Users\tuukk\Desktop\neural-amp-modeler-main\bin\train\output_audio\input0\input0_107epochs.wav', 'input0 107 epochia';
         };

%paths = paths2;
for i=1:length(paths)
    path = paths{i,1};
    title = paths{i,2};
    [a, ] = audioread(path);
    close all;  
    [~,F,T,P]  = spectrogram(op,'yaxis');
    [~,FA,TA,PA]  = spectrogram(a,'yaxis'); 
    F = F / pi * (48000/2);
    spektrogrammi(P,PA,T/48000,F,title);
end




