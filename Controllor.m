function varargout = Controllor(varargin)
% CONTROLLOR M-file for Controllor.fig
%      CONTROLLOR, by itself, creates a new CONTROLLOR or raises the existing
%      singleton*.
%
%      H = CONTROLLOR returns the handle to a new CONTROLLOR or the handle
%      to
%      the existing singleton*.
%
%      CONTROLLOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONTROLLOR.M with the given input
%      arguments.
%
%      CONTROLLOR('Property','Value',...) creates a new CONTROLLOR or
%      raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Controllor_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property
%      application
%      stop.  All inputs are passed to Controllor_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Controllor

% Last Modified by GUIDE v2.5 10-Jun-2016 23:27:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Controllor_OpeningFcn, ...
    'gui_OutputFcn',  @Controllor_OutputFcn, ...
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


% --- Executes just before Controllor is made visible.
function Controllor_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Controllor (see VARARGIN)

% Choose default command line output for Controllor
handles.output = hObject;
%% ��Ӵ���
set(handles.pushbutton2,'Enable','off');    %δ�򿪴���ǰ���ر��봮����صĲ���
set(handles.pushbutton3,'Enable','off');
set(handles.pushbutton4,'Enable','off');
set(handles.pushbutton5,'Enable','off');
set(handles.pushbutton6,'Enable','off');
set(handles.pushbutton7,'Enable','off');
set(handles.pushbutton8,'Enable','off');
set(handles.pushbutton10,'Enable','off');

serialcom=instrhwinfo('serial');
numcom=size(serialcom.AvailableSerialPorts);
if numcom(2)==0
    set(handles.pushbutton1,'Enable','off');    %û�д��ڣ����ܽ��д򿪴��ڲ�������
    errordlg('����ЧCOM��','��ʾ','replace');
else
    set(handles.popupmenu1,'string',char(serialcom.AvailableSerialPorts));
end

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Controllor wait for user response (see UIRESUME)
% uiwait(handles.figure0);


% --- Outputs from this function are returned to the command line.
function varargout = Controllor_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global scom

str=get(handles.pushbutton1,'string');
if strcmp(str,'�򿪴���')==1
    serialcom=instrhwinfo('serial');
    numcom=size(serialcom.AvailableSerialPorts);
    if numcom(2)==0
        set(handles.pushbutton1,'Enable','off');    %û�д��ڣ����ܽ��д��ڲ�������
        set(handles.pushbutton2,'Enable','off');
        set(handles.pushbutton3,'Enable','off');
        set(handles.pushbutton4,'Enable','off');
        set(handles.pushbutton5,'Enable','off');
        set(handles.pushbutton6,'Enable','off');
        set(handles.pushbutton7,'Enable','off');
        set(handles.pushbutton8,'Enable','off');
        set(handles.pushbutton10,'Enable','off');
        errordlg('����ЧCOM��','��ʾ','replace');
    else
        set(handles.popupmenu1,'Enable','off'); %��ֹ�޸Ĵ��ں�
        set(handles.popupmenu2,'Enable','off'); %��ֹ�޸Ĳ�����
        set(handles.pushbutton1,'string','�رմ���');   %����ť��ʾΪ�رմ���
        comcode=get(handles.popupmenu1,'Value');    %���ô��ں�
        scom=serial(char(serialcom.AvailableSerialPorts(comcode)));
        switch get(handles.popupmenu2,'Value')  %���ô��ڲ�����
            case 1
                scom.BaudRate=115200;
            case 2
                scom.BaudRate=19200;
            case 3
                scom.BaudRate=9600;
        end;
        scom.ReadAsyncMode='continuous';
        scom.BytesAvailableFcnMode='Byte';    %���ô���Ϊ�첽ͨ�ŷ�ʽ
        fopen(scom);    %�򿪴���
        set(handles.pushbutton2,'Enable','on'); %���봮����صĲ���ʹ��
        set(handles.pushbutton3,'Enable','on');
        set(handles.pushbutton4,'Enable','on');
        set(handles.pushbutton5,'Enable','on');
        set(handles.pushbutton6,'Enable','on');
        set(handles.pushbutton7,'Enable','on');
        set(handles.pushbutton8,'Enable','on');
    end
    set(handles.edit1,'Enable','on');   %ʹ�ܻ�����С������˳�ʼλ�ñ༭��
    set(handles.edit2,'Enable','on');
    set(handles.edit3,'Enable','on');
    set(handles.edit4,'Enable','on');
    set(handles.edit8,'Enable','on');
    set(handles.edit9,'Enable','on');
