function varargout = part1_icecream(varargin)
% PART1_ICECREAM MATLAB code for part1_icecream.fig
%      PART1_ICECREAM, by itself, creates a new PART1_ICECREAM or raises the existing
%      singleton*.
%
%      H = PART1_ICECREAM returns the handle to a new PART1_ICECREAM or the handle to
%      the existing singleton*.
%
%      PART1_ICECREAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART1_ICECREAM.M with the given input arguments.
%
%      PART1_ICECREAM('Property','Value',...) creates a new PART1_ICECREAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part1_icecream_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part1_icecream_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part1_icecream

% Last Modified by GUIDE v2.5 07-Apr-2020 22:42:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part1_icecream_OpeningFcn, ...
                   'gui_OutputFcn',  @part1_icecream_OutputFcn, ...
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


% --- Executes just before part1_icecream is made visible.
function part1_icecream_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part1_icecream (see VARARGIN)
bbb=axes('units','normalized','pos',[0 0 1 1]);
axis off
aaa=imread('haagendazs.jpg');
image(aaa);
set(bbb,'visible','off');
movegui(handles.figure1,'center');
% Choose default command line output for part1_icecream
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part1_icecream wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part1_icecream_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pickup.
function pickup_Callback(hObject, eventdata, handles)
% hObject    handle to pickup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
part1_sleep;
% Hint: get(hObject,'Value') returns toggle state of pickup


% --- Executes on button press in letgo.
function letgo_Callback(hObject, eventdata, handles)
% hObject    handle to letgo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
part1_sleep;
% Hint: get(hObject,'Value') returns toggle state of letgo
