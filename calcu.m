function varargout = calcu(varargin)
% CALCU MATLAB code for calcu.fig
%      CALCU, by itself, creates a new CALCU or raises the existing
%      singleton*.
%
%      H = CALCU returns the handle to a new CALCU or the handle to
%      the existing singleton*.
%
%      CALCU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CALCU.M with the given input arguments.
%
%      CALCU('Property','Value',...) creates a new CALCU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before calcu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to calcu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help calcu

% Last Modified by GUIDE v2.5 12-Apr-2020 10:23:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @calcu_OpeningFcn, ...
                   'gui_OutputFcn',  @calcu_OutputFcn, ...
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


% --- Executes just before calcu is made visible.
function calcu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to calcu (see VARARGIN)

% Choose default command line output for calcu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes calcu wait for user response (see UIRESUME)
% uiwait(handles.back);


% --- Outputs from this function are returned to the command line.
function varargout = calcu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function shuru_Callback(hObject, eventdata, handles)
% hObject    handle to shuru (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
in=get(handles.shuru,'String');
if isletter(in)
   set(handles.shuru,'String','');
end
% Hints: get(hObject,'String') returns contents of shuru as text
%        str2double(get(hObject,'String')) returns contents of shuru as a double


% --- Executes during object creation, after setting all properties.
function shuru_CreateFcn(hObject, eventdata, handles)
% hObject    handle to shuru (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in cho.
function cho_Callback(hObject, eventdata, handles)
% hObject    handle to cho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns cho contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cho


% --- Executes during object creation, after setting all properties.
function cho_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cho (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Calcu.
function Calcu_Callback(hObject, eventdata, handles)
% hObject    handle to Calcu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
in=get(handles.shuru,'String');
choo=get(handles.cho,'Value');
inn=str2num(in);
switch choo
    case 1
        inf=inn*2;
        for i=2:10
           inf=inf*1.7+inn;
        end
        dea=round(0.03*inf);
        inf=round(inf);
        if inf>1000000
            inf=1000000;
        end
        if dea>1000000
            dea=1000000;
        end
        set(handles.infe,'String',num2str(inf));
        set(handles.death,'String',num2str(dea));
    case 2
        inf=inn*1.6;
        for i=2:8
        inf=inf*1.6+inn;
        end
        dea=round(0.03*inf);
        inf=round(inf);
        if inf>1000000
            inf=1000000;
        end
        if dea>1000000
            dea=1000000;
        end
        set(handles.infe,'String',num2str(inf));
        set(handles.death,'String',num2str(dea));
    case 3
        inf=inn*1.3;
        for i=2:8
            inf=inf*1.3+inn;
        end
        dea=round(0.03*inf);
        inf=round(inf);
        if inf>1000000
            inf=1000000;
        end
        if dea>1000000
            dea=1000000;
        end
        set(handles.infe,'String',num2str(inf));
        set(handles.death,'String',num2str(dea));
    case 4
        inf=inn;
        for i=2:10
            inf=inf+inn;
        end
        dea=round(0.03*inf);
        inf=round(inf);
        if inf>1000000
            inf=1000000;
        end
        if dea>1000000
            dea=1000000;
        end
        set(handles.infe,'String',num2str(inf));
        set(handles.death,'String',num2str(dea));
end



function infe_Callback(hObject, eventdata, handles)
% hObject    handle to infe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of infe as text
%        str2double(get(hObject,'String')) returns contents of infe as a double


% --- Executes during object creation, after setting all properties.
function infe_CreateFcn(hObject, eventdata, handles)
% hObject    handle to infe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function death_Callback(hObject, eventdata, handles)
% hObject    handle to death (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of death as text
%        str2double(get(hObject,'String')) returns contents of death as a double


% --- Executes during object creation, after setting all properties.
function death_CreateFcn(hObject, eventdata, handles)
% hObject    handle to death (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(calcu);
run('total.m');

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(calcu);
run('Method.m');

% --- Executes during object creation, after setting all properties.

% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function back_CreateFcn(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
ha=axes('units','normalized','pos',[0 0 1 1]);
uistack(ha,'bottom');
ii=imread('total.jpg');
image(ii);
colormap gray
set(ha,'handlevisibility','off','visible','off');
