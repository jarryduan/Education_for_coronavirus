function varargout = part3_2(varargin)
% PART3_2 MATLAB code for part3_2.fig
%      PART3_2, by itself, creates a new PART3_2 or raises the existing
%      singleton*.
%
%      H = PART3_2 returns the handle to a new PART3_2 or the handle to
%      the existing singleton*.
%
%      PART3_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART3_2.M with the given input arguments.
%
%      PART3_2('Property','Value',...) creates a new PART3_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part3_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part3_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part3_2

% Last Modified by GUIDE v2.5 12-Apr-2020 20:00:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part3_2_OpeningFcn, ...
                   'gui_OutputFcn',  @part3_2_OutputFcn, ...
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


% --- Executes just before part3_2 is made visible.
function part3_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part3_2 (see VARARGIN)
bbb=axes('units','normalized','pos',[0 0 1 1]);
axis off
aaa=imread('airport.jpg');
image(aaa);
set(bbb,'visible','off');
movegui(handles.figure1,'center');

trend='Globle Virus Spreading Trend';
text('string',trend,'fontsize',25,'position',[140 130],'color','w');

axes(handles.vedio);
axis off
ccc=imread('cut1.jpg');
image(ccc);


% Choose default command line output for part3_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part3_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part3_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in next222.
function next222_Callback(hObject, eventdata, handles)
% hObject    handle to next222 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(findall(0))
part3_3;
% Hint: get(hObject,'Value') returns toggle state of next222



% --- Executes on button press in START.
function START_Callback(hObject, eventdata, handles)
% hObject    handle to START (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.vedio);
axis off
obj=VideoReader('globle virus.avi');
nFrames=obj.NumberOfFrames;
vidHeight=obj.Height;
vidwidth=obj.Width;
for k=1:nFrames
    I=read(obj,k);
    imshow(I);
    pause(0.005);
end
% Hint: get(hObject,'Value') returns toggle state of START
