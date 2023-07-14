function varargout = my_phone(varargin)
% MY_PHONE M-file for my_phone.fig
%      MY_PHONE, by itself, creates a new MY_PHONE or raises the existing
%      singleton*.
%
%      H = MY_PHONE returns the handle to a new MY_PHONE or the handle to
%      the existing singleton*.
%
%      MY_PHONE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MY_PHONE.M with the given input arguments.
%
%      MY_PHONE('Property','Value',...) creates a new MY_PHONE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before my_phone_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to my_phone_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help my_phone

% Last Modified by GUIDE v2.5 01-Jan-2013 20:36:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @my_phone_OpeningFcn, ...
                   'gui_OutputFcn',  @my_phone_OutputFcn, ...
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


% --- Executes just before my_phone is made visible.
function my_phone_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to my_phone (see VARARGIN)

% Choose default command line output for my_phone
handles.output = hObject;
%自己添加的初始化代码

global NUM                       
NUM=[];               %定义全局变量，并初始化 
global N
N=1;
global F_SAVE
F_SAVE=struct('name',{'MaXiuwen','ZhangSan','LiSi','WangWu'},'num',{'177','12345','201030','1527342'});

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes my_phone wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = my_phone_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- 
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%按键1的响应函数
n=[1:1000]; % 每个数字 1000 个采样点表示  
d1=sin((2*pi*697/8192)*n)+sin((2*pi*1209/8192)*n); % 对应行频列频叠加  
n1=strcat(get(handles.edit1,'string'),'1'); % 获取数字号码  
set(handles.edit1,'string',n1); % 显示号码  
space=zeros(1,100); %100 个 0 模拟静音信号  
global NUM  
phone=[NUM,d1];  
NUM=[phone,space]; % 存储连续的拨号音信号  
sound(d1,8192); % 产生拨号音  



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%按键2的响应函数
n=[1:1000]; % 每个数字 1000 个采样点表示  
d2=sin((2*pi*697/8192)*n)+sin((2*pi*1336/8192)*n); % 对应行频列频叠加  
n2=strcat(get(handles.edit1,'string'),'2'); % 获取数字号码  
set(handles.edit1,'string',n2); % 显示号码  
space=zeros(1,100); %100 个 0 模拟静音信号  
global NUM  
phone=[NUM,d2];  
NUM=[phone,space]; % 存储连续的拨号音信号  
sound(d2,8192); % 产生拨号音  






% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%按键3的响应函数
n=[1:1000]; % 每个数字 1000 个采样点表示  
d3=sin((2*pi*697/8192)*n)+sin((2*pi*1477/8192)*n); % 对应行频列频叠加  
n3=strcat(get(handles.edit1,'string'),'3'); % 获取数字号码  
set(handles.edit1,'string',n3); % 显示号码  
space=zeros(1,100); %100 个 0 模拟静音信号  
global NUM  
phone=[NUM,d3];  
NUM=[phone,space]; % 存储连续的拨号音信号  
sound(d3,8192); % 产生拨号音  




% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%按键4的响应函数
n=[1:1000]; % 每个数字 1000 个采样点表示  
d4=sin((2*pi*770/8192)*n)+sin((2*pi*1209/8192)*n); % 对应行频列频叠加  
n4=strcat(get(handles.edit1,'string'),'4'); % 获取数字号码  
set(handles.edit1,'string',n4); % 显示号码  
space=zeros(1,100); %100 个 0 模拟静音信号  
global NUM  
phone=[NUM,d4];  
NUM=[phone,space]; % 存储连续的拨号音信号  
sound(d4,8192); % 产生拨号音  







% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%按键5的响应函数
n=[1:1000]; % 每个数字 1000 个采样点表示  
d5=sin((2*pi*770/8192)*n)+sin((2*pi*1336/8192)*n); % 对应行频列频叠加  
n5=strcat(get(handles.edit1,'string'),'5'); % 获取数字号码  
set(handles.edit1,'string',n5); % 显示号码  
space=zeros(1,100); %100 个 0 模拟静音信号  
global NUM  
phone=[NUM,d5];  
NUM=[phone,space]; % 存储连续的拨号音信号  
sound(d5,8192); % 产生拨号音  



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%按键6的响应函数
n=[1:1000]; % 每个数字 1000 个采样点表示  
d6=sin((2*pi*770/8192)*n)+sin((2*pi*1477/8192)*n); % 对应行频列频叠加  
n6=strcat(get(handles.edit1,'string'),'6'); % 获取数字号码  
set(handles.edit1,'string',n6); % 显示号码  
space=zeros(1,100); %100 个 0 模拟静音信号  
global NUM  
phone=[NUM,d6];  
NUM=[phone,space]; % 存储连续的拨号音信号  
sound(d6,8192); % 产生拨号音  





% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%按键7的响应函数
n=[1:1000]; % 每个数字 1000 个采样点表示  
d7=sin((2*pi*852/8192)*n)+sin((2*pi*1209/8192)*n); % 对应行频列频叠加  
n7=strcat(get(handles.edit1,'string'),'7'); % 获取数字号码  
set(handles.edit1,'string',n7); % 显示号码  
space=zeros(1,100); %100 个 0 模拟静音信号  
global NUM  
phone=[NUM,d7];  
NUM=[phone,space]; % 存储连续的拨号音信号  
sound(d7,8192); % 产生拨号音  



% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%按键8的响应函数
n=[1:1000]; % 每个数字 1000 个采样点表示  
d8=sin((2*pi*852/8192)*n)+sin((2*pi*1336/8192)*n); % 对应行频列频叠加  
n8=strcat(get(handles.edit1,'string'),'8'); % 获取数字号码  
set(handles.edit1,'string',n8); % 显示号码  
space=zeros(1,100); %100 个 0 模拟静音信号  
global NUM  
phone=[NUM,d8];  
NUM=[phone,space]; % 存储连续的拨号音信号  
sound(d8,8192); % 产生拨号音  



% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%按键9的响应函数
n=[1:1000]; % 每个数字 1000 个采样点表示  
d9=sin((2*pi*852/8192)*n)+sin((2*pi*1477/8192)*n); % 对应行频列频叠加  
n9=strcat(get(handles.edit1,'string'),'9'); % 获取数字号码  
set(handles.edit1,'string',n9); % 显示号码  
space=zeros(1,100); %100 个 0 模拟静音信号  
global NUM  
phone=[NUM,d9];  
NUM=[phone,space]; % 存储连续的拨号音信号  
sound(d9,8192); % 产生拨号音  




% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 删除键的响应函数    
n=[1:1000];  
num=get(handles.edit1,'string');  
l=length(num);  
n11=strrep(num,num,num(1:l-1)); %去掉末尾号码在面板上的显示 
d11=sin((2*pi*941/8192)*n)+sin((2*pi*1209/8192)*n); % 对应行频列频叠加  
set(handles.edit1,'string',n11);  
global NUM  
L=length(NUM);  
if L>0
NUM=NUM(1:L-1100); %删除末尾号码在拨号音信号中的存储
end
sound(d11,8192);  

  





% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%按键0的响应函数
n=[1:1000]; % 每个数字 1000 个采样点表示  
d0=sin((2*pi*941/8192)*n)+sin((2*pi*1336/8192)*n); % 对应行频列频叠加  
n0=strcat(get(handles.edit1,'string'),'0'); % 获取数字号码  
set(handles.edit1,'string',n0); % 显示号码  
space=zeros(1,100); %100 个 0 模拟静音信号  
global NUM  
phone=[NUM,d0];  
NUM=[phone,space]; % 存储连续的拨号音信号  
sound(d0,8192); % 产生拨号音  



% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%确认键的响应函数
n=[1:1000]; % 每个数字 1000 个采样点表示  
d12=sin((2*pi*941/8192)*n)+sin((2*pi*1477/8192)*n); % 对应行频列频叠加  
n12=strcat(get(handles.edit1,'string'),'#'); % 获取按键符号  
set(handles.edit1,'string',n12); % 显示号码  
sound(d12,8192); % 产生拨号音  
%模拟DTMF拨号
pause(1)       %延时1s
global NUM  
sound(NUM,8192); % 产生拨号音 
num=NUM;
assignin('base','num',NUM);       %把拨号音输出到工作区间
NUM=[];    %把全局变量NUM清零
pause(1)       %延时1s
set(handles.edit1,'string',''); %清空显示区
 





% --- Executes on key press with focus on pushbutton1 and none of its controls.
%function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%电话薄键响应（A)
n=[1:1000]; % 每个数字 1000 个采样点表示  
d13=sin((2*pi*697/8192)*n)+sin((2*pi*1633/8192)*n); % 对应行频列频叠加 
sound(d13,8192); % 产生拨号音  
global  F_SAVE
global  N
global NUM 
NUM=[];
s1=F_SAVE(1,N).name;
s2=F_SAVE(1,N).num;
ns=strcat(s1,' —— ',s2); % 获取姓名和号码
set(handles.edit1,'string',ns); % 显示姓名和号码
l=length(s2);    %号码长度
z=[941,697,697,697,770,770,770,852,852,852;1336,1209,1336,1477,1209,1336,1477,1209,1336,1477];
f_num=str2num(s2);   %转换成数字量
for i=l:-1:1
    a=floor(mod(f_num,10^i)/(10^(i-1)));     
    d=sin((2*pi*z(1,a+1)/8192)*n)+sin((2*pi*z(2,a+1)/8192)*n); % 对应行频列频叠加  
    space=zeros(1,100); %100 个 0 模拟静音信号      
    phone=[NUM,d];  
    NUM=[phone,space]; % 存储连续的拨号音信号      
