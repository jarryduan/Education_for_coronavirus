function varargout = part2_4(varargin)
% PART2_4 MATLAB code for part2_4.fig
%      PART2_4, by itself, creates a new PART2_4 or raises the existing
%      singleton*.
%
%      H = PART2_4 returns the handle to a new PART2_4 or the handle to
%      the existing singleton*.
%
%      PART2_4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART2_4.M with the given input arguments.
%
%      PART2_4('Property','Value',...) creates a new PART2_4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part2_4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part2_4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part2_4

% Last Modified by GUIDE v2.5 11-Apr-2020 10:24:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part2_4_OpeningFcn, ...
                   'gui_OutputFcn',  @part2_4_OutputFcn, ...
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


% --- Executes just before part2_4 is made visible.
function part2_4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part2_4 (see VARARGIN)
bbb=axes('units','normalized','pos',[0 0 1 1]);
axis off
aaa=imread('data.jpg');
image(aaa);
set(bbb,'visible','off');
movegui(handles.figure1,'center');

accessibility='accessibility \lambda';
overallnum='overall number N';
text('string',accessibility,'fontsize',15,'position',[380 175],'color','white');
text('string',overallnum,'fontsize',15,'position',[375 220],'color','white');

sus='number of susceptible s(t)';
inf='number of infective i(t)';
denote='Denote that:';
acc='accessibility of infective \lambda';
ove='overall number of system N';
text('string',denote,'fontsize',13,'position',[410 20],'color','c');
text('string',sus,'fontsize',13,'position',[355 50],'color','c');
text('string',inf,'fontsize',13,'position',[355 80],'color','c');
text('string',acc,'fontsize',13,'position',[355 110],'color','c');
text('string',ove,'fontsize',13,'position',[355 140],'color','c');

N=get(handles.overall, 'Value');
lambda=get(handles.accessibility, 'Value');
t=linspace(1,100,1000);
axes(handles.it);
inf=N./(1+999*exp(-lambda*t));
plot(t,inf);
set(gca,'xcolor','w');
set(gca,'ycolor','w');
set(gca,'YLim',[0 2e3]);
grid on
xlabel('time(day)');
ylabel('number of infective i(t)');
hold on
plot([0,100],[N,N],'g','linewidth',1.5);
legend('number of infective','overall number','location','southeast');

axes(handles.didti);
didt=(999*N*lambda*exp(-lambda*t))./(1+999*exp(-lambda*t)).^2;
plot(t,didt);
set(gca,'xcolor','w');
set(gca,'ycolor','w');
set(gca,'YLim',[0 500]);
grid on
xlabel('time(day)');
ylabel('number of everyday increase');



% Choose default command line output for part2_4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part2_4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part2_4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function accessibility_Callback(hObject, eventdata, handles)
% hObject    handle to accessibility (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
N=get(handles.overall, 'Value');
lambda=get(handles.accessibility, 'Value');
t=linspace(1,100,1000);
axes(handles.it);
cla;
inf=N./(1+999*exp(-lambda*t));
plot(t,inf);
set(gca,'xcolor','w');
set(gca,'ycolor','w');
set(gca,'YLim',[0 2e3]);
xlabel('time(day)');
ylabel('number of infective i(t)');
hold on
plot([0,100],[N,N],'g','linewidth',1.5);
legend('number of infective','overall number','location','southeast');

axes(handles.didti);
didt=(999*N*lambda*exp(-lambda*t))./(1+999*exp(-lambda*t)).^2;
plot(t,didt);
set(gca,'xcolor','w');
set(gca,'ycolor','w');
set(gca,'YLim',[0 500]);
grid on
xlabel('time(day)');
ylabel('number of everyday increase');

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function accessibility_CreateFcn(hObject, eventdata, handles)
% hObject    handle to accessibility (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function overall_Callback(hObject, eventdata, handles)
% hObject    handle to overall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
N=get(handles.overall, 'Value');
lambda=get(handles.accessibility, 'Value');
t=linspace(1,100,1000);
axes(handles.it);
cla;
inf=N./(1+999*exp(-lambda*t));
plot(t,inf);
set(gca,'xcolor','w');
set(gca,'ycolor','w');
set(gca,'YLim',[0 2e3]);
xlabel('time(day)');
ylabel('number of infective i(t)');
hold on
plot([0,100],[N,N],'g','linewidth',1.5);
legend('number of infective','overall number','location','southeast');

axes(handles.didti);
didt=(999*N*lambda*exp(-lambda*t))./(1+999*exp(-lambda*t)).^2;
plot(t,didt);
set(gca,'xcolor','w');
set(gca,'ycolor','w');
set(gca,'YLim',[0 500]);
grid on
xlabel('time(day)');
ylabel('number of everyday increase');

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function overall_CreateFcn(hObject, eventdata, handles)
% hObject    handle to overall (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in next444.
function next444_Callback(hObject, eventdata, handles)
% hObject    handle to next444 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
part2_5;
% Hint: get(hObject,'Value') returns toggle state of next444
