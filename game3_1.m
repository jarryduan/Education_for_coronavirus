function varargout = game3_1(varargin)
% GAME3_1 MATLAB code for game3_1.fig
%      GAME3_1, by itself, creates a new GAME3_1 or raises the existing
%      singleton*.
%
%      H = GAME3_1 returns the handle to a new GAME3_1 or the handle to
%      the existing singleton*.
%
%      GAME3_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAME3_1.M with the given input arguments.
%
%      GAME3_1('Property','Value',...) creates a new GAME3_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before game3_1_OpeningFcn gets called.  An
%      unrecognized property text3 or invalid value makes property application
%      stop.  All inputs are passed to game3_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help game3_1

% Last Modified by GUIDE v2.5 08-Apr-2020 10:22:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @game3_1_OpeningFcn, ...
                   'gui_OutputFcn',  @game3_1_OutputFcn, ...
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


% --- Executes just before game3_1 is made visible.
function game3_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to game3_1 (see VARARGIN)

% Choose default command line output for game3_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes game3_1 wait for user response (see UIRESUME)
% uiwait(handles.game3_1);


% --- Outputs from this function are returned to the command line.
function varargout = game3_1_OutputFcn(hObject, eventdata, handles) 
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
set(handles.game3_1,'visible','off')
run('game3_2.m')

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choice_1 = get(handles.text3,'Value');
if choice_1 == 1
    play = get(handles.pushbutton2,'Value');
    if play==1
    set(handles.game3_1,'visible','off')
    run('test1.m')
    end
else
    errordlg('Input your name first! ');
    pause(2.5)
end


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
name = get(handles.edit1,'string');
change = sprintf(' Welcome!  %s ',name);
set(handles.text3,'String',change)
set(handles.text3,'Value',1)

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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
check = get(handles.pushbutton3,'Value');
if check == 1
    UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
    set(0, 'DefaultUIControlFontSize', 16);
    error = menu(' you don''t wanna do the test ? ',' yes ',' no ');
    set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak);
end

if error == 1
 set(handles.edit1,'String','')
 set(handles.text3,'String','')
 set(handles.game3_1,'visible','off')
 run('game3.m')
else
 run('game3_1.m')   
end
