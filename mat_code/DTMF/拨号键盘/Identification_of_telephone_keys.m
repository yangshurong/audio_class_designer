function varargout = Identification_of_telephone_keys(varargin)
% IDENTIFICATION_OF_TELEPHONE_KEYS MATLAB code for Identification_of_telephone_keys.fig
%      IDENTIFICATION_OF_TELEPHONE_KEYS, by itself, creates a new IDENTIFICATION_OF_TELEPHONE_KEYS or raises the existing
%      singleton*.
%
%      H = IDENTIFICATION_OF_TELEPHONE_KEYS returns the handle to a new IDENTIFICATION_OF_TELEPHONE_KEYS or the handle to
%      the existing singleton*.
%
%      IDENTIFICATION_OF_TELEPHONE_KEYS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IDENTIFICATION_OF_TELEPHONE_KEYS.M with the given input arguments.
%
%      IDENTIFICATION_OF_TELEPHONE_KEYS('Property','Value',...) creates a new IDENTIFICATION_OF_TELEPHONE_KEYS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Identification_of_telephone_keys_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Identification_of_telephone_keys_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Identification_of_telephone_keys

% Last Modified by GUIDE v2.5 23-Dec-2019 23:29:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Identification_of_telephone_keys_OpeningFcn, ...
                   'gui_OutputFcn',  @Identification_of_telephone_keys_OutputFcn, ...
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


% --- Executes just before Identification_of_telephone_keys is made visible.
function Identification_of_telephone_keys_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command linep arguments to Identification_of_telephone_keys (see VARARGIN)

% Choose default command line output for Identification_of_telephone_keys
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Identification_of_telephone_keys wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Identification_of_telephone_keys_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%模拟键盘音DTMF，绘出按键的时域波形和频域波形

generate_signal(handles,1,1)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
generate_signal(handles,1,2)

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
generate_signal(handles,1,3)

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
generate_signal(handles,2,1)

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
generate_signal(handles,2,2)

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
generate_signal(handles,2,3)

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
generate_signal(handles,3,1)

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
generate_signal(handles,3,2)

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
generate_signal(handles,3,3)

% --- Executes on button press in pushbuttonStar.
function pushbuttonStar_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonStar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
generate_signal(handles,4,1)

% --- Executes on button press in pushbutton0.
function pushbutton0_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
generate_signal(handles,4,2)

% --- Executes on button press in pushbuttonJin.
function pushbuttonJin_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonJin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
generate_signal(handles,4,3)

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

num = str2double(get(h0bject,'String'));
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


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%DTMF信号仿真与识别（滤波器法）
global xt;

f=fft(xt,2001);f1=fftshift(f);
wl=1001:2001;w=4000*(wl-1000.5)/1000.5;
F=abs(f1(1001:2001));
axes(handles.axes2);
plot(w,F);xlabel('频率/Hz');
axis([0,2000,-50,600]);
title('fft峰值算法');
grid on;

ind1=find(w>=0 &w<1000);
F1=max(F(ind1)); id1=find(F==F1); freq1=w(id1);

ind2=find(w>=1000 &w<2000);
F2=max(F(ind2)); id2=find(F==F2); freq2=w(id2);

set(handles.edit3,'string',freq1);
set(handles.edit7,'string',freq2);

if abs(697-freq1)/freq1<0.05 && abs(1209-freq2)/freq2<0.05
    set(handles.edit4,'string','1');
elseif abs(697-freq1)/freq1<0.05 && abs(1336-freq2)/freq2<0.05
    set(handles.edit4,'string','2');
elseif abs(697-freq1)/freq1<0.05 && abs(1477-freq2)/freq2<0.05
    set(handles.edit4,'string','3');
elseif abs(770-freq1)/freq1<0.05 && abs(1209-freq2)/freq2<0.05
    set(handles.edit4,'string','4');
elseif abs(770-freq1)/freq1<0.05 && abs(1336-freq2)/freq2<0.05
    set(handles.edit4,'string','5');
elseif abs(770-freq1)/freq1<0.05 && abs(1447-freq2)/freq2<0.05
    set(handles.edit4,'string','6');
elseif abs(852-freq1)/freq1<0.05 && abs(1209-freq2)/freq2<0.05
    set(handles.edit4,'string','7');
elseif abs(852-freq1)/freq1<0.05 && abs(1336-freq2)/freq2<0.05
    set(handles.edit4,'string','8');
elseif abs(852-freq1)/freq1<0.05 && abs(1477-freq2)/freq2<0.05
    set(handles.edit4,'string','9');
elseif abs(941-freq1)/freq1<0.05 && abs(1209-freq2)/freq2<0.05
    set(handles.edit4,'string','*');
elseif abs(941-freq1)/freq1<0.05 && abs(1336-freq2)/freq2<0.05
    set(handles.edit4,'string','0');
elseif abs(941-freq1)/freq1<0.05 && abs(1447-freq2)/freq2<0.05
    set(handles.edit4,'string','#');
else
    set(handles.edit4,'string','error');
end

%set(handles.edit3,'string',max());
% --- Executes during object creation, after setting all properties.
function text13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double




% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on scroll wheel click while the figure is in focus.


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
power=get(handles.slider1,'value');
set(handles.edit2,'string',power);

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%利用Goertzel算法估计DTMF信号功率谱

global fc fr l h;
Fs=8000;
N=205;
lo=sin(2*pi*l*(0:N-1)/Fs);
hi=sin(2*pi*h*(0:N-1)/Fs);
data= lo+hi;
f=[fc fr];
freq_indices=round(f/Fs*N)+1;
dft_data=goertzel(data, freq_indices);
D=abs(dft_data);
axes(handles.axes3);
stem(f,D);
ax=gca;
ax.XTick=f;
title('Goertzel算法');
xlabel('频率/Hz');
grid on;

ind1=find(f>=0 &f<1000);
D1=max(D(ind1)); id1=find(D==D1); freq1=f(id1);

ind2=find(f>=1000 &f<2000);
D2=max(D(ind2)); id2=find(D==D2); freq2=f(id2);

freq=freq1+freq2;
set(handles.edit5,'string',freq1);
set(handles.edit8,'string',freq2);

switch freq
    case 697+1209
        set(handles.edit6,'string','1');
    case 697+1336
        set(handles.edit6,'string','2');
    case 697+1477
        set(handles.edit6,'string','3');
    case 770+1209
        set(handles.edit6,'string','4');
    case 770+1336
        set(handles.edit6,'string','5');
    case 770+1477
        set(handles.edit6,'string','6');
    case 852+1209
        set(handles.edit6,'string','7');
    case 852+1336
        set(handles.edit6,'string','8');
    case 852+1477
        set(handles.edit6,'string','9');
    case 941+1209
        set(handles.edit6,'string','*');
    case 941+1336
        set(handles.edit6,'string','0');
    case 941+1477
        set(handles.edit6,'string','#');
end
function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes during object creation, after setting all properties.
% --- Executes during object creation, after setting all properties.
function pushbutton2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
function pushbutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
function pushbutton6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
function text16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% --- Executes during object creation, after setting all properties.



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
