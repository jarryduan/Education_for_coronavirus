function varargout = answer_sheet1(varargin)
% ANSWER_SHEET1 MATLAB code for answer_sheet1.fig
%      ANSWER_SHEET1, by itself, creates a new ANSWER_SHEET1 or raises the existing
%      singleton*.
%
%      H = ANSWER_SHEET1 returns the handle to a new ANSWER_SHEET1 or the handle to
%      the existing singleton*.
%
%      ANSWER_SHEET1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANSWER_SHEET1.M with the given input arguments.
%
%      ANSWER_SHEET1('Property','Value',...) creates a new ANSWER_SHEET1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before answer_sheet1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to answer_sheet1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help answer_sheet1

% Last Modified by GUIDE v2.5 09-Apr-2020 00:45:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @answer_sheet1_OpeningFcn, ...
                   'gui_OutputFcn',  @answer_sheet1_OutputFcn, ...
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


% --- Executes just before answer_sheet1 is made visible.
function answer_sheet1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to answer_sheet1 (see VARARGIN)

% Choose default command line output for answer_sheet1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes answer_sheet1 wait for user response (see UIRESUME)
% uiwait(handles.answer_sheet1);

global score flag 
score = 0;
flag=zeros(1,10);


% --- Outputs from this function are returned to the command line.
function varargout = answer_sheet1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function answer_sheet1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to answer_sheet1 (see GCBO)
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
if get(handles.radiobutton2,'value')
    score=score+1;
    set(handles.pushbutton1,'visible','off')
else
    flag(1,1)=1;
    set(handles.pushbutton1,'visible','off')
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global score flag 
if get(handles.radiobutton5,'value')
    score=score+1;
    set(handles.pushbutton2,'visible','off')
else
    flag(1,2)=1;
    set(handles.pushbutton2,'visible','off')
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global score flag 
if get(handles.radiobutton16,'value')
    score=score+1;
    set(handles.pushbutton4,'visible','off')
else
    flag(1,3)=1;
    set(handles.pushbutton4,'visible','off')
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global score flag 
if get(handles.radiobutton28,'value')
    score=score+1;
    set(handles.pushbutton7,'visible','off')
else
    flag(1,5)=1;
    set(handles.pushbutton7,'visible','off')
end

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global score flag 
if get(handles.radiobutton20,'value')
    score=score+1;
    set(handles.pushbutton5,'visible','off')
else
    flag(1,4)=1;
    set(handles.pushbutton5,'visible','off')
end

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global score flag 
if get(handles.radiobutton30,'value')
    score=score+1;
    set(handles.pushbutton8,'visible','off')
else
    flag(1,6)=1;
    set(handles.pushbutton8,'visible','off')
end

% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global score flag 
if get(handles.radiobutton34,'value')
    score=score+1;
    set(handles.pushbutton9,'visible','off')
else
    flag(1,7)=1;
    set(handles.pushbutton9,'visible','off')
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
run('answer_sheet2.m')
