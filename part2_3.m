function varargout = part2_3(varargin)
% PART2_3 MATLAB code for part2_3.fig
%      PART2_3, by itself, creates a new PART2_3 or raises the existing
%      singleton*.
%
%      H = PART2_3 returns the handle to a new PART2_3 or the handle to
%      the existing singleton*.
%
%      PART2_3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART2_3.M with the given input arguments.
%
%      PART2_3('Property','Value',...) creates a new PART2_3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part2_3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part2_3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part2_3

% Last Modified by GUIDE v2.5 10-Apr-2020 22:56:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part2_3_OpeningFcn, ...
                   'gui_OutputFcn',  @part2_3_OutputFcn, ...
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


% --- Executes just before part2_3 is made visible.
function part2_3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part2_3 (see VARARGIN)
bbb=axes('units','normalized','pos',[0 0 1 1]);
axis off
aaa=imread('data2.jpg');
image(aaa);
set(bbb,'visible','off');
movegui(handles.figure1,'center');

healthy='Susceptible Group';
infected='Infective Group';
text('string',healthy,'fontsize',14,'position',[110 230],'color','g');
text('string',infected,'fontsize',14,'position',[345 230],'color','r');

model='SI model';
first='Let us start with the simplest scenario:';
two='There are only two kind of people';
si='Susceptible  &  Infective';
text('string',model,'fontsize',35,'position',[30 35],'color','white');
text('string',first,'fontsize',20,'position',[30 70],'color','white');
text('string',two,'fontsize',17,'position',[100 100],'color','c');
text('string',si,'fontsize',17,'position',[150 125],'color','c');

axes(handles.pix333);
h=rectangle('Position',[0,0,2.5,2.5],'FaceColor',[0 1 0]);
axis off

% Choose default command line output for part2_3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part2_3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part2_3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in next333.
function next333_Callback(hObject, eventdata, handles)
% hObject    handle to next333 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
part2_4;
% Hint: get(hObject,'Value') returns toggle state of next333


% --- Executes on button press in infect333.
function infect333_Callback(hObject, eventdata, handles)
% hObject    handle to infect333 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.pix333);
h=rectangle('Position',[0,0,2.5,2.5],'FaceColor',[1 0 0]);
pause(0.5);
pos1=get(handles.pix333,'Position');
pos=get(handles.pix333,'Position');
while (pos(1)-pos1(1))<45
    set(handles.pix333,'Position',[pos(1)+0.5,pos(2),pos(3),pos(4)]);
    pos=get(handles.pix333,'Position');
    pause(0.01); 
end

% Hint: get(hObject,'Value') returns toggle state of infect333
