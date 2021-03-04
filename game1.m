function varargout = game1(varargin)
% GAME1 MATLAB code for game1.fig
%      GAME1, by itself, creates a new GAME1 or raises the existing
%      singleton*.
%
%      H = GAME1 returns the handle to a new GAME1 or the handle to
%      the existing singleton*.
%
%      GAME1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAME1.M with the given input arguments.
%
%      GAME1('Property','Value',...) creates a new GAME1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before game1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to game1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help game1

% Last Modified by GUIDE v2.5 04-Apr-2020 10:33:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @game1_OpeningFcn, ...
                   'gui_OutputFcn',  @game1_OutputFcn, ...
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


% --- Executes just before game1 is made visible.
function game1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to game1 (see VARARGIN)

% Choose default command line output for game1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes game1 wait for user response (see UIRESUME)
% uiwait(handles.game1);


% --- Outputs from this function are returned to the command line.
function varargout = game1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function game1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to game1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% --- Executes during object creation, after setting all properties.
pic = axes('units','normalized','pos',[0 0 1 1]);
uistack(pic,'down');
Pic=imread('game1.jpg');
image(Pic);
colormap gray
set(pic,'handlevisibility','off','visible','off');


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.game1,'visible','off')
run('game1_1.m')


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
check = get(handles.pushbutton2,'Value');
if check == 1
    UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
    set(0, 'DefaultUIControlFontSize', 16);
    error = menu(' you really wanna go away ? ',' yes ',' no ');
    set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak);
end
if error == 1
 set(handles.game1,'visible','off')
 run('page2.m')
else
 run('game1.m')   
end


% --- Executes during object deletion, before destroying properties.
function pushbutton2_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
