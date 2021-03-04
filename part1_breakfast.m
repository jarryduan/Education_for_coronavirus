function varargout = part1_breakfast(varargin)
% PART1_BREAKFAST MATLAB code for part1_breakfast.fig
%      PART1_BREAKFAST, by itself, creates a new PART1_BREAKFAST or raises the existing
%      singleton*.
%
%      H = PART1_BREAKFAST returns the handle to a new PART1_BREAKFAST or the handle to
%      the existing singleton*.
%
%      PART1_BREAKFAST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART1_BREAKFAST.M with the given input arguments.
%
%      PART1_BREAKFAST('Property','Value',...) creates a new PART1_BREAKFAST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part1_breakfast_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part1_breakfast_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part1_breakfast

% Last Modified by GUIDE v2.5 07-Apr-2020 10:05:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part1_breakfast_OpeningFcn, ...
                   'gui_OutputFcn',  @part1_breakfast_OutputFcn, ...
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


% --- Executes just before part1_breakfast is made visible.
function part1_breakfast_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part1_breakfast (see VARARGIN)
bbb=axes('units','normalized','pos',[0 0 1 1]);
axis off
aaa=imread('breakfast.jpg');
image(aaa);
set(bbb,'visible','off');
movegui(handles.figure1,'center');
% Choose default command line output for part1_breakfast
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part1_breakfast wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part1_breakfast_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in hand.
function hand_Callback(hObject, eventdata, handles)
% hObject    handle to hand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'upscore',getappdata(0,'upscore')+0);
setappdata(0,'downscore',getappdata(0,'downscore')+2);
setappdata(0,'words3','3.Never use your dirty hands to hold food!!!');
close all
part1_shop;
% Hint: get(hObject,'Value') returns toggle state of hand


% --- Executes on button press in washhand.
function washhand_Callback(hObject, eventdata, handles)
% hObject    handle to washhand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'upscore',getappdata(0,'upscore')+2);
setappdata(0,'downscore',getappdata(0,'downscore')+2);
setappdata(0,'words3','3.You remamber to wash hands before eating!Awesome!');
close all
part1_shop;
% Hint: get(hObject,'Value') returns toggle state of washhand
