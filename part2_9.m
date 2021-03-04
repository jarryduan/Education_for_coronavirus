function varargout = part2_9(varargin)
% PART2_9 MATLAB code for part2_9.fig
%      PART2_9, by itself, creates a new PART2_9 or raises the existing
%      singleton*.
%
%      H = PART2_9 returns the handle to a new PART2_9 or the handle to
%      the existing singleton*.
%
%      PART2_9('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART2_9.M with the given input arguments.
%
%      PART2_9('Property','Value',...) creates a new PART2_9 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part2_9_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part2_9_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part2_9

% Last Modified by GUIDE v2.5 12-Apr-2020 13:26:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part2_9_OpeningFcn, ...
                   'gui_OutputFcn',  @part2_9_OutputFcn, ...
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


% --- Executes just before part2_9 is made visible.
function part2_9_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part2_9 (see VARARGIN)
bbb=axes('units','normalized','pos',[0 0 1 1]);
axis off
aaa=imread('data.jpg');
image(aaa);
set(bbb,'visible','off');
movegui(handles.figure1,'center');

during='During the procedure we optimize our model:';
model='SI -> SIS -> SIR';
when='While we keep taking more situstions into account';
more='our model becomes more complex also closer to the reality';
text('string',during,'fontsize',20,'position',[40 20],'color','w');
text('string',model,'fontsize',25,'position',[170 48],'color','c');
text('string',when,'fontsize',16,'position',[30 75],'color','g');
text('string',more,'fontsize',16,'position',[30 95],'color','g');

our='Our discover during the journey:';
imp='Those three important factors affect the spread of virus';
offer='offer us three golden prevention & control measures';
acc='accessibility \lambda ->';
cur='cure rate \nu ->';
ini='initial infective i(0) ->';
text('string',our,'fontsize',20,'position',[40 120],'color','w');
text('string',imp,'fontsize',16,'position',[30 140],'color','g');
text('string',offer,'fontsize',16,'position',[30 160],'color','g');
text('string',acc,'fontsize',17,'position',[30 185],'color','c');
text('string',cur,'fontsize',17,'position',[30 210],'color','c');
text('string',ini,'fontsize',17,'position',[30 235],'color','c');

obey='obey strict quarantine';
inc='increase medical force';
start='start preparation without delay';
text('string',obey,'fontsize',17,'position',[200 185],'color','w');
text('string',inc,'fontsize',17,'position',[170 210],'color','w');
text('string',start,'fontsize',17,'position',[240 235],'color','w');


% Choose default command line output for part2_9
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part2_9 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part2_9_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in menu999.
function menu999_Callback(hObject, eventdata, handles)
% hObject    handle to menu999 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
gui2;
% Hint: get(hObject,'Value') returns toggle state of menu999