else
    set(handles.pushbutton1,'string','�򿪴���');   %������������Ϊ���򿪴��ڡ�
    set(handles.popupmenu1,'Enable','on');  %�����޸Ĵ��ں�
    set(handles.popupmenu2,'Enable','on');  %�����޸Ĳ�����
    scomed = instrfind;  %�����Ѵ򿪴��ڶ���
    numcom=size(scomed);
    if numcom(2)~=0
        hdata=['55';'aa';'01';'00';'21';'21'];  %ֹͣ����������,���������ɵ���ʧ
        ddata=hex2dec(hdata);
        fwrite(scom,ddata','uint8','async');
        stopasync(scom);   %ֹͣ���ڶ���
        fclose(scom);  %�رմ��ڶ���
        delete(scom);  %ɾ�����ڶ���
    end
    set(handles.pushbutton2,'Enable','off');    %�ر��봮����صĲ���
    set(handles.pushbutton3,'Enable','off');
    set(handles.pushbutton4,'Enable','off');
    set(handles.pushbutton5,'Enable','off');
    set(handles.pushbutton6,'Enable','off');
    set(handles.pushbutton7,'Enable','off');
    set(handles.pushbutton8,'Enable','off');
    set(handles.pushbutton10,'Enable','off');
end


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
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global scom
hdata=['55';'aa';'01';'04';'26';'00';'c8';'00';'cd';'bf'];  %ǰ��
ddata=hex2dec(hdata);
fwrite(scom,ddata','uint8','async');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global scom

hdata=['55';'aa';'01';'04';'26';'80';'fa';'00';'fa';'9e'];  %��ת
ddata=hex2dec(hdata);
fwrite(scom,ddata','uint8','async');

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global scom
hdata=['55';'aa';'01';'00';'21';'21'];  %ֹͣ
ddata=hex2dec(hdata);
fwrite(scom,ddata','uint8','async');

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global scom
hdata=['55';'aa';'01';'04';'26';'00';'fa';'80';'fa';'9e'];  %��ת
ddata=hex2dec(hdata);
fwrite(scom,ddata','uint8','async');

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global scom

hdata=['55';'aa';'01';'04';'26';'80';'ca';'80';'c8';'bc'];  %����
ddata=hex2dec(hdata);
fwrite(scom,ddata','uint8','async');

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global scom

string=get(handles.pushbutton7,'string');
if(strcmp(string,'�����')==1)
    hdata=['55';'aa';'02';'01';'31';'01';'34'];
    ddata=hex2dec(hdata);
    fwrite(scom,ddata','uint8','async');
    set(handles.pushbutton7,'string','�رճ���');
    set(handles.pushbutton10,'enable','on');
    
else
    hdata=['55';'aa';'02';'01';'31';'00';'33'];
    ddata=hex2dec(hdata);
    fwrite(scom,ddata','uint8','async');
    set(handles.pushbutton7,'string','�����');
    set(handles.pushbutton10,'enable','off');
    set(handles.edit1,'enable','on');   %�򿪻�����С�༭��
    set(handles.edit2,'enable','on');
    set(handles.edit3,'enable','on');   %�򿪻����˳�ʼλ�ñ༭��
    set(handles.edit4,'enable','on');
    set(handles.edit8,'Enable','on');   %���յ�λ�ñ༭��
    set(handles.edit9,'Enable','on');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global scom

string=get(handles.pushbutton8,'string');
if(strcmp(string,'�������')==1)
    hdata=['55';'aa';'02';'01';'36';'37'];
    ddata=hex2dec(hdata);
    fwrite(scom,ddata','uint8','async');
    set(handles.pushbutton8,'string','�رպ���');
else
    hdata=['55';'aa';'02';'01';'36';'37'];
    ddata=hex2dec(hdata);
    fwrite(scom,ddata','uint8','async');
    set(handles.pushbutton8,'string','�������');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)%QPSO1
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

envx=ceil(str2double(get(handles.edit1,'string'))); %��ȡ������С
envy=ceil(str2double(get(handles.edit2,'string')));
bx=ceil(str2double(get(handles.edit3,'string')));   %��ȡ�����˳�ʼλ��
by=ceil(str2double(get(handles.edit4,'string')));
ex=ceil(str2double(get(handles.edit8,'string')));   %��ȡ��������ֹλ��
ey=ceil(str2double(get(handles.edit9,'string')));
M=ceil(str2double(get(handles.edit5,'string')));%��ȡ�㷨����ά������������������
N=ceil(str2double(get(handles.edit6,'string')));
Iteration=ceil(str2double(get(handles.edit7,'string')));


if envx+envy<0
    errordlg('������Ϣ���ô�������������','��ʾ','replace');
    set(handles.edit1,'Enable','on');   %������С�༭��
    set(handles.edit2,'Enable','on');
else
    if bx+by<0 || bx>envx || by>envy || ex<0 || ey<0
        errordlg('�����˳�ʼλ�����ô�������������','��ʾ','replace');
        set(handles.edit3,'Enable','on');   %�����˳�ʼλ�ñ༭��
        set(handles.edit4,'Enable','on');
        set(handles.edit8,'Enable','on');   %�������յ�λ�ñ༭��
        set(handles.edit9,'Enable','on');
    else
        set(handles.edit1,'enable','off');    %�رջ�����С�༭��
        set(handles.edit2,'enable','off');
        set(handles.edit3,'enable','off');    %�رջ����˳�ʼλ�ñ༭��
        set(handles.edit4,'enable','off');
        set(handles.edit8,'Enable','off');    %�رջ������յ�λ�ñ༭��
        set(handles.edit9,'Enable','off');
        
        [P,S]= QPSO1([envx envy],[bx by],[ex ey],[M N Iteration]);%QPSO·���滮����
        handles.Path = P;
        handles.Steps = S;
        guidata(hObject,handles);
        
        set(handles.edit1,'enable','on');   %�򿪻�����С�༭��
        set(handles.edit2,'enable','on');
        set(handles.edit3,'enable','on');   %�򿪻����˳�ʼλ�ñ༭��
        set(handles.edit4,'enable','on');
        set(handles.edit8,'Enable','on');   %���յ�λ�ñ༭��
        set(handles.edit9,'Enable','on');
    end
end

% --- Executes when user attempts to close figure0.
function figure0_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% ��Ӵ���
global scom

chose=questdlg('��ȷ���˳���','�ر�ȷ��','Yes','No','Yes');
if strcmp(chose,'Yes')
    scomed = instrfind;  %�����Ѵ򿪴��ڶ���
    numcom=size(scomed);
    if numcom(2)~=0
        hdata=['55';'aa';'01';'00';'21';'21'];  %ֹͣ����������,���������ɵ���ʧ
        ddata=hex2dec(hdata);
        fwrite(scom,ddata','uint8','async');
        stopasync(scomed);   %ֹͣ���ڶ���
        fclose(scomed);  %�رմ��ڶ���
        delete(scomed);  %ɾ�����ڶ���
    end
    % Hint: delete(hObject) closes the figure
    delete(hObject);
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes on key press with focus on figure0 or any of its controls.
function figure0_WindowKeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure0 (see GCBO)
% eventdata  structure with the following fields (see FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global cpp
ctrl0=eventdata.Modifier;
if isempty(ctrl0)
    ctrl='';
else
    ctrl=ctrl0{1};
end
key=eventdata.Key;
switch ctrl
    case 'control'
        switch key
            case 'q'    %ctrl+q
                cpp=1;  % �����Ӧ�Ĳ���
            case 'w'   %ctrl+w
                % �����Ӧ�Ĳ���
            case 'e'   %ctrl+e
                % �����Ӧ�Ĳ���
        end
    case 'shift'
        % �����Ӧ�Ĳ���
    case 'alt'
        % �����Ӧ�Ĳ���
    case ''
        % �����Ӧ�Ĳ���
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



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global scom

path = handles.Path;
steps = handles.Steps;

Execution(path,steps);
guidata(hObject, handles);

hdata=['55';'aa';'02';'01';'31';'00';'33']; %�رճ���������
ddata=hex2dec(hdata);
fwrite(scom,ddata','uint8','async');
set(handles.pushbutton7,'string','�����');
set(handles.pushbutton7,'enable','on');    %�򿪳���ʹ�ܰ�ť
hdata=['55';'aa';'02';'01';'36';'37'];  %�رպ��⴫����
ddata=hex2dec(hdata);
fwrite(scom,ddata','uint8','async');
set(handles.pushbutton8,'string','�������');
set(handles.pushbutton8,'enable','on'); %�򿪺���ʹ�ܰ�ť
set(handles.edit1,'enable','on');    %�򿪻�����С�༭��
set(handles.edit2,'enable','on');
set(handles.edit3,'enable','on');    %�򿪻����˳�ʼλ�ñ༭��
set(handles.edit4,'enable','on');
set(handles.edit8,'Enable','on');
set(handles.edit9,'Enable','on');


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)%QPSO2
envx=ceil(str2double(get(handles.edit1,'string'))); %��ȡ������С
envy=ceil(str2double(get(handles.edit2,'string')));
bx=ceil(str2double(get(handles.edit3,'string')));   %��ȡ�����˳�ʼλ��
by=ceil(str2double(get(handles.edit4,'string')));
ex=ceil(str2double(get(handles.edit8,'string')));   %��ȡ��������ֹλ��
ey=ceil(str2double(get(handles.edit9,'string')));
M=ceil(str2double(get(handles.edit5,'string')));%��ȡ�㷨����ά������������������
N=ceil(str2double(get(handles.edit6,'string')));
Iteration=ceil(str2double(get(handles.edit7,'string')));


if envx+envy<0
    errordlg('������Ϣ���ô�������������','��ʾ','replace');
    set(handles.edit1,'Enable','on');   %������С�༭��
    set(handles.edit2,'Enable','on');
else
    if bx+by<0 || bx>envx || by>envy || ex<0 || ey<0
        errordlg('�����˳�ʼλ�����ô�������������','��ʾ','replace');
        set(handles.edit3,'Enable','on');   %�����˳�ʼλ�ñ༭��
        set(handles.edit4,'Enable','on');
        set(handles.edit8,'Enable','on');   %�������յ�λ�ñ༭��
        set(handles.edit9,'Enable','on');
    else
        set(handles.edit1,'enable','off');    %�رջ�����С�༭��
        set(handles.edit2,'enable','off');
        set(handles.edit3,'enable','off');    %�رջ����˳�ʼλ�ñ༭��
        set(handles.edit4,'enable','off');
        set(handles.edit8,'Enable','off');    %�رջ������յ�λ�ñ༭��
        set(handles.edit9,'Enable','off');
        
        [P,S]= QPSO2([envx envy],[bx by],[ex ey],[M N Iteration]);%QPSO·���滮����
        handles.Path = P;
        handles.Steps = S;
        guidata(hObject,handles);
        
        set(handles.edit1,'enable','on');   %�򿪻�����С�༭��
        set(handles.edit2,'enable','on');
        set(handles.edit3,'enable','on');   %�򿪻����˳�ʼλ�ñ༭��
        set(handles.edit4,'enable','on');
        set(handles.edit8,'Enable','on');   %���յ�λ�ñ༭��
        set(handles.edit9,'Enable','on');
    end
end


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)%QPSO3
envx=ceil(str2double(get(handles.edit1,'string'))); %��ȡ������С
envy=ceil(str2double(get(handles.edit2,'string')));
bx=ceil(str2double(get(handles.edit3,'string')));   %��ȡ�����˳�ʼλ��
by=ceil(str2double(get(handles.edit4,'string')));
ex=ceil(str2double(get(handles.edit8,'string')));   %��ȡ��������ֹλ��
ey=ceil(str2double(get(handles.edit9,'string')));
M=ceil(str2double(get(handles.edit5,'string')));%��ȡ�㷨����ά������������������
N=ceil(str2double(get(handles.edit6,'string')));
Iteration=ceil(str2double(get(handles.edit7,'string')));


if envx+envy<0
    errordlg('������Ϣ���ô�������������','��ʾ','replace');
    set(handles.edit1,'Enable','on');   %������С�༭��
    set(handles.edit2,'Enable','on');
else
    if bx+by<0 || bx>envx || by>envy || ex<0 || ey<0
        errordlg('�����˳�ʼλ�����ô�������������','��ʾ','replace');
        set(handles.edit3,'Enable','on');   %�����˳�ʼλ�ñ༭��
        set(handles.edit4,'Enable','on');
        set(handles.edit8,'Enable','on');   %�������յ�λ�ñ༭��
        set(handles.edit9,'Enable','on');
    else
        set(handles.edit1,'enable','off');    %�رջ�����С�༭��
        set(handles.edit2,'enable','off');
        set(handles.edit3,'enable','off');    %�رջ����˳�ʼλ�ñ༭��
        set(handles.edit4,'enable','off');
        set(handles.edit8,'Enable','off');    %�رջ������յ�λ�ñ༭��
        set(handles.edit9,'Enable','off');
        
        [P,S]= QPSO3([envx envy],[bx by],[ex ey],[M N Iteration]);%QPSO·���滮����
        handles.Path = P;
        handles.Steps = S;
        guidata(hObject,handles);
        set(handles.edit1,'enable','on');   %�򿪻�����С�༭��
        set(handles.edit2,'enable','on');
        set(handles.edit3,'enable','on');   %�򿪻����˳�ʼλ�ñ༭��
        set(handles.edit4,'enable','on');
        set(handles.edit8,'Enable','on');   %���յ�λ�ñ༭��
        set(handles.edit9,'Enable','on');
    end
end


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)%Load1
envx=ceil(str2double(get(handles.edit1,'string'))); %��ȡ������С
envy=ceil(str2double(get(handles.edit2,'string')));
bx=ceil(str2double(get(handles.edit3,'string')));   %��ȡ�����˳�ʼλ��
by=ceil(str2double(get(handles.edit4,'string')));
ex=ceil(str2double(get(handles.edit8,'string')));   %��ȡ��������ֹλ��
ey=ceil(str2double(get(handles.edit9,'string')));



if envx+envy<0
    errordlg('������Ϣ���ô�������������','��ʾ','replace');
    set(handles.edit1,'Enable','on');   %������С�༭��
    set(handles.edit2,'Enable','on');
else
    if bx+by<0 || bx>envx || by>envy || ex<0 || ey<0
        errordlg('�����˳�ʼλ�����ô�������������','��ʾ','replace');
        set(handles.edit3,'Enable','on');   %�����˳�ʼλ�ñ༭��
        set(handles.edit4,'Enable','on');
        set(handles.edit8,'Enable','on');   %�������յ�λ�ñ༭��
        set(handles.edit9,'Enable','on');
    else
        set(handles.edit1,'enable','off');    %�رջ�����С�༭��
        set(handles.edit2,'enable','off');
        set(handles.edit3,'enable','off');    %�رջ����˳�ʼλ�ñ༭��
        set(handles.edit4,'enable','off');
        set(handles.edit8,'Enable','off');    %�رջ������յ�λ�ñ༭��
        set(handles.edit9,'Enable','off');
        
        Load1([envx envy],[bx by],[ex ey]);%QPSO·���滮����
        
    end
end


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)%%Load2
envx=ceil(str2double(get(handles.edit1,'string'))); %��ȡ������С
envy=ceil(str2double(get(handles.edit2,'string')));
bx=ceil(str2double(get(handles.edit3,'string')));   %��ȡ�����˳�ʼλ��
by=ceil(str2double(get(handles.edit4,'string')));
ex=ceil(str2double(get(handles.edit8,'string')));   %��ȡ��������ֹλ��
ey=ceil(str2double(get(handles.edit9,'string')));



if envx+envy<0
    errordlg('������Ϣ���ô�������������','��ʾ','replace');
    set(handles.edit1,'Enable','on');   %������С�༭��
    set(handles.edit2,'Enable','on');
else
    if bx+by<0 || bx>envx || by>envy || ex<0 || ey<0
        errordlg('�����˳�ʼλ�����ô�������������','��ʾ','replace');
        set(handles.edit3,'Enable','on');   %�����˳�ʼλ�ñ༭��
        set(handles.edit4,'Enable','on');
        set(handles.edit8,'Enable','on');   %�������յ�λ�ñ༭��
        set(handles.edit9,'Enable','on');
    else
        set(handles.edit1,'enable','off');    %�رջ�����С�༭��
        set(handles.edit2,'enable','off');
        set(handles.edit3,'enable','off');    %�رջ����˳�ʼλ�ñ༭��
        set(handles.edit4,'enable','off');
        set(handles.edit8,'Enable','off');    %�رջ������յ�λ�ñ༭��
        set(handles.edit9,'Enable','off');
        
        Load2([envx envy],[bx by],[ex ey]);%QPSO·���滮����
        
    end
end


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)%%Load3
envx=ceil(str2double(get(handles.edit1,'string'))); %��ȡ������С
envy=ceil(str2double(get(handles.edit2,'string')));
bx=ceil(str2double(get(handles.edit3,'string')));   %��ȡ�����˳�ʼλ��
by=ceil(str2double(get(handles.edit4,'string')));
ex=ceil(str2double(get(handles.edit8,'string')));   %��ȡ��������ֹλ��
ey=ceil(str2double(get(handles.edit9,'string')));



if envx+envy<0
    errordlg('������Ϣ���ô�������������','��ʾ','replace');
    set(handles.edit1,'Enable','on');   %������С�༭��
    set(handles.edit2,'Enable','on');
else
    if bx+by<0 || bx>envx || by>envy || ex<0 || ey<0
        errordlg('�����˳�ʼλ�����ô�������������','��ʾ','replace');
        set(handles.edit3,'Enable','on');   %�����˳�ʼλ�ñ༭��
        set(handles.edit4,'Enable','on');
        set(handles.edit8,'Enable','on');   %�������յ�λ�ñ༭��
        set(handles.edit9,'Enable','on');
    else
        set(handles.edit1,'enable','off');    %�رջ�����С�༭��
        set(handles.edit2,'enable','off');
        set(handles.edit3,'enable','off');    %�رջ����˳�ʼλ�ñ༭��
        set(handles.edit4,'enable','off');
        set(handles.edit8,'Enable','off');    %�رջ������յ�λ�ñ༭��
        set(handles.edit9,'Enable','off');
        
        Load3([envx envy],[bx by],[ex ey]);%QPSO·���滮����
        
    end
end

