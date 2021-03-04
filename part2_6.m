function varargout = part2_6(varargin)
% PART2_6 MATLAB code for part2_6.fig
%      PART2_6, by itself, creates a new PART2_6 or raises the existing
%      singleton*.
%
%      H = PART2_6 returns the handle to a new PART2_6 or the handle to
%      the existing singleton*.
%
%      PART2_6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART2_6.M with the given input arguments.
%
%      PART2_6('Property','Value',...) creates a new PART2_6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part2_6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part2_6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part2_6

% Last Modified by GUIDE v2.5 11-Apr-2020 19:48:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part2_6_OpeningFcn, ...
                   'gui_OutputFcn',  @part2_6_OutputFcn, ...
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


% --- Executes just before part2_6 is made visible.
function part2_6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part2_6 (see VARARGIN)
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
acc='accessibility \lambda';
cur='cure rate \nu';
ini='initial infective i(0)';
text('string',denote,'fontsize',13,'position',[430 20],'color','c');
text('string',acc,'fontsize',13,'position',[385 50],'color','c');
text('string',cur,'fontsize',13,'position',[385 80],'color','c');
text('string',ini,'fontsize',13,'position',[385 110],'color','c');

lam=get(handles.lambda, 'Value');
miu=get(handles.miu, 'Value');
a=get(handles.slider3,'Value');
N=1700;
t=linspace(1,100,1000);
axes(handles.it);
i=N*(1-miu/lam)./((1-miu/lam-a)/a*exp((miu-lam)*t)+1);
plot(t,i);
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
didt=N*(miu/lam-1)./((1-miu/lam-a)/a*exp((miu-lam)*t)+1).^2*((1-miu/lam-a)/a*(miu-lam)).*exp((miu-lam)*t);
plot(t,didt);
set(gca,'xcolor','w');
set(gca,'ycolor','w');
set(gca,'YLim',[0 500]);
grid on
xlabel('time(day)');
ylabel('number of everyday increase');



% Choose default command line output for part2_6
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part2_6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part2_6_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function lambda_Callback(hObject, eventdata, handles)
% hObject    handle to lambda (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
lam=get(handles.lambda, 'Value');
miu=get(handles.miu, 'Value');
a=get(handles.slider3,'Value');
N=1700;
t=linspace(1,100,1000);
axes(handles.it);
cla;
i=N*(1-miu/lam)./((1-miu/lam-a)/a*exp((miu-lam)*t)+1);
plot(t,i);
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
didt=N*(miu/lam-1)./((1-miu/lam-a)/a*exp((miu-lam)*t)+1).^2*((1-miu/lam-a)/a*(miu-lam)).*exp((miu-lam)*t);
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
function lambda_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lambda (see GCBO)
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
lam=get(handles.lambda, 'Value');
miu=get(handles.miu, 'Value');
a=get(handles.slider3,'Value');
N=1700;
t=linspace(1,100,1000);
axes(handles.it);
cla;
i=N*(1-miu/lam)./((1-miu/lam-a)/a*exp((miu-lam)*t)+1);
plot(t,i);
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
didt=N*(miu/lam-1)./((1-miu/lam-a)/a*exp((miu-lam)*t)+1).^2*((1-miu/lam-a)/a*(miu-lam)).*exp((miu-lam)*t);
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
lam=get(handles.lambda, 'Value');
miu=get(handles.miu, 'Value');
a=get(handles.slider3,'Value');
N=1700;
t=linspace(1,100,1000);
axes(handles.it);
cla;
i=N*(1-miu/lam)./((1-miu/lam-a)/a*exp((miu-lam)*t)+1);
plot(t,i);
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
didt=N*(miu/lam-1)./((1-miu/lam-a)/a*exp((miu-lam)*t)+1).^2*((1-miu/lam-a)/a*(miu-lam)).*exp((miu-lam)*t);
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
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in next666.
function next666_Callback(hObject, eventdata, handles)
% hObject    handle to next666 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
part2_7;
% Hint: get(hObject,'Value') returns toggle state of next666
