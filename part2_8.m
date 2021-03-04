function varargout = part2_8(varargin)
% PART2_8 MATLAB code for part2_8.fig
%      PART2_8, by itself, creates a new PART2_8 or raises the existing
%      singleton*.
%
%      H = PART2_8 returns the handle to a new PART2_8 or the handle to
%      the existing singleton*.
%
%      PART2_8('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART2_8.M with the given input arguments.
%
%      PART2_8('Property','Value',...) creates a new PART2_8 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part2_8_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part2_8_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part2_8

% Last Modified by GUIDE v2.5 12-Apr-2020 12:02:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part2_8_OpeningFcn, ...
                   'gui_OutputFcn',  @part2_8_OutputFcn, ...
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


% --- Executes just before part2_8 is made visible.
function part2_8_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part2_8 (see VARARGIN)
bbb=axes('units','normalized','pos',[0 0 1 1]);
axis off
aaa=imread('data.jpg');
image(aaa);
set(bbb,'visible','off');
movegui(handles.figure1,'center');

accessibility='accessibility \lambda';
curerate='cure rate \nu';
initial='initial infective i(0)';
text('string',accessibility,'fontsize',13,'position',[400 150],'color','white');
text('string',curerate,'fontsize',13,'position',[420 190],'color','white');
text('string',initial,'fontsize',13,'position',[390 225],'color','white');

denote='Denote that:';
sus='ratio of susceptible s(t)';
inf='ratio of infective i(t)';
acc='accessibility \lambda';
cur='cure rate \nu';
ini='initial infective i(0)';
text('string',denote,'fontsize',13,'position',[420 20],'color','c');
text('string',sus,'fontsize',13,'position',[395 40],'color','c');
text('string',inf,'fontsize',13,'position',[395 60],'color','c');
text('string',acc,'fontsize',13,'position',[395 80],'color','c');
text('string',cur,'fontsize',13,'position',[395 100],'color','c');
text('string',ini,'fontsize',13,'position',[395 120],'color','c');

lam=get(handles.lam, 'Value');
miu=get(handles.miu, 'Value');
a=get(handles.slider3,'Value');
b=1-a;
axes(handles.ist);
sir=@(t,x) [lam*x(2)*x(1)-miu*x(1);-lam*x(2)*x(1)];
[t,x]=ode45(sir,[0,30],[a,b]);
plot(t,x(:,1),'-',t,x(:,2),'-*');
legend('i(t)','s(t)');
xlabel('time(day)');
ylabel('ratio');
grid on
set(gca,'xcolor','w');
set(gca,'ycolor','w');
set(gca,'YLim',[0 1]);


axes(handles.is);
plot(x(:,2),x(:,1));
xlabel('s(t)');
ylabel('i(t)');
grid on
set(gca,'xcolor','w');
set(gca,'ycolor','w');
set(gca,'YLim',[0 1]);
legend('phase path');

% Choose default command line output for part2_8
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part2_8 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part2_8_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in next888.
function next888_Callback(hObject, eventdata, handles)
% hObject    handle to next888 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
part2_9;
% Hint: get(hObject,'Value') returns toggle state of next888


% --- Executes on slider movement.
function lam_Callback(hObject, eventdata, handles)
% hObject    handle to lam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
lam=get(handles.lam, 'Value');
miu=get(handles.miu, 'Value');
a=get(handles.slider3,'Value');
b=1-a;
axes(handles.ist);
sir=@(t,x) [lam*x(2)*x(1)-miu*x(1);-lam*x(2)*x(1)];
[t,x]=ode45(sir,[0,30],[a,b]);
plot(t,x(:,1),'-',t,x(:,2),'-*');
legend('i(t)','s(t)');
xlabel('time(day)');
ylabel('ratio');
grid on
set(gca,'xcolor','w');
set(gca,'ycolor','w');
set(gca,'YLim',[0 1]);


axes(handles.is);
plot(x(:,2),x(:,1));
xlabel('s(t)');
ylabel('i(t)');
grid on
set(gca,'xcolor','w');
set(gca,'ycolor','w');
set(gca,'YLim',[0 1]);
legend('phase path');
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function lam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function miu_Callback(hObject, eventdata, handles)
% hObject    handle to miu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
lam=get(handles.lam, 'Value');
miu=get(handles.miu, 'Value');
a=get(handles.slider3,'Value');
b=1-a;
axes(handles.ist);
sir=@(t,x) [lam*x(2)*x(1)-miu*x(1);-lam*x(2)*x(1)];
[t,x]=ode45(sir,[0,30],[a,b]);
plot(t,x(:,1),'-',t,x(:,2),'-*');
legend('i(t)','s(t)');
xlabel('time(day)');
ylabel('ratio');
grid on
set(gca,'xcolor','w');
set(gca,'ycolor','w');
set(gca,'YLim',[0 1]);


axes(handles.is);
plot(x(:,2),x(:,1));
xlabel('s(t)');
ylabel('i(t)');
grid on
set(gca,'xcolor','w');
set(gca,'ycolor','w');
set(gca,'YLim',[0 1]);
legend('phase path');
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function miu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to miu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
lam=get(handles.lam, 'Value');
miu=get(handles.miu, 'Value');
a=get(handles.slider3,'Value');
b=1-a;
axes(handles.ist);
sir=@(t,x) [lam*x(2)*x(1)-miu*x(1);-lam*x(2)*x(1)];
[t,x]=ode45(sir,[0,30],[a,b]);
plot(t,x(:,1),'-',t,x(:,2),'-*');
legend('i(t)','s(t)');
xlabel('time(day)');
ylabel('ratio');
grid on
set(gca,'xcolor','w');
set(gca,'ycolor','w');
set(gca,'YLim',[0 1]);


axes(handles.is);
plot(x(:,2),x(:,1));
xlabel('s(t)');
ylabel('i(t)');
grid on
set(gca,'xcolor','w');
set(gca,'ycolor','w');
set(gca,'YLim',[0 1]);
legend('phase path');
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
