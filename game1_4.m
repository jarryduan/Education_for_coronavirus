function varargout = game1_4(varargin)
% GAME1_4 MATLAB code for game1_4.fig
%      GAME1_4, by itself, creates a new GAME1_4 or raises the existing
%      singleton*.
%
%      H = GAME1_4 returns the handle to a new GAME1_4 or the handle to
%      the existing singleton*.
%
%      GAME1_4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAME1_4.M with the given input arguments.
%
%      GAME1_4('Property','Value',...) creates a new GAME1_4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before game1_4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to game1_4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help game1_4

% Last Modified by GUIDE v2.5 04-Apr-2020 12:02:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @game1_4_OpeningFcn, ...
                   'gui_OutputFcn',  @game1_4_OutputFcn, ...
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


% --- Executes just before game1_4 is made visible.
function game1_4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to game1_4 (see VARARGIN)

% Choose default command line output for game1_4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes game1_4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = game1_4_OutputFcn(hObject, eventdata, handles) 
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
set(handles.figure1,'visible','off')
run('game1_2.m')
