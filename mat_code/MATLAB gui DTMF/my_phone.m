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
%�Լ���ӵĳ�ʼ������

global NUM                       
NUM=[];               %����ȫ�ֱ���������ʼ�� 
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
%����1����Ӧ����
n=[1:1000]; % ÿ������ 1000 ���������ʾ  
d1=sin((2*pi*697/8192)*n)+sin((2*pi*1209/8192)*n); % ��Ӧ��Ƶ��Ƶ����  
n1=strcat(get(handles.edit1,'string'),'1'); % ��ȡ���ֺ���  
set(handles.edit1,'string',n1); % ��ʾ����  
space=zeros(1,100); %100 �� 0 ģ�⾲���ź�  
global NUM  
phone=[NUM,d1];  
NUM=[phone,space]; % �洢�����Ĳ������ź�  
sound(d1,8192); % ����������  



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%����2����Ӧ����
n=[1:1000]; % ÿ������ 1000 ���������ʾ  
d2=sin((2*pi*697/8192)*n)+sin((2*pi*1336/8192)*n); % ��Ӧ��Ƶ��Ƶ����  
n2=strcat(get(handles.edit1,'string'),'2'); % ��ȡ���ֺ���  
set(handles.edit1,'string',n2); % ��ʾ����  
space=zeros(1,100); %100 �� 0 ģ�⾲���ź�  
global NUM  
phone=[NUM,d2];  
NUM=[phone,space]; % �洢�����Ĳ������ź�  
sound(d2,8192); % ����������  






% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%����3����Ӧ����
n=[1:1000]; % ÿ������ 1000 ���������ʾ  
d3=sin((2*pi*697/8192)*n)+sin((2*pi*1477/8192)*n); % ��Ӧ��Ƶ��Ƶ����  
n3=strcat(get(handles.edit1,'string'),'3'); % ��ȡ���ֺ���  
set(handles.edit1,'string',n3); % ��ʾ����  
space=zeros(1,100); %100 �� 0 ģ�⾲���ź�  
global NUM  
phone=[NUM,d3];  
NUM=[phone,space]; % �洢�����Ĳ������ź�  
sound(d3,8192); % ����������  




% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%����4����Ӧ����
n=[1:1000]; % ÿ������ 1000 ���������ʾ  
d4=sin((2*pi*770/8192)*n)+sin((2*pi*1209/8192)*n); % ��Ӧ��Ƶ��Ƶ����  
n4=strcat(get(handles.edit1,'string'),'4'); % ��ȡ���ֺ���  
set(handles.edit1,'string',n4); % ��ʾ����  
space=zeros(1,100); %100 �� 0 ģ�⾲���ź�  
global NUM  
phone=[NUM,d4];  
NUM=[phone,space]; % �洢�����Ĳ������ź�  
sound(d4,8192); % ����������  







% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%����5����Ӧ����
n=[1:1000]; % ÿ������ 1000 ���������ʾ  
d5=sin((2*pi*770/8192)*n)+sin((2*pi*1336/8192)*n); % ��Ӧ��Ƶ��Ƶ����  
n5=strcat(get(handles.edit1,'string'),'5'); % ��ȡ���ֺ���  
set(handles.edit1,'string',n5); % ��ʾ����  
space=zeros(1,100); %100 �� 0 ģ�⾲���ź�  
global NUM  
phone=[NUM,d5];  
NUM=[phone,space]; % �洢�����Ĳ������ź�  
sound(d5,8192); % ����������  



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%����6����Ӧ����
n=[1:1000]; % ÿ������ 1000 ���������ʾ  
d6=sin((2*pi*770/8192)*n)+sin((2*pi*1477/8192)*n); % ��Ӧ��Ƶ��Ƶ����  
n6=strcat(get(handles.edit1,'string'),'6'); % ��ȡ���ֺ���  
set(handles.edit1,'string',n6); % ��ʾ����  
space=zeros(1,100); %100 �� 0 ģ�⾲���ź�  
global NUM  
phone=[NUM,d6];  
NUM=[phone,space]; % �洢�����Ĳ������ź�  
sound(d6,8192); % ����������  





% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%����7����Ӧ����
n=[1:1000]; % ÿ������ 1000 ���������ʾ  
d7=sin((2*pi*852/8192)*n)+sin((2*pi*1209/8192)*n); % ��Ӧ��Ƶ��Ƶ����  
n7=strcat(get(handles.edit1,'string'),'7'); % ��ȡ���ֺ���  
set(handles.edit1,'string',n7); % ��ʾ����  
space=zeros(1,100); %100 �� 0 ģ�⾲���ź�  
global NUM  
phone=[NUM,d7];  
NUM=[phone,space]; % �洢�����Ĳ������ź�  
sound(d7,8192); % ����������  



% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%����8����Ӧ����
n=[1:1000]; % ÿ������ 1000 ���������ʾ  
d8=sin((2*pi*852/8192)*n)+sin((2*pi*1336/8192)*n); % ��Ӧ��Ƶ��Ƶ����  
n8=strcat(get(handles.edit1,'string'),'8'); % ��ȡ���ֺ���  
set(handles.edit1,'string',n8); % ��ʾ����  
space=zeros(1,100); %100 �� 0 ģ�⾲���ź�  
global NUM  
phone=[NUM,d8];  
NUM=[phone,space]; % �洢�����Ĳ������ź�  
sound(d8,8192); % ����������  



% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%����9����Ӧ����
n=[1:1000]; % ÿ������ 1000 ���������ʾ  
d9=sin((2*pi*852/8192)*n)+sin((2*pi*1477/8192)*n); % ��Ӧ��Ƶ��Ƶ����  
n9=strcat(get(handles.edit1,'string'),'9'); % ��ȡ���ֺ���  
set(handles.edit1,'string',n9); % ��ʾ����  
space=zeros(1,100); %100 �� 0 ģ�⾲���ź�  
global NUM  
phone=[NUM,d9];  
NUM=[phone,space]; % �洢�����Ĳ������ź�  
sound(d9,8192); % ����������  




% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ɾ��������Ӧ����    
n=[1:1000];  
num=get(handles.edit1,'string');  
l=length(num);  
n11=strrep(num,num,num(1:l-1)); %ȥ��ĩβ����������ϵ���ʾ 
d11=sin((2*pi*941/8192)*n)+sin((2*pi*1209/8192)*n); % ��Ӧ��Ƶ��Ƶ����  
set(handles.edit1,'string',n11);  
global NUM  
L=length(NUM);  
if L>0
NUM=NUM(1:L-1100); %ɾ��ĩβ�����ڲ������ź��еĴ洢
end
sound(d11,8192);  

  





% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%����0����Ӧ����
n=[1:1000]; % ÿ������ 1000 ���������ʾ  
d0=sin((2*pi*941/8192)*n)+sin((2*pi*1336/8192)*n); % ��Ӧ��Ƶ��Ƶ����  
n0=strcat(get(handles.edit1,'string'),'0'); % ��ȡ���ֺ���  
set(handles.edit1,'string',n0); % ��ʾ����  
space=zeros(1,100); %100 �� 0 ģ�⾲���ź�  
global NUM  
phone=[NUM,d0];  
NUM=[phone,space]; % �洢�����Ĳ������ź�  
sound(d0,8192); % ����������  



% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%ȷ�ϼ�����Ӧ����
n=[1:1000]; % ÿ������ 1000 ���������ʾ  
d12=sin((2*pi*941/8192)*n)+sin((2*pi*1477/8192)*n); % ��Ӧ��Ƶ��Ƶ����  
n12=strcat(get(handles.edit1,'string'),'#'); % ��ȡ��������  
set(handles.edit1,'string',n12); % ��ʾ����  
sound(d12,8192); % ����������  
%ģ��DTMF����
pause(1)       %��ʱ1s
global NUM  
sound(NUM,8192); % ���������� 
num=NUM;
assignin('base','num',NUM);       %�Ѳ������������������
NUM=[];    %��ȫ�ֱ���NUM����
pause(1)       %��ʱ1s
set(handles.edit1,'string',''); %�����ʾ��
 





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
%�绰������Ӧ��A)
n=[1:1000]; % ÿ������ 1000 ���������ʾ  
d13=sin((2*pi*697/8192)*n)+sin((2*pi*1633/8192)*n); % ��Ӧ��Ƶ��Ƶ���� 
sound(d13,8192); % ����������  
global  F_SAVE
global  N
global NUM 
NUM=[];
s1=F_SAVE(1,N).name;
s2=F_SAVE(1,N).num;
ns=strcat(s1,' ���� ',s2); % ��ȡ�����ͺ���
set(handles.edit1,'string',ns); % ��ʾ�����ͺ���
l=length(s2);    %���볤��
z=[941,697,697,697,770,770,770,852,852,852;1336,1209,1336,1477,1209,1336,1477,1209,1336,1477];
f_num=str2num(s2);   %ת����������
for i=l:-1:1
    a=floor(mod(f_num,10^i)/(10^(i-1)));     
    d=sin((2*pi*z(1,a+1)/8192)*n)+sin((2*pi*z(2,a+1)/8192)*n); % ��Ӧ��Ƶ��Ƶ����  
    space=zeros(1,100); %100 �� 0 ģ�⾲���ź�      
    phone=[NUM,d];  
    NUM=[phone,space]; % �洢�����Ĳ������ź�      
