function varargout = page1(varargin)
% PAGE1 MATLAB code for page1.fig
%      PAGE1, by itself, creates a new PAGE1 or raises the existing
%      singleton*.
%
%      H = PAGE1 returns the handle to a new PAGE1 or the handle to
%      the existing singleton*.
%
%      PAGE1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PAGE1.M with the given input arguments.
%
%      PAGE1('Property','Value',...) creates a new PAGE1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before page1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to page1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help page1

% Last Modified by GUIDE v2.5 26-Mar-2020 15:57:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @page1_OpeningFcn, ...
                   'gui_OutputFcn',  @page1_OutputFcn, ...
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


% --- Executes just before page1 is made visible.
function page1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to page1 (see VARARGIN)

% Choose default command line output for page1
handles.output = hObject;
handles.output = hObject;
tu_biao=importdata('page1.jpg');
set(handles.pushbutton1,'CDATA',tu_biao)
% Update handles structure
guidata(hObject, handles);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes page1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = page1_OutputFcn(hObject, eventdata, handles) 
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
pic = axes('units','normalized','pos',[0 0 1 1]);
uistack(pic,'down');
Pic=imread('page1.png');
image(Pic);
colormap gray
set(pic,'handlevisibility','off','visible','off');


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.figure1,'visible','off')
run('movie1.m')


