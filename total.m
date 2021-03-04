function varargout = total(varargin)
% TOTAL MATLAB code for total.fig
%      TOTAL, by itself, creates a new TOTAL or raises the existing
%      singleton*.
%
%      H = TOTAL returns the handle to a new TOTAL or the handle to
%      the existing singleton*.
%
%      TOTAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TOTAL.M with the given input arguments.
%
%      TOTAL('Property','Value',...) creates a new TOTAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before total_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to total_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help total

% Last Modified by GUIDE v2.5 12-Apr-2020 23:27:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @total_OpeningFcn, ...
                   'gui_OutputFcn',  @total_OutputFcn, ...
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


% --- Executes just before total is made visible.
function total_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to total (see VARARGIN)

% Choose default command line output for total

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes total wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = total_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output = hObject;
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in totalpop.
function totalpop_Callback(hObject, eventdata, handles)
% hObject    handle to totalpop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns totalpop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from totalpop


% --- Executes during object creation, after setting all properties.
function totalpop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to totalpop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.


ha=axes('units','normalized','pos',[0 0 1 1]);
uistack(ha,'bottom');
ii=imread('total.jpg');
image(ii);
colormap gray
set(ha,'handlevisibility','off','visible','off');

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choose=get(handles.totalpop,'value');
switch choose
    case 1
        close(total);run('Chinese.m');
    case 2
        close(total);run('Western.m');
    case 3
        close(total);run('AF.m');
    case 4
        close(total);run('calcu.m');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
run('page2.m')
