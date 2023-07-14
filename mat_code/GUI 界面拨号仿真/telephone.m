function varargout = telephone(varargin)
% TELEPHONE MATLAB code for telephone.fig
%      TELEPHONE, by itself, creates a new TELEPHONE or raises the existing
%      singleton*.
%
%      H = TELEPHONE returns the handle to a new TELEPHONE or the handle to
%      the existing singleton*.
%
%      TELEPHONE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TELEPHONE.M with the given input arguments.
%
%      TELEPHONE('Property','Value',...) creates a new TELEPHONE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before telephone_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to telephone_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help telephone

% Last Modified by GUIDE v2.5 30-May-2018 10:00:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @telephone_OpeningFcn, ...
                   'gui_OutputFcn',  @telephone_OutputFcn, ...
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


% --- Executes just before telephone is made visible.
function telephone_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to telephone (see VARARGIN)

% Choose default command line output for telephone
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes telephone wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = telephone_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)      %按键 1
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f1=[697,770,852,941];
f2=[1209,1336,1477,1633];
n=0:1000;
%global x1;
x1=sin(2*pi*n*f1(1)/8000)+sin(2*pi*n*f2(1)/8000);
global NUM;
space=zeros(1,100);
phone=[NUM,x1];
NUM=[phone,space];
%sound(x1,8000);
axes(handles.axes1);
fftx=abs(fft(x1));
N=length(x1);
f=n/N*8000;
plot(f,fftx)
axis([0 2000 0 1000]);
xlabel('f');ylabel('|Y(w)|');
n1=strcat(get(handles.text5,'String'),'1');
set(handles.text5,'String',n1);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)      %按键 2
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f1=[697,770,852,941];
f2=[1209,1336,1477,1633];
n=0:1000;
%global x2;
x2=sin(2*pi*n*f1(1)/8000)+sin(2*pi*n*f2(2)/8000);
global NUM;
space=zeros(1,100);
phone=[NUM,x2];
NUM=[phone,space];
%sound(x2,8000);
axes(handles.axes1);
fftx=abs(fft(x2));
N=length(x2);
f=n/N*8000;
plot(f,fftx)
axis([0 2000 0 1000]);
xlabel('f');ylabel('|Y(w)|');
n2=strcat(get(handles.text5,'String'),'2');
set(handles.text5,'String',n2);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)      %按键 3
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f1=[697,770,852,941];
f2=[1209,1336,1477,1633];
n=0:1000;
%global x3;
x3=sin(2*pi*n*f1(1)/8000)+sin(2*pi*n*f2(3)/8000);
global NUM;
space=zeros(1,100);
phone=[NUM,x3];
NUM=[phone,space];
%sound(x3,8000);
axes(handles.axes1);
fftx=abs(fft(x3));
N=length(x3);
f=n/N*8000;
plot(f,fftx)
axis([0 2000 0 1000]);
xlabel('f');ylabel('|Y(w)|');
n3=strcat(get(handles.text5,'String'),'3');
set(handles.text5,'String',n3);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)      %按键 4
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f1=[697,770,852,941];
f2=[1209,1336,1477,1633];
n=0:1000;
%global x4;
x4=sin(2*pi*n*f1(2)/8000)+sin(2*pi*n*f2(1)/8000);
global NUM;
space=zeros(1,100);
phone=[NUM,x4];
NUM=[phone,space];
%sound(x4,8000);
axes(handles.axes1);
fftx=abs(fft(x4));
N=length(x4);
f=n/N*8000;
plot(f,fftx)
axis([0 2000 0 1000]);
xlabel('f');ylabel('|Y(w)|');
n4=strcat(get(handles.text5,'String'),'4');
set(handles.text5,'String',n4);

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)      %按键 5
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f1=[697,770,852,941];
f2=[1209,1336,1477,1633];
n=0:1000;
%global x5;
x5=sin(2*pi*n*f1(2)/8000)+sin(2*pi*n*f2(2)/8000);
global NUM;
space=zeros(1,100);
phone=[NUM,x5];
NUM=[phone,space];
%sound(x5,8000);
axes(handles.axes1);
fftx=abs(fft(x5));
N=length(x5);
f=n/N*8000;
plot(f,fftx)
axis([0 2000 0 1000]);
xlabel('f');ylabel('|Y(w)|');
n5=strcat(get(handles.text5,'String'),'5');
set(handles.text5,'String',n5);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)      %按键 6
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f1=[697,770,852,941];
f2=[1209,1336,1477,1633];
n=0:1000;
%global x6;
x6=sin(2*pi*n*f1(2)/8000)+sin(2*pi*n*f2(3)/8000);
global NUM;
space=zeros(1,100);
phone=[NUM,x6];
NUM=[phone,space];
%sound(x6,8000);
axes(handles.axes1);
fftx=abs(fft(x6));
N=length(x6);
f=n/N*8000;
plot(f,fftx)
axis([0 2000 0 1000]);
xlabel('f');ylabel('|Y(w)|');
n6=strcat(get(handles.text5,'String'),'6');
set(handles.text5,'String',n6);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)      %按键 7
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f1=[697,770,852,941];
f2=[1209,1336,1477,1633];
n=0:1000;
%global x7;
x7=sin(2*pi*n*f1(3)/8000)+sin(2*pi*n*f2(1)/8000);
global NUM;
space=zeros(1,100);
phone=[NUM,x7];
NUM=[phone,space];
%sound(x7,8000);
axes(handles.axes1);
fftx=abs(fft(x7));
N=length(x7);
f=n/N*8000;
plot(f,fftx)
axis([0 2000 0 1000]);
xlabel('f');ylabel('|Y(w)|');
n7=strcat(get(handles.text5,'String'),'7');
set(handles.text5,'String',n7);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)      %按键 8
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f1=[697,770,852,941];
f2=[1209,1336,1477,1633];
n=0:1000;
%global x8;
x8=sin(2*pi*n*f1(3)/8000)+sin(2*pi*n*f2(2)/8000);
global NUM;
space=zeros(1,100);
phone=[NUM,x8];
NUM=[phone,space];
%sound(x8,8000);
axes(handles.axes1);
fftx=abs(fft(x8));
N=length(x8);
f=n/N*8000;
plot(f,fftx)
axis([0 2000 0 1000]);
xlabel('f');ylabel('|Y(w)|');
n8=strcat(get(handles.text5,'String'),'8');
set(handles.text5,'String',n8);

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)      %按键 9
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f1=[697,770,852,941];
f2=[1209,1336,1477,1633];
n=0:1000;
%global x9;
x9=sin(2*pi*n*f1(3)/8000)+sin(2*pi*n*f2(3)/8000);
global NUM;
space=zeros(1,100);
phone=[NUM,x9];
NUM=[phone,space];
%sound(x9,8000);
axes(handles.axes1);
fftx=abs(fft(x9));
N=length(x9);
f=n/N*8000;
plot(f,fftx)
axis([0 2000 0 1000]);
xlabel('f');ylabel('|Y(w)|');
n9=strcat(get(handles.text5,'String'),'9');
set(handles.text5,'String',n9);


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)     %按键 0
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f1=[697,770,852,941];
f2=[1209,1336,1477,1633];
n=0:1000;
%global x10;
x10=sin(2*pi*n*f1(4)/8000)+sin(2*pi*n*f2(2)/8000);
global NUM;
space=zeros(1,100);
phone=[NUM,x10];
NUM=[phone,space];
%sound(x10,8000);
axes(handles.axes1);
fftx=abs(fft(x10));
N=length(x10);
f=n/N*8000;
plot(f,fftx)
axis([0 2000 0 1000]);
xlabel('f');ylabel('|Y(w)|');
n10=strcat(get(handles.text5,'String'),'0');
set(handles.text5,'String',n10);


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)     %按键 #
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f1=[697,770,852,941];
f2=[1209,1336,1477,1633];
n=0:1000;
%global x11;
x11=sin(2*pi*n*f1(4)/8000)+sin(2*pi*n*f2(3)/8000);
global NUM;
space=zeros(1,100);
phone=[NUM,x11];
NUM=[phone,space];
%sound(x11,8000);
axes(handles.axes1);
fftx=abs(fft(x11));
N=length(x11);
f=n/N*8000;
plot(f,fftx)
axis([0 2000 0 1000]);
xlabel('f');ylabel('|Y(w)|');
n11=strcat(get(handles.text5,'String'),'#');
set(handles.text5,'String',n11);

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)     %按键 *
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f1=[697,770,852,941];
f2=[1209,1336,1477,1633];
n=0:1000;
%global x12;
x12=sin(2*pi*n*f1(4)/8000)+sin(2*pi*n*f2(1)/8000);
global NUM;
space=zeros(1,100);
phone=[NUM,x12];
NUM=[phone,space];
%sound(x12,8000);
axes(handles.axes1);
fftx=abs(fft(x12));
N=length(x12);
f=n/N*8000;
plot(f,fftx)
axis([0 2000 0 1000]);
xlabel('f');ylabel('|Y(w)|');
n12=strcat(get(handles.text5,'String'),'*');
set(handles.text5,'String',n12);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)         %拨号
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global x1;global x2;global x3;global x4;global x5;global x6;
%global x7;global x8,global x9;global x10;global x11;global x12;
global NUM;
%tm=[1,2,3,65;4,5,6,66;7,8,9,67;42,0,35,68];
%H=[x1;x2;x3;x4;x5;x6;x7;x8;x9;x10;x11;x12];
N=205;
K=[18,20,22,24,31,34,38,42];%K=(N*f)/fs
%f1=[697,770,852,941];
%f2=[1209,1336,1477,1633];
L=length(NUM);
m=L/1100;
number='';
for i=1:m
    j=(i-1)*1100+1;
    d=NUM(j:j+999);
