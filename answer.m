function varargout = answer(varargin)
% ANSWER MATLAB code for answer.fig
%      ANSWER, by itself, creates a new ANSWER or raises the existing
%      singleton*.
%
%      H = ANSWER returns the handle to a new ANSWER or the handle to
%      the existing singleton*.
%
%      ANSWER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANSWER.M with the given input arguments.
%
%      ANSWER('Property','Value',...) creates a new ANSWER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before answer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to answer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help answer

% Last Modified by GUIDE v2.5 09-Apr-2020 14:57:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @answer_OpeningFcn, ...
                   'gui_OutputFcn',  @answer_OutputFcn, ...
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


% --- Executes just before answer is made visible.
function answer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to answer (see VARARGIN)

% Choose default command line output for answer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes answer wait for user response (see UIRESUME)
% uiwait(handles.answer);


% --- Outputs from this function are returned to the command line.
function varargout = answer_OutputFcn(hObject, eventdata, handles) 
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
set(handles.answer,'visible','off')


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load question2 
load answer1
check=get(handles.slider1,'Value');
if check==0
    set(handles.pushbutton2,'visible','off')
    a=sprintf(' How does the coronavirus spread ?');
    b=sprintf('A.  By air, by breath, by food');
    c=sprintf('B.  By air, by touch, by breath');
    d=sprintf('C.  By air, by touch, by food');
    e=sprintf('D.  By air, by food, by blood ');
    f=sprintf('%s\n %s\n %s\n %s\n %s\n',a,b,c,d,e);
    set(handles.text3,'String',f)
else
    set(handles.slider1,'Value',check-1)
    lla=sprintf('%s',question2(check));
    laa=sprintf('%s',answer2(check));
    set(handles.text3,'String',lla)
    set(handles.text4,'String',laa)
    if check==8
    set(handles.pushbutton3,'visible','on')
    end
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load question2 
load answer1
set(handles.pushbutton2,'Visible','on')
chec=get(handles.slider1,'Value');
set(handles.slider1,'Value',chec+1)
lla=sprintf('%s',question2(chec+1));
laa=sprintf('%s',answer2(chec+1));
set(handles.text3,'String',lla)
set(handles.text4,'String',laa)
if chec==8
    set(handles.pushbutton3,'Visible','off')
end
