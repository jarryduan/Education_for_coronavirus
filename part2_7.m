function varargout = part2_7(varargin)
% PART2_7 MATLAB code for part2_7.fig
%      PART2_7, by itself, creates a new PART2_7 or raises the existing
%      singleton*.
%
%      H = PART2_7 returns the handle to a new PART2_7 or the handle to
%      the existing singleton*.
%
%      PART2_7('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART2_7.M with the given input arguments.
%
%      PART2_7('Property','Value',...) creates a new PART2_7 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part2_7_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part2_7_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part2_7

% Last Modified by GUIDE v2.5 12-Apr-2020 11:18:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part2_7_OpeningFcn, ...
                   'gui_OutputFcn',  @part2_7_OutputFcn, ...
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


% --- Executes just before part2_7 is made visible.
function part2_7_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part2_7 (see VARARGIN)
bbb=axes('units','normalized','pos',[0 0 1 1]);
axis off
aaa=imread('data3.jpg');
image(aaa);
set(bbb,'visible','off');
movegui(handles.figure1,'center');

healthy='Susceptible Group';
infected='Infective Group';
removed='Removed Group';
text('string',healthy,'fontsize',13,'position',[40 250],'color','g');
text('string',infected,'fontsize',13,'position',[190 250],'color','r');
text('string',removed,'fontsize',13,'position',[330 250],'color','c');

model='SIR model';
in='In SIS model those who has been cured can still be infected.';
but='But as for 2019-nCoV, peaople get immunity once been cured,';
which='which means they have been removed from the system, So:';
text('string',model,'fontsize',35,'position',[30 35],'color','w');
text('string',in,'fontsize',14,'position',[30 65],'color','w');
text('string',but,'fontsize',14,'position',[30 85],'color','w');
text('string',which,'fontsize',14,'position',[30 105],'color','w');

three='There are three kind of people';
kind='Susceptible  &  Infective & removed';
text('string',three,'fontsize',17,'position',[120 125],'color','c');
text('string',kind,'fontsize',17,'position',[100 145],'color','c');

set(handles.cure777,'Visible','off');

axes(handles.pix777);
h=rectangle('Position',[0,0,2.5,2.5],'FaceColor',[0 1 0]);
axis off

% Choose default command line output for part2_7
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part2_7 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part2_7_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in next777.
function next777_Callback(hObject, eventdata, handles)
% hObject    handle to next777 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
part2_8;
% Hint: get(hObject,'Value') returns toggle state of next777


% --- Executes on button press in infect777.
function infect777_Callback(hObject, eventdata, handles)
% hObject    handle to infect777 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.pix777);
h=rectangle('Position',[0,0,2.5,2.5],'FaceColor',[1 0 0]);
pause(0.5);
pos1=get(handles.pix777,'Position');
pos=get(handles.pix777,'Position');
while (pos(1)-pos1(1))<28
    set(handles.pix777,'Position',[pos(1)+0.5,pos(2),pos(3),pos(4)]);
    pos=get(handles.pix777,'Position');
    pause(0.02); 
end
set(handles.infect777,'Visible','off');
set(handles.cure777,'Visible','on');
% Hint: get(hObject,'Value') returns toggle state of infect777


% --- Executes on button press in cure777.
function cure777_Callback(hObject, eventdata, handles)
% hObject    handle to cure777 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.pix777);
h=rectangle('Position',[0,0,2.5,2.5],'FaceColor',[0 0 1]);
pause(0.5);
pos1=get(handles.pix777,'Position');
pos=get(handles.pix777,'Position');
while (pos(1)-pos1(1))<26
    set(handles.pix777,'Position',[pos(1)+0.5,pos(2),pos(3),pos(4)]);
    pos=get(handles.pix777,'Position');
    pause(0.02); 
end
set(handles.cure777,'Visible','off');
% Hint: get(hObject,'Value') returns toggle state of cure777