%for g=1:12;
%h=get(handles.pushbutton1,'Value');
%if h==1
   %set(handles.text4,'String',h);
%end
X=goertzel(d(1:N),K+1); 
val=abs(X);
figure(1);
subplot(4,3,i);
stem(K,val,'.');xlabel('k');ylabel('|X(k)|');
limit=80;
for s=5:8;
    if val(s)>limit,break,end
end
for r=1:4;
    if val(r)>limit,break,end
end
z=[r,s-4]; 
if z==[4,2] tel=0;
elseif z==[4,1] tel=setstr(42);
elseif z==[4,3] tel=setstr(35);
elseif z==[1,1] tel=1;
elseif z==[1,2] tel=2;
elseif z==[1,3] tel=3;
elseif z==[2,1] tel=4;
elseif z==[2,2] tel=5;
elseif z==[2,3] tel=6;
elseif z==[3,1] tel=7;
elseif z==[3,2] tel=8;
elseif z==[3,3] tel=9;
end
c=strcat(number,int2str(tel));
number=c;
i=i+1;
end
set(handles.text4, 'string' ,number);

% --- Executes on button press in pushbutton17. 
function pushbutton17_Callback(hObject, eventdata, handles)        %挂断
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text5,'String','');
set(handles.text4,'String','');
global NUM;
NUM=0;
cla;


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)        %清除
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
n=[1:1000];
num=get(handles.text5, 'string' );
L=length(num);
nx=strrep(num,num,num(1:L-1)); %
set(handles.text5, 'string' ,nx);
global NUM
L=length(NUM);
NUM=NUM(1:L-1100);
