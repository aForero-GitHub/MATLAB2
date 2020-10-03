function varargout = Lab3(varargin)
% LAB3 MATLAB code for Lab3.fig
%      LAB3, by itself, creates a new LAB3 or raises the existing
%      singleton*.
%
%      H = LAB3 returns the handle to a new LAB3 or the handle to
%      the existing singleton*.
%
%      LAB3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB3.M with the given input arguments.
%
%      LAB3('Property','Value',...) creates a new LAB3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Lab3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Lab3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Lab3

% Last Modified by GUIDE v2.5 01-Sep-2020 23:39:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Lab3_OpeningFcn, ...
    'gui_OutputFcn',  @Lab3_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Lab3 is made visible.
function Lab3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Lab3 (see VARARGIN)

% Choose default command line output for Lab3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Lab3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Lab3_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function bitsG_Callback(hObject, eventdata, handles)
% hObject    handle to bitsG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bitsG as text
%        str2double(get(hObject,'String')) returns contents of bitsG as a double


% --- Executes during object creation, after setting all properties.
function bitsG_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bitsG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tiempo_Callback(hObject, eventdata, handles)
% hObject    handle to tiempo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tiempo as text
%        str2double(get(hObject,'String')) returns contents of tiempo as a double


% --- Executes during object creation, after setting all properties.
function tiempo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tiempo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in graficas.
function graficas_Callback(hObject, eventdata, handles)
% hObject    handle to graficas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bitsG = get(handles.bitsG,'string');
tiempo = str2double(get(handles.tiempo,'string'));

h=[];
for x = 1:length(bitsG)
    h(end+1)=str2double(bitsG(x));
end

n=1;
l=length(h);
h(l+1)=1;
ami=-1;
%NRZ-L--------------------------------------------------------------------------

while n<=length(h)-1;
    t=n-1:0.0001:n;
    if h(n) == 1
        if h(n+1)==1
            y=(t>n);
        else
            y=(t==n);
        end
        axes(handles.axes1);
        d=plot(t*tiempo,y,'B');grid on;
        title('NRZ-L');
        set(d,'LineWidth',1.0);
        hold on;
        axis([0 tiempo*length(h) -1.5 1.5]);
    else
        if h(n+1)==1
            y=(t<n)-0*(t==n);
        else
            y=(t<n)+1*(t==n);
        end
        axes(handles.axes1);
        d=plot(t*tiempo,y,'B');grid on;
        title('NRZ-L');
        set(d,'LineWidth',1.0);
        hold on;
        axis([0 tiempo*length(h) -1.5 1.5]);
    end
    n=n+1;
    %pause;
end
informacion=[];
for n=1:1:length(h)
    if h(n)==1;
        se=ones(1,100);
    else h(n)==0;
        se=zeros(1,100);
    end
    informacion=[informacion se];
end

% espectro
% Compute spectra of both modulated signals.
%transformada rapida de fourier
zdouble = fft(informacion);
zdouble = abs(zdouble(1:length(zdouble)/2));
frqdouble = [0:length(zdouble)-1]*100/length(zdouble)/2/tiempo;

axes(handles.axes3);
%figure;
zoom on;
d=plot(frqdouble/tiempo,zdouble);
title('NRZ-L Espectro');
set(d,'LineWidth',1.0);

%NRZ-L--------------------------------------------------------------------------FIN
bitsG = get(handles.bitsG,'string');
tiempo = str2double(get(handles.tiempo,'string'));

h=[];
for x = 1:length(bitsG)
    h(end+1)=str2double(bitsG(x));
end

l=length(h);
h(l+1)=1;
pulse = 1;
current_level = -pulse;
%NRZ-I--------------------------------------------------------------------------

for bit = 1:length(h)
        % set bit time
        bt=bit-1:0.001:bit;

        if h(bit) == 0
            % binary 0 - keep previous level
            y = (bt<bit) * current_level;
        else
            % binary 1 - change pulse level
            current_level = -current_level;
            y = (bt<bit) * current_level;
        end

        % assign last pulse point by inspecting the following bit
        try
            if h(bit+1) == 1
                y(end) = -current_level;
            else
                y(end) = current_level;
            end
        catch e
            % bitstream end, assume next bit is 1
            y(end) = -current_level;
        end
        axes(handles.axes2);
        d=plot(bt*tiempo, y,'B');grid on;
        title('NRZ-I Espectro');
        set(d,'LineWidth',1.0);
        hold on;
        axis([0 tiempo*length(h) -1.5 1.5]);
    end
