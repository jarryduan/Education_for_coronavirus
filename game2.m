function varargout = game2(varargin)
% GAME2 MATLAB code for game2.fig
%      GAME2, by itself, creates a new GAME2 or raises the existing
%      singleton*.
%
%      H = GAME2 returns the handle to a new GAME2 or the handle to
%      the existing singleton*.
%
%      GAME2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAME2.M with the given input arguments.
%
%      GAME2('Property','Value',...) creates a new GAME2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before game2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to game2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help game2

% Last Modified by GUIDE v2.5 04-Apr-2020 11:30:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @game2_OpeningFcn, ...
                   'gui_OutputFcn',  @game2_OutputFcn, ...
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


% --- Executes just before game2 is made visible.
function game2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to game2 (see VARARGIN)

% Choose default command line output for game2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes game2 wait for user response (see UIRESUME)
% uiwait(handles.game2);


% --- Outputs from this function are returned to the command line.
function varargout = game2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function game2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to game2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
pic = axes('units','normalized','pos',[0 0 1 1]);
uistack(pic,'down');
Pic=imread('game2.jpg');
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
 set(handles.game2,'visible','off')
 run('page2.m')
else
 run('game2.m')   
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.game2,'visible','off')
run('game2_1.m')
