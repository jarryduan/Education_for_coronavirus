function varargout = game3(varargin)
% GAME3 MATLAB code for game3.fig
%      GAME3, by itself, creates a new GAME3 or raises the existing
%      singleton*.
%
%      H = GAME3 returns the handle to a new GAME3 or the handle to
%      the existing singleton*.
%
%      GAME3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAME3.M with the given input arguments.
%
%      GAME3('Property','Value',...) creates a new GAME3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before game3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to game3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help game3

% Last Modified by GUIDE v2.5 04-Apr-2020 19:04:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @game3_OpeningFcn, ...
                   'gui_OutputFcn',  @game3_OutputFcn, ...
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


% --- Executes just before game3 is made visible.
function game3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to game3 (see VARARGIN)

% Choose default command line output for game3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes game3 wait for user response (see UIRESUME)
% uiwait(handles.game3);


% --- Outputs from this function are returned to the command line.
function varargout = game3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function game3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to game3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
pic = axes('units','normalized','pos',[0 0 1 1]);
uistack(pic,'down');
Pic=imread('game3.jpg');
image(Pic);
colormap gray
set(pic,'handlevisibility','off','visible','off');


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
check = get(handles.pushbutton1,'Value');
if check == 1
    UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
    set(0, 'DefaultUIControlFontSize', 16);
    error = menu(' you really wanna go away ? ',' yes ',' no ');
    set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak);
end
if error == 1
 set(handles.game3,'visible','off')
 run('page2.m')
else
 run('game3.m')   
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.game3,'visible','off')
run('game3_1.m')