informacion=[];
for n=1:1:length(h)
    if h(n)==1;
        se=ones(1,100);
    else h(n)==0;
        se=zeros(1,100);
    end
    informacion=[informacion se];
end

% espectro
zdouble = fft(informacion);
zdouble = abs(zdouble(1:length(zdouble)/2+1));
frqdouble = [0:length(zdouble)-1]*100/length(zdouble)/2/tiempo;

axes(handles.axes4);
d=plot(frqdouble/tiempo,zdouble);
title('NRZ-I Espectro');
set(d,'LineWidth',1.0);


%NRZ-I--------------------------------------------------------------------------FIN

bitsG = get(handles.bitsG,'string');
tiempo = str2double(get(handles.tiempo,'string'));

h=[];
for x = 1:length(bitsG)
    h(end+1)=str2double(bitsG(x));
end
n=1;
l=length(h);
h(l+1)=1;
ami=-1;
%BIPOLAR AMI--------------------------------------------------------------------
while n<=length(h)-1;
    t=n-1:0.001:n;
    disp(t);
    if h(n) == 0
        if h(n+1)==0
            y=(t>n);
        else
            if ami==1
                y=-(t==n);
            else
                y=(t==n);
            end
        end
        axes(handles.axes9);
        d=plot(t*tiempo,y,'B');;grid on;
        title('Bipolar AMI');
        set(d,'LineWidth',1.0);
        hold on;
        axis([0 tiempo*length(h) -1.5 1.5]);
    else
        ami=ami*-1;
        if h(n+1)==0
            if ami==1
                y=(t<n);
            else
                y=-(t<n);
            end
        else
            if ami==1
                y=(t<n)-(t==n);
            else
                y=-(t<n)+(t==n);
            end
            
        end
        axes(handles.axes9);
        d=plot(t*tiempo,y,'B');grid on;
        title('Bipolar AMI');
        hold on;
        set(d,'LineWidth',1.0);
        axis([0 tiempo*length(h) -1.5 1.5]);
        
    end
    n=n+1;
    
end
informacion=[];
bandera=true;
for n=1:1:length(h)
    if h(n)==1;
        if bandera == true
            se=ones(1,100);
            bandera=false;
        else
            se=ones(1,100)*-1;
            bandera=true;
        end
    else h(n)==0;
        se=zeros(1,100);
    end
    informacion=[informacion se];
end

% espectro
% Compute spectra of both modulated signals.
%transformada rapida de fourier
zdouble = fft(informacion);
zdouble = abs(zdouble(1:length(zdouble)/2+1));
frqdouble = [0:length(zdouble)-1]*100/length(zdouble)/2/tiempo;

axes(handles.axes10);
d=plot(frqdouble/tiempo,zdouble);
title('Bipolar Espectro');
set(d,'LineWidth',1.0);

%BIPOLAR AMI--------------------------------------------------------------------FIN

bitsG = get(handles.bitsG,'string');
tiempo = str2double(get(handles.tiempo,'string'));

h=[];
for x = 1:length(bitsG)
    h(end+1)=str2double(bitsG(x));
end
n=1;
l=length(h);
h(l+1)=1;
ami=-1;
%Pseudoternario--------------------------------------------------------------------
while n<=length(h)-1;
    t=n-1:0.001:n;
    if h(n) == 1
        if h(n+1)==1
            y=(t>n);
        else
            if ami==1
                y=-(t==n);
            else
                y=(t==n);
            end
        end
        axes(handles.axes5);
        d=plot(t*tiempo,y,'B');;grid on;
        title('Pseudoternario');
        set(d,'LineWidth',1.0);
        hold on;
        axis([0 tiempo*length(h) -1.5 1.5]);
    else
        ami=ami*-1;
        if h(n+1)==1
            if ami==1
                y=(t<n);
            else
                y=-(t<n);
            end
        else
            if ami==1
                y=(t<n)-(t==n);
            else
                y=-(t<n)+(t==n);
            end
            
        end
        axes(handles.axes5);
        d=plot(t*tiempo,y,'B');grid on;
        title('Pseudoternario');
        hold on;
        set(d,'LineWidth',1.0);
        axis([0 tiempo*length(h) -1.5 1.5]);
        
    end
    n=n+1;
    %pause;
end
informacion=[];
bandera=true;
for n=1:1:length(h)
    if h(n)==0;
        if bandera == true
            se=ones(1,100);
            bandera = false;
        else
            y=ones(1,100)*-1;
            bandera = true;
        end
    else h(n)==1;
        se=zeros(1,100);
    end
    informacion=[informacion se];