end






% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%���Ϸ�ҳUP����Ӧ��B)
n=[1:1000]; % ÿ������ 1000 ���������ʾ  
d14=sin((2*pi*770/8192)*n)+sin((2*pi*1633/8192)*n); % ��Ӧ��Ƶ��Ƶ���� 
sound(d14,8192); % ����������  

global  N
if N>1
    N=N-1;
  global  F_SAVE
  global NUM 
  NUM=[];
  s1=F_SAVE(1,N).name;
  s2=F_SAVE(1,N).num;
  ns=strcat(s1,' ���� ',s2); % ��ȡ�����ͺ���
  set(handles.edit1,'string',ns); % ��ʾ�����ͺ���
  l=length(s2);    %���볤��
  z=[941,697,697,697,770,770,770,852,852,852;1336,1209,1336,1477,1209,1336,1477,1209,1336,1477];
  f_num=str2num(s2);   %ת����������
for i=l:-1:1
    a=floor(mod(f_num,10^i)/(10^(i-1)));     
    d=sin((2*pi*z(1,a+1)/8192)*n)+sin((2*pi*z(2,a+1)/8192)*n); % ��Ӧ��Ƶ��Ƶ����  
    space=zeros(1,100); %100 �� 0 ģ�⾲���ź� 
    phone=[NUM,d];  
    NUM=[phone,space]; % �洢�����Ĳ������ź�      
end
end





% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%���·�ҳDOWN����Ӧ��C)
n=[1:1000]; % ÿ������ 1000 ���������ʾ  
d15=sin((2*pi*851/8192)*n)+sin((2*pi*1633/8192)*n); % ��Ӧ��Ƶ��Ƶ���� 
sound(d15,8192); % ����������  
global  N
if N<4
    N=N+1;
  global  F_SAVE
  global NUM 
  NUM=[];
  s1=F_SAVE(1,N).name;
  s2=F_SAVE(1,N).num;
  ns=strcat(s1,' ����  ',s2); % ��ȡ�����ͺ���
  set(handles.edit1,'string',ns); % ��ʾ�����ͺ���
  l=length(s2);    %���볤��
  z=[941,697,697,697,770,770,770,852,852,852;1336,1209,1336,1477,1209,1336,1477,1209,1336,1477];
  f_num=str2num(s2);   %ת����������
for i=l:-1:1
    a=floor(mod(f_num,10^i)/(10^(i-1)));     
    d=sin((2*pi*z(1,a+1)/8192)*n)+sin((2*pi*z(2,a+1)/8192)*n); % ��Ӧ��Ƶ��Ƶ����  
    space=zeros(1,100); %100 �� 0 ģ�⾲���ź�  
    phone=[NUM,d];  
    NUM=[phone,space]; % �洢�����Ĳ������ź�      
end
end





% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%���ؼ���Ӧ
n=[1:1000]; % ÿ������ 1000 ���������ʾ  
d16=sin((2*pi*941/8192)*n)+sin((2*pi*1633/8192)*n); % ��Ӧ��Ƶ��Ƶ���� 
sound(d16,8192); % ����������  
global NUM
global N
N=1;
NUM=[];             %����NUM
set(handles.edit1,'string',''); % �����ʾ

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%ģ���ź���ʶ��
global NUM  
sound(NUM,8192);  
L=length(NUM);  
n=L/1100;  
number='';  
for i=1:n  
j=(i-1)*1100+1;  
d=NUM(j:j+999); % ��ȡ��ÿ������  
f=fft(d,2048); % �� N=2048 �� FFT �任  
a=abs(f);  
p=a.*a/10000; % ���㹦����  
NUM(1)=find(p(1:250)==max(p(1:250))); % ����Ƶ  
NUM(2)=300+find(p(300:380)==max(p(300:380))); % ����Ƶ  
if (NUM(1) < 180) row=1; % ȷ������  
 elseif (NUM(1) < 200) row=2;  
   elseif (NUM(1) < 220) row=3;  
     else row=4;  
end  
if (NUM(2) < 320) column=1; % ȷ������  
  elseif (NUM(2) < 340) column=2;  
   else column=3;  
end
z=[1,2,3;4,5,6;7,8,9;10, 0,11];    %�������ұ�
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
  ns=strcat('�����磺',s1,'��',s2); % ��ȡ�����ͺ���
  set(handles.edit1,'string',ns); % ��ʾ�����ͺ���
  else
   set(handles.edit1,'string',strcat('�����磺',number));
  end

    
    
    
    






