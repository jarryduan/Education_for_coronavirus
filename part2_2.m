function varargout = part2_2(varargin)
% PART2_2 MATLAB code for part2_2.fig
%      PART2_2, by itself, creates a new PART2_2 or raises the existing
%      singleton*.
%
%      H = PART2_2 returns the handle to a new PART2_2 or the handle to
%      the existing singleton*.
%
%      PART2_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART2_2.M with the given input arguments.
%
%      PART2_2('Property','Value',...) creates a new PART2_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part2_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part2_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part2_2

% Last Modified by GUIDE v2.5 10-Apr-2020 15:20:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part2_2_OpeningFcn, ...
                   'gui_OutputFcn',  @part2_2_OutputFcn, ...
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


% --- Executes just before part2_2 is made visible.
function part2_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part2_2 (see VARARGIN)

bbb=axes('units','normalized','pos',[0 0 1 1]);
axis off
aaa=imread('data.jpg');
image(aaa);
set(bbb,'visible','off');
movegui(handles.figure1,'center');
movegui(handles.figure1,'center');

you='Instead of just let the virus spread';
we='we can predict the outcome of different scenarios';
and='and eventually take the';
best='BEST ACTION';
text('string',you,'fontsize',17,'position',[130 60],'color','white');
text('string',we,'fontsize',17,'position',[60 85],'color','white');
text('string',and,'fontsize',17,'position',[60 110],'color','white');
text('string',best,'fontsize',28,'position',[300 110],'color','c');

you='You will witness how';
build='A                                                       is build';
modle='successful MODLE';
step='step by step';
text('string',you,'fontsize',17,'position',[175 160],'color','white');
text('string',build,'fontsize',17,'position',[90 185],'color','white');
text('string',modle,'fontsize',28,'position',[120 185],'color','c');
text('string',step,'fontsize',17,'position',[220 210],'color','white');


axes(handles.sigmma);
N=10000;
Tau0=1;
for i=1:100
    Tau=Tau0/i; 
    TimeRange=linspace(-10*Tau,10*Tau,N);
    FreqRange=linspace(-200*pi/i,200*pi/i,N);
    Half_Tau=Tau/2;
    RECT=1/Tau*double(abs(TimeRange)<Half_Tau);
    SINC=sinc(FreqRange*Tau*pi);
    
    plot(FreqRange,SINC,'w','LineWidth',3);
    xlim([-200*pi/i 200*pi/i]);
    ylim([-0.5 1.5]); 
    axis off
    drawnow;
end

% Choose default command line output for part2_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part2_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part2_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in next2_2.
function next2_2_Callback(hObject, eventdata, handles)
% hObject    handle to next2_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
part2_3;
% Hint: get(hObject,'Value') returns toggle state of next2_2
