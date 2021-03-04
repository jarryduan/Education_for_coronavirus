function varargout = part3_5(varargin)
% PART3_5 MATLAB code for part3_5.fig
%      PART3_5, by itself, creates a new PART3_5 or raises the existing
%      singleton*.
%
%      H = PART3_5 returns the handle to a new PART3_5 or the handle to
%      the existing singleton*.
%
%      PART3_5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART3_5.M with the given input arguments.
%
%      PART3_5('Property','Value',...) creates a new PART3_5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part3_5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part3_5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part3_5

% Last Modified by GUIDE v2.5 12-Apr-2020 21:56:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part3_5_OpeningFcn, ...
                   'gui_OutputFcn',  @part3_5_OutputFcn, ...
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


% --- Executes just before part3_5 is made visible.
function part3_5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part3_5 (see VARARGIN)
bbb=axes('units','normalized','pos',[0 0 1 1]);
axis off
aaa=imread('airport666.jpg');
image(aaa);
set(bbb,'visible','off');
movegui(handles.figure1,'center');

those='Those models are so beautiful!';
it='It is the best warning of';
danger='How dangerous 2019-NcOv is!';
text('string',those,'fontsize',22,'position',[130 100],'color','c');
text('string',it,'fontsize',22,'position',[130 220],'color','c');
text('string',danger,'fontsize',22,'position',[130 340],'color','c');

thanks='Thanks To the following bibili UPs:';
ka='kaday';
al='阿里大爷';
ht='小海团';
text('string',thanks,'fontsize',16,'position',[80 900],'color','g');
text('string',ka,'fontsize',16,'position',[150 980],'color','g');
text('string',al,'fontsize',16,'position',[150 1080],'color','g');
text('string',ht,'fontsize',16,'position',[150 1180],'color','g');

% Choose default command line output for part3_5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part3_5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part3_5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in menu555.
function menu555_Callback(hObject, eventdata, handles)
% hObject    handle to menu555 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close 
gui2;
% Hint: get(hObject,'Value') returns toggle state of menu555
