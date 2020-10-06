% GRAFICA DE BERvsSNR para PSK
ber = [];
srn = [];
hMod = comm.PSKModulator(32);
hDemod = comm.PSKDemodulator('PhaseOffset',pi/4);
hError = comm.ErrorRate;
for x = -10 : 40
    hAWGN = comm.AWGNChannel('NoiseMethod',... 
    'Signal to noise ratio (SNR)','SNR',x);
    for i = 1 :1000
        data = randi([0 31],250,1);
        modSignal = step(hMod,data);
        noisySignal = step(hAWGN,modSignal);
        receivedData = step(hDemod,noisySignal);
        errorStats = step(hError,data,receivedData);
    end
    ber(end+1)=errorStats(1);
    srn(end+1)=x;
end
%plot(modSignal);
plot(srn,ber,'r');
ylabel("BER");
xlabel("SRN");
title("Error de bits relacion señal ruido 32PSK")
