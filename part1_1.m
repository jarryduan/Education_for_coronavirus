function varargout = part1_1(varargin)
% PART1_1 MATLAB code for part1_1.fig
%      PART1_1, by itself, creates a new PART1_1 or raises the existing
%      singleton*.
%
%      H = PART1_1 returns the handle to a new PART1_1 or the handle to
%      the existing singleton*.
%
%      PART1_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART1_1.M with the given input arguments.
%
%      PART1_1('Property','Value',...) creates a new PART1_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part1_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part1_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part1_1

% Last Modified by GUIDE v2.5 29-Mar-2020 10:33:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part1_1_OpeningFcn, ...
                   'gui_OutputFcn',  @part1_1_OutputFcn, ...
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


% --- Executes just before part1_1 is made visible.
function part1_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part1_1 (see VARARGIN)
bbb=axes('units','normalized','pos',[0 0 1 1]);
axis off
aaa=imread('room.jpg');
image(aaa);
set(bbb,'visible','off');
movegui(handles.figure1,'center');

% Choose default command line output for part1_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part1_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part1_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start1.
function start1_Callback(hObject, eventdata, handles)
% hObject    handle to start1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
part1_2;

% Hint: get(hObject,'Value') returns toggle state of start1


% --- Executes on button press in back1.
function back1_Callback(hObject, eventdata, handles)
% hObject    handle to back1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
gui2;


% Hint: get(hObject,'Value') returns toggle state of back1
