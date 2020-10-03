clc;clear;close all;
M = 8;
N=4000;
x = randi([0,1],1,N);
vectory=[];
%Modulador 8-QAM CON RUIDO-----------------------------------------------
for i=1:4:length(x)
    if x(i)==0 && x(i+1)==0 && x(i+2)==1
        y=-3+1j*3;
    elseif x(i)==0 && x(i+1)==1 && x(i+2)==1
        y=-1+1j*1;
    elseif x(i)==1 && x(i+1)==0 && x(i+2)==1
        y=3+1j*3;
    elseif x(i)==1 && x(i+1)==1 && x(i+2)==1
        y=1+1j*1;
    elseif x(i)==0 && x(i+1)==1 && x(i+2)==0
        y=-1-1j*1;
    elseif x(i)==0 && x(i+1)==0 && x(i+2)==0
        y=-3-1j*3;
    elseif x(i)==1 && x(i+1)==1 && x(i+2)==0
        y=1-1j*1;
    elseif x(i)==1 && x(i+1)==1 && x(i+2)==0
        y=1-1j*3;
    elseif x(i)==1 && x(i+1)==0 && x(i+2)==0
        y=3-1j*3;
    end
    vectory=[vectory y];
end

scatterplot(vectory)

ruido=10; %RUIDO
rud=10^(ruido/10);
n=(1/sqrt(2))*[randn(1,length(vectory))+sqrt(-1)*randn(1,length(vectory))];
calc=sqrt(1/((log2(M))*rud));
d=vectory+calc*n;

scatterplot(d)