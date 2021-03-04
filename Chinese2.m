function varargout = Chinese2(varargin)
% CHINESE2 MATLAB code for Chinese2.fig
%      CHINESE2, by itself, creates a new CHINESE2 or raises the existing
%      singleton*.
%
%      H = CHINESE2 returns the handle to a new CHINESE2 or the handle to
%      the existing singleton*.
%
%      CHINESE2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHINESE2.M with the given input arguments.
%
%      CHINESE2('Property','Value',...) creates a new CHINESE2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Chinese2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Chinese2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Chinese2

% Last Modified by GUIDE v2.5 12-Apr-2020 13:55:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Chinese2_OpeningFcn, ...
                   'gui_OutputFcn',  @Chinese2_OutputFcn, ...
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


% --- Executes just before Chinese2 is made visible.
function Chinese2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Chinese2 (see VARARGIN)

% Choose default command line output for Chinese2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Chinese2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Chinese2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
ha=axes('units','normalized','pos',[0 0 1 1]);
uistack(ha,'bottom');
ii=imread('total.jpg');
image(ii);
colormap gray
set(ha,'handlevisibility','off','visible','off');
%Chinesetext='The situation in China about the 2019-nCoV.';
%text('string',Chinesetext,'fontsize',18','position',[120,420]);


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(Chinese2);
run('Chinese.m');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(Chinese2);
run('total.m');
