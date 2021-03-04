function varargout = part1_2(varargin)
% PART1_2 MATLAB code for part1_2.fig
%      PART1_2, by itself, creates a new PART1_2 or raises the existing
%      singleton*.
%
%      H = PART1_2 returns the handle to a new PART1_2 or the handle to
%      the existing singleton*.
%
%      PART1_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART1_2.M with the given input arguments.
%
%      PART1_2('Property','Value',...) creates a new PART1_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part1_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part1_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part1_2

% Last Modified by GUIDE v2.5 05-Apr-2020 16:59:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part1_2_OpeningFcn, ...
                   'gui_OutputFcn',  @part1_2_OutputFcn, ...
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


% --- Executes just before part1_2 is made visible.
function part1_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has home output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part1_2 (see VARARGIN)

bbb=axes('units','normalized','pos',[0 0 1 1]);
axis off
aaa=imread('morning.jpg');
image(aaa);
set(bbb,'visible','off');
movegui(handles.figure1,'center');

coop='Yahoo!I am free!';
text('string',coop,'fontsize',14,'position',[40 350],'color','b');

dangerous='It is still dangerous!';
text('string',dangerous,'fontsize',14,'position',[510 350],'color','b');

% Choose default command line output for part1_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part1_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part1_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in GO.
function GO_Callback(hObject, eventdata, handles)
% hObject    handle to GO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'upscore',1);
setappdata(0,'downscore',2);
setappdata(0,'words1','1.Remember to wear mask before going out');
close all
part1_path1;
% Hint: get(hObject,'Value') returns toggle state of GO


% --- Executes on button press in home.
function home_Callback(hObject, eventdata, handles)
% hObject    handle to home (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'upscore',2);
setappdata(0,'downscore',2);
setappdata(0,'words1','1.It is the safest to stay at home, Good!');
close all
close all
part1_path2;
% Hint: get(hObject,'Value') returns toggle state of home
