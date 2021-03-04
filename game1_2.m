function varargout = game1_2(varargin)
% GAME1_2 MATLAB code for game1_2.fig
%      GAME1_2, by itself, creates a new GAME1_2 or raises the existing
%      singleton*.
%
%      H = GAME1_2 returns the handle to a new GAME1_2 or the handle to
%      the existing singleton*.
%
%      GAME1_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAME1_2.M with the given input arguments.
%
%      GAME1_2('Property','Value',...) creates a new GAME1_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before game1_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to game1_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help game1_2

% Last Modified by GUIDE v2.5 04-Apr-2020 11:53:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @game1_2_OpeningFcn, ...
                   'gui_OutputFcn',  @game1_2_OutputFcn, ...
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


% --- Executes just before game1_2 is made visible.
function game1_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to game1_2 (see VARARGIN)

% Choose default command line output for game1_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes game1_2 wait for user response (see UIRESUME)
% uiwait(handles.game1_2);


% --- Outputs from this function are returned to the command line.
function varargout = game1_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text2.
function text2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.game1_1,'visible','off')


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.game1_1,'visible','off')
run('game1_4.m')


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.game1_1,'visible','off')
run('game1_1.m')
