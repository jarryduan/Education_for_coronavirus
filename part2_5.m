function varargout = part2_5(varargin)
% PART2_5 MATLAB code for part2_5.fig
%      PART2_5, by itself, creates a new PART2_5 or raises the existing
%      singleton*.
%
%      H = PART2_5 returns the handle to a new PART2_5 or the handle to
%      the existing singleton*.
%
%      PART2_5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART2_5.M with the given input arguments.
%
%      PART2_5('Property','Value',...) creates a new PART2_5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part2_5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part2_5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part2_5

% Last Modified by GUIDE v2.5 11-Apr-2020 11:59:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part2_5_OpeningFcn, ...
                   'gui_OutputFcn',  @part2_5_OutputFcn, ...
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


% --- Executes just before part2_5 is made visible.
function part2_5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part2_5 (see VARARGIN)
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

model='SIS model';
it='It is obvious wrong in SI model that not every one will be infected';
leave='It leaves out the mose important part:               (still can be infected)';
cure='CURE';
text('string',model,'fontsize',35,'position',[30 35],'color','white');
text('string',it,'fontsize',14,'position',[30 65],'color','white');
text('string',leave,'fontsize',14,'position',[30 85],'color','w');
text('string',cure,'fontsize',20,'position',[320 85],'color','c');

two='There still are only two kind of people';
si='Susceptible  &  Infective';
text('string',two,'fontsize',17,'position',[100 110],'color','c');
text('string',si,'fontsize',17,'position',[150 135],'color','c');

set(handles.cure555,'Visible','off');

axes(handles.pix555);
h=rectangle('Position',[0,0,2.5,2.5],'FaceColor',[0 1 0]);
axis off


% Choose default command line output for part2_5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part2_5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part2_5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in infect555.
function infect555_Callback(hObject, eventdata, handles)
% hObject    handle to infect555 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.pix555);
h=rectangle('Position',[0,0,2.5,2.5],'FaceColor',[1 0 0]);
pause(0.5);
pos1=get(handles.pix555,'Position');
pos=get(handles.pix555,'Position');
while (pos(1)-pos1(1))<45
    set(handles.pix555,'Position',[pos(1)+0.5,pos(2),pos(3),pos(4)]);
    pos=get(handles.pix555,'Position');
    pause(0.01); 
end
set(handles.infect555,'Visible','off');
set(handles.cure555,'Visible','on');

% Hint: get(hObject,'Value') returns toggle state of infect555


% --- Executes on button press in cure555.
function cure555_Callback(hObject, eventdata, handles)
% hObject    handle to cure555 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.pix555);
h=rectangle('Position',[0,0,2.5,2.5],'FaceColor',[0 1 0]);
pause(0.5);
pos1=get(handles.pix555,'Position');
pos=get(handles.pix555,'Position');
while abs(pos(1)-pos1(1))<45
    set(handles.pix555,'Position',[pos(1)-0.5,pos(2),pos(3),pos(4)]);
    pos=get(handles.pix555,'Position');
    pause(0.01); 
end
set(handles.cure555,'Visible','off');
set(handles.infect555,'Visible','on');
% Hint: get(hObject,'Value') returns toggle state of cure555


% --- Executes on button press in next555.
function next555_Callback(hObject, eventdata, handles)
% hObject    handle to next555 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
part2_6;
% Hint: get(hObject,'Value') returns toggle state of next555
