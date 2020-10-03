%M = 32;
%d = [0:M-1];
%y = qammod(d,M);
%scatterplot(y);

clc;clear;close all;
M = 16;
bb = log2(M);
N=4000;
x = randi([0,1],1,N);
yy=[];
for i=1:4:length(x)
    if x(i)==0 && x(i+1)==0 && x(i+2)==1 && x(i+3)==0
        y=-3+1j*3;
    elseif x(i)==0 && x(i+1)==1 && x(i+2)==1 && x(i+3)==0
        y=-1+1j*3;
    elseif x(i)==0 && x(i+1)==0 && x(i+2)==1 && x(i+3)==1
        y=-3+1j*1;
    elseif x(i)==0 && x(i+1)==1 && x(i+2)==1 && x(i+3)==1
        y=-1+1j*1;
    elseif x(i)==1 && x(i+1)==1 && x(i+2)==1 && x(i+3)==0
        y=1+1j*3;
    elseif x(i)==1 && x(i+1)==0 && x(i+2)==1 && x(i+3)==0
        y=3+1j*3;
    elseif x(i)==1 && x(i+1)==1 && x(i+2)==1 && x(i+3)==1
        y=1+1j*1;
    elseif x(i)==1 && x(i+1)==0 && x(i+2)==1 && x(i+3)==1
        y=3+1j*1;
    elseif x(i)==0 && x(i+1)==0 && x(i+2)==0 && x(i+3)==1
        y=-3-1j*1;
    elseif x(i)==0 && x(i+1)==1 && x(i+2)==0 && x(i+3)==1
        y=-1-1j*1;
    elseif x(i)==0 && x(i+1)==0 && x(i+2)==0 && x(i+3)==0
        y=-3-1j*3;
    elseif x(i)==0 && x(i+1)==1 && x(i+2)==0 && x(i+3)==0
        y=-1-1j*3;
    elseif x(i)==1 && x(i+1)==1 && x(i+2)==0 && x(i+3)==1
        y=1-1j*1;
    elseif x(i)==1 && x(i+1)==0 && x(i+2)==0 && x(i+3)==1
        y=3-1j*1;
    elseif x(i)==1 && x(i+1)==1 && x(i+2)==0 && x(i+3)==0
        y=1-1j*3;
    elseif x(i)==1 && x(i+1)==0 && x(i+2)==0 && x(i+3)==0
        y=3-1j*3;
    end
    yy=[yy y];
end

scatterplot(yy)

EbN0dB=10; %RUIDO
EbN0=10^(EbN0dB/10);
n=(1/sqrt(2))*[randn(1,length(yy))+sqrt(-1)*randn(1,length(yy))];
sigma=sqrt(1/((log2(M))*EbN0));
r=yy+sigma*n;

%scatterplot(r)