end

% espectro
% Compute spectra of both modulated signals.
%transformada rapida de fourier
zdouble = fft(informacion);
zdouble = abs(zdouble(1:length(zdouble)/2+1));
frqdouble = [0:length(zdouble)-1]*100/length(zdouble)/2/tiempo;

axes(handles.axes7);
d=plot(frqdouble/tiempo,zdouble);
title('Pseud. Espectro');
set(d,'LineWidth',1.0);
%Pseudoternario--------------------------------------------------------------------FIN

bitsG = get(handles.bitsG,'string');
tiempo = str2double(get(handles.tiempo,'string'));

h=[];
for x = 1:length(bitsG)
    h(end+1)=str2double(bitsG(x));
end
n=1;
l=length(h);
h(l+1)=1;
%Manchester--------------------------------------------------------------------
while n<=length(h)-1;
    t=n-1:0.001:n;
    if h(n) == 0
        if h(n+1)==0
            y=-(t<n)+2*(t<n-0.5)+1*(t==n);
        else
            y=-(t<n)+2*(t<n-0.5)-1*(t==n);
        end
        axes(handles.axes6);
        d=plot(t*tiempo,y,'B');grid on;
        title('MANCHESTER');
        set(d,'LineWidth',1.0);
        hold on;
        axis([0 tiempo*length(h) -1.5 1.5]);
    else
        if h(n+1)==0
            y=(t<n)-2*(t<n-0.5)+1*(t==n);
        else
            y=(t<n)-2*(t<n-0.5)-1*(t==n);
        end
        axes(handles.axes6);
        d=plot(t*tiempo,y,'B');grid on;
        title('MANCHESTER');
        set(d,'LineWidth',1.0);
        hold on;
        axis([0 tiempo*length(h) -1.5 1.5]);
    end
    n=n+1;
    %pause;
end
% espectro
informacion=[];
for n=1:1:length(h)
    if h(n)==0;
        se=ones(1,50);
        b = ones(1,50)*-1;
        y=[se b];
    else h(n)==1;
        se=ones(1,50);
        b = ones(1,50)*-1;
        y=[b se];
    end
    informacion=[informacion y];
end

zdouble = fft(informacion);
zdouble = abs(zdouble(1:length(zdouble)/2+1));
frqdouble = [0:length(zdouble)-1]*100/length(zdouble)/2/tiempo;

axes(handles.axes8);
d=plot(frqdouble/tiempo,zdouble);
title('Manch. Espectro');
set(d,'LineWidth',1.0);
%Manchester--------------------------------------------------------------------FIN

bitsG = get(handles.bitsG,'string');
tiempo = str2double(get(handles.tiempo,'string'));

h=[];
for x = 1:length(bitsG)
    h(end+1)=str2double(bitsG(x));
end
l=length(h);
h(l+1)=1;

pulse = 1;

current_level = +pulse;
%Manchester Diferencial---------------------------------------------------------------------

for bit = 1:length(h)
    bt = bit-1:0.001:bit;
    if current_level < 0
        y = (bt<bit) * pulse -2 * pulse * (bt < bit - 0.5);
    else
        y = -(bt<bit) * pulse + 2 * pulse * (bt < bit - 0.5);
    end
    
    current_level = -current_level;
    
    try
        if h(bit+1) == 0
            
            current_level = -current_level;
        end
    catch e
        
    end
    
    y(end) = current_level;
    
    axes(handles.axes11);
    d=plot(bt*tiempo,y,'B');grid on;
    title('MANCHESTER DIF.');
    set(d,'LineWidth',1.0);
    hold on;
    axis([0 tiempo*length(h) -1.5 1.5]);
    
end

informacion=[];
for n=1:1:length(h)
    if h(n)==0;
        se=ones(1,50);
        b = ones(1,50)*-1;
        y=[se b];
    else h(n)==1;
        se=ones(1,50);
        b = ones(1,50)*-1;
        y=[b se];
    end
    informacion=[informacion y];
end

zdouble = fft(informacion);
zdouble = abs(zdouble(1:length(zdouble)/2+1));
frqdouble = [0:length(zdouble)-1]*100/length(zdouble)/2/tiempo;

axes(handles.axes12);
d=plot(frqdouble/tiempo,zdouble);
title('ManchDif. Espectro');
set(d,'LineWidth',1.0);

    
    
