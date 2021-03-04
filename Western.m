function varargout = Western(varargin)
% WESTERN MATLAB code for Western.fig
%      WESTERN, by itself, creates a new WESTERN or raises the existing
%      singleton*.
%
%      H = WESTERN returns the handle to a new WESTERN or the handle to
%      the existing singleton*.
%
%      WESTERN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WESTERN.M with the given input arguments.
%
%      WESTERN('Property','Value',...) creates a new WESTERN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Western_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Western_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Western

% Last Modified by GUIDE v2.5 12-Apr-2020 13:04:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Western_OpeningFcn, ...
                   'gui_OutputFcn',  @Western_OutputFcn, ...
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


% --- Executes just before Western is made visible.
function Western_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Western (see VARARGIN)

% Choose default command line output for Western
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Western wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Western_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
ha=axes('units','normalized','pos',[0 0 1 1]);
uistack(ha,'bottom');
ii=imread('total.jpg');
image(ii);
colormap gray
set(ha,'handlevisibility','off','visible','off');


% --- Executes during object creation, after setting all properties.
function mapW_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
imshow(imread('mapW.png'));
% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function graphW_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
imshow(imread('GraphW.png'));
% Hint: place code in OpeningFcn to populate axes2


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(Western);
run('Western2.m');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(Western);
run('total.m');


% --- Executes during object creation, after setting all properties.
function GraphC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to GraphC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
imshow(imread('GraphW.png'));
% Hint: place code in OpeningFcn to populate GraphC