end






% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%向上翻页UP键响应（B)
n=[1:1000]; % 每个数字 1000 个采样点表示  
d14=sin((2*pi*770/8192)*n)+sin((2*pi*1633/8192)*n); % 对应行频列频叠加 
sound(d14,8192); % 产生拨号音  

global  N
if N>1
    N=N-1;
  global  F_SAVE
  global NUM 
  NUM=[];
  s1=F_SAVE(1,N).name;
  s2=F_SAVE(1,N).num;
  ns=strcat(s1,' —— ',s2); % 获取姓名和号码
  set(handles.edit1,'string',ns); % 显示姓名和号码
  l=length(s2);    %号码长度
  z=[941,697,697,697,770,770,770,852,852,852;1336,1209,1336,1477,1209,1336,1477,1209,1336,1477];
  f_num=str2num(s2);   %转换成数字量
for i=l:-1:1
    a=floor(mod(f_num,10^i)/(10^(i-1)));     
    d=sin((2*pi*z(1,a+1)/8192)*n)+sin((2*pi*z(2,a+1)/8192)*n); % 对应行频列频叠加  
    space=zeros(1,100); %100 个 0 模拟静音信号 
    phone=[NUM,d];  
    NUM=[phone,space]; % 存储连续的拨号音信号      
end
end





% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%向下翻页DOWN键响应（C)
n=[1:1000]; % 每个数字 1000 个采样点表示  
d15=sin((2*pi*851/8192)*n)+sin((2*pi*1633/8192)*n); % 对应行频列频叠加 
sound(d15,8192); % 产生拨号音  
global  N
if N<4
    N=N+1;
  global  F_SAVE
  global NUM 
  NUM=[];
  s1=F_SAVE(1,N).name;
  s2=F_SAVE(1,N).num;
  ns=strcat(s1,' ——  ',s2); % 获取姓名和号码
  set(handles.edit1,'string',ns); % 显示姓名和号码
  l=length(s2);    %号码长度
  z=[941,697,697,697,770,770,770,852,852,852;1336,1209,1336,1477,1209,1336,1477,1209,1336,1477];
  f_num=str2num(s2);   %转换成数字量
for i=l:-1:1
    a=floor(mod(f_num,10^i)/(10^(i-1)));     
    d=sin((2*pi*z(1,a+1)/8192)*n)+sin((2*pi*z(2,a+1)/8192)*n); % 对应行频列频叠加  
    space=zeros(1,100); %100 个 0 模拟静音信号  
    phone=[NUM,d];  
    NUM=[phone,space]; % 存储连续的拨号音信号      
end
end





% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%返回键响应
n=[1:1000]; % 每个数字 1000 个采样点表示  
d16=sin((2*pi*941/8192)*n)+sin((2*pi*1633/8192)*n); % 对应行频列频叠加 
sound(d16,8192); % 产生拨号音  
global NUM
global N
N=1;
NUM=[];             %清零NUM
set(handles.edit1,'string',''); % 清空显示

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%模拟信号音识别
global NUM  
sound(NUM,8192);  
L=length(NUM);  
n=L/1100;  
number='';  
for i=1:n  
j=(i-1)*1100+1;  
d=NUM(j:j+999); % 截取出每个数字  
f=fft(d,2048); % 以 N=2048 作 FFT 变换  
a=abs(f);  
p=a.*a/10000; % 计算功率谱  
NUM(1)=find(p(1:250)==max(p(1:250))); % 找行频  
NUM(2)=300+find(p(300:380)==max(p(300:380))); % 找列频  
if (NUM(1) < 180) row=1; % 确定行数  
 elseif (NUM(1) < 200) row=2;  
   elseif (NUM(1) < 220) row=3;  
     else row=4;  
end  
if (NUM(2) < 320) column=1; % 确定列数  
  elseif (NUM(2) < 340) column=2;  
   else column=3;  
end
z=[1,2,3;4,5,6;7,8,9;10, 0,11];    %建立查找表
tel=z(row,column); 
t(i)=tel;  
c=strcat(number,int2str(tel));  
number=c;  
i=i+1;  
end
flag=0;
n_flag=0;
global F_SAVE
for i=1:4
    s=F_SAVE(1,i).num;
    flag=strcmp(number,s);
    if flag==1
        n_flag=i;
    end
end
  if n_flag>0
  s1=F_SAVE(1,n_flag).name;
  s2=F_SAVE(1,n_flag).num;
  ns=strcat('新来电：',s1,'—',s2); % 获取姓名和号码
  set(handles.edit1,'string',ns); % 显示姓名和号码
  else
   set(handles.edit1,'string',strcat('新来电：',number));
  end

    
    
    
    






