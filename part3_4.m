function varargout = part3_4(varargin)
% PART3_4 MATLAB code for part3_4.fig
%      PART3_4, by itself, creates a new PART3_4 or raises the existing
%      singleton*.
%
%      H = PART3_4 returns the handle to a new PART3_4 or the handle to
%      the existing singleton*.
%
%      PART3_4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART3_4.M with the given input arguments.
%
%      PART3_4('Property','Value',...) creates a new PART3_4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part3_4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part3_4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part3_4

% Last Modified by GUIDE v2.5 12-Apr-2020 20:45:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part3_4_OpeningFcn, ...
                   'gui_OutputFcn',  @part3_4_OutputFcn, ...
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


% --- Executes just before part3_4 is made visible.
function part3_4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part3_4 (see VARARGIN)
bbb=axes('units','normalized','pos',[0 0 1 1]);
axis off
aaa=imread('airport.jpg');
image(aaa);
set(bbb,'visible','off');
movegui(handles.figure1,'center');

trend='Why We Can Not Go To School';
text('string',trend,'fontsize',25,'position',[140 130],'color','w');

axes(handles.vedio3);
axis off
ccc=imread('cut3.jpg');
image(ccc);

% Choose default command line output for part3_4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part3_4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part3_4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start444.
function start444_Callback(hObject, eventdata, handles)
% hObject    handle to start444 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.vedio3);
axis off
obj=VideoReader('school.avi');
nFrames=obj.NumberOfFrames;
vidHeight=obj.Height;
vidwidth=obj.Width;
for k=1:nFrames
    I=read(obj,k);
    imshow(I);
    pause(0.005);
end
% Hint: get(hObject,'Value') returns toggle state of start444


% --- Executes on button press in menu444.
function menu444_Callback(hObject, eventdata, handles)
% hObject    handle to menu444 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(findall(0))
part3_5;
% Hint: get(hObject,'Value') returns toggle state of menu444
