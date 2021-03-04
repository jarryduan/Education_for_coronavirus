function varargout = answer_sheet2(varargin)
% ANSWER_SHEET2 MATLAB code for answer_sheet2.fig
%      ANSWER_SHEET2, by itself, creates a new ANSWER_SHEET2 or raises the existing
%      singleton*.
%
%      H = ANSWER_SHEET2 returns the handle to a new ANSWER_SHEET2 or the handle to
%      the existing singleton*.
%
%      ANSWER_SHEET2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANSWER_SHEET2.M with the given input arguments.
%
%      ANSWER_SHEET2('Property','Value',...) creates a new ANSWER_SHEET2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before answer_sheet2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to answer_sheet2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help answer_sheet2

% Last Modified by GUIDE v2.5 10-Apr-2020 12:26:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @answer_sheet2_OpeningFcn, ...
                   'gui_OutputFcn',  @answer_sheet2_OutputFcn, ...
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



% --- Executes just before answer_sheet2 is made visible.
function answer_sheet2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to answer_sheet2 (see VARARGIN)

% Choose default command line output for answer_sheet2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes answer_sheet2 wait for user response (see UIRESUME)
% uiwait(handles.answer_sheet2);


% --- Outputs from this function are returned to the command line.
function varargout = answer_sheet2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function answer_sheet2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to answer_sheet2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
pic = axes('units','normalized','pos',[0 0 1 1]);
uistack(pic,'down');
Pic=imread('sheet.jpg');
image(Pic);
colormap gray
set(pic,'handlevisibility','off','visible','off');


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global score flag 
if get(handles.radiobutton4,'value')
    score=score+1;
    set(handles.pushbutton1,'visible','off')
else
    flag(1,8)=1;
    set(handles.pushbutton1,'visible','off')
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global score flag 
if get(handles.radiobutton12,'value')
    score=score+1;
    set(handles.pushbutton3,'visible','off')
else
    flag(1,10)=1;
    set(handles.pushbutton3,'visible','off')
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global score flag 
if get(handles.radiobutton7,'value')
    score=score+1;
    set(handles.pushbutton2,'visible','off')
else
    flag(1,9)=1;
    set(handles.pushbutton2,'visible','off')
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


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('answer.m')


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


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global score 
set(handles.pushbutton4,'visible','on') 
check = get(handles.pushbutton7,'Value');
if check == 1
    UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
    set(0, 'DefaultUIControlFontSize', 16);
    error = menu(' Sure to submit your answer ? ',' yes ',' no ');
    set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak);
end
if error == 1
set(handles.edit1,'String',score)
   if score<10
      set(handles.text9,'visible','on') 
   else
      set(handles.pushbutton11,'visible','on')
   end
end



% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.answer_sheet2,'visible','off')
run('answer_sheet1.m')


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global score flag 
check = get(handles.pushbutton9,'Value');
if check == 1
    UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
    set(0, 'DefaultUIControlFontSize', 16);
    errorm = menu(' Try again ? ',' yes ',' no ');
    set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak);
end
if errorm == 1
score = 0;
flag =zeros(1,10);
set(handles.edit1,'String','')
close
run('answer_sheet1.m')
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
run('surprise.m')