clear all;
close all;

senal = input("Ingrese los bits :",'s');

bits=[];
for x = 1:length(senal)
    bits(end+1)=str2double(senal(x));
end

menTiempo = "Por favor ingrese el tiempo :";    
tiempoing =str2double(input(menTiempo,'s'));
informacion=[]; 

%Desfase OPSK
P1=pi/4; % 45 Grados
P2=0.75*pi; % 135 Grados
P3=1.25*pi; % 225 Grados
P4=1.75*pi; % 315 Grados
%Definicion de Frecuencias y periodos
f=1;
fs=1000;
t=0:1/fs:1; % Periodo para la senal digital y portadora
t1=0:1/fs:2; % Periodo para la senal QPSK
%Definicion de variable a usar
tiempo=[];
tiempo1=[];
Digital=[];
Portadora=[];
QPSK=[];
% Secuencia de datos
for i=1:1:length(bits)
    if bits(i)==0
        z=zeros(1,length(t));
        Digital = [Digital z];
    end
    
    if bits(i)==1
        o=ones(1,length(t));
        Digital = [Digital o];
    end
    
    % Portadora
    Portadora=[Portadora (sin(2*pi*f*t))];
    tiempo=[tiempo t];
    t= t+1;
  
end
%Senal QPSK
for ii=1:2: length(bits)
    
    % Caso 1 = 00 Desfase de 45
    if bits(ii)==0 && bits(ii+1)==0
        bits00= sin(2*pi*f*t1 + P1);
        QPSK=[QPSK (bits00)];
    end
        
    % Caso 2 = 10 Desfase de 135
    if bits(ii)==1 && bits(ii+1)==0
        bits10= sin(2*pi*f*t1 +P2);
        QPSK=[QPSK (bits10)];
    end
    
    % Caso 3 = 10 Desfase de 225
    if bits(ii)==1 && bits(ii+1)==1
        bits11= sin(2*pi*f*t1 +P3);
        QPSK=[QPSK (bits11)];
    end
    
    % Caso 4 = 10 Desfase de 315
    if bits(ii)==0 && bits(ii+1)==1
        bits01= sin(2*pi*f*t1 +P4);
        QPSK=[QPSK (bits01)];
    end
    
    tiempo1= [tiempo1 t1];
    t1=t1+2;
    
end
% ESPECTRO -----------------------------------------------------
for n=1:1:length(bits)
    if bits(n)==1;
       se=ones(1,100);
    else bits(n)==0;
        se=zeros(1,100);
    end
     informacion=[informacion se];
end

zdouble = fft(QPSK);
zdouble = abs(zdouble(1:length(zdouble)/2+1));
frqdouble = [0:length(zdouble)-1]*fs/length(zdouble)/2;
    
 % Representacion de las senales
 
   % QPSK
   subplot(2,1,1);
   plot(tiempo1*tiempoing,QPSK,'lineWidth',2.5);   
   title('QPSK');
   axis([0 8*tiempoing -1.5 1.5]);
   grid on;
     
   %ESPECTRO
    subplot(2,1,2);
    plot(frqdouble/tiempoing,zdouble);
    title("Espectro")
    grid on;