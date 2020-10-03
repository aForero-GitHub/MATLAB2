%MODULADOR 16-QAM y 32-QAM

%M = 32; %cambie 32 por 16
%d = [0:M-1];
%y = qammod(d,M);
%scatterplot(y);

%%
%Modulador 16-QAM CON RUIDO-----------------------------------------------
clc;clear;close all;
M = 16;
N=4000;
x = randi([0,1],1,N);
vectory=[];
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
    vectory=[vectory y];
end

%scatterplot(yy)

ruido=10; %RUIDO
rud=10^(ruido/10);
n=(1/sqrt(2))*[randn(1,length(vectory))+sqrt(-1)*randn(1,length(vectory))];
clc=sqrt(1/((log2(M))*rud));
d=vectory+clc*n;

scatterplot(d)

%%Modulador 16-QAM CON RUIDO-----------------------------------------------

