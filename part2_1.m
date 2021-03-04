function varargout = part2_1(varargin)
% PART2_1 MATLAB code for part2_1.fig
%      PART2_1, by itself, creates a new PART2_1 or raises the existing
%      singleton*.
%
%      H = PART2_1 returns the handle to a new PART2_1 or the handle to
%      the existing singleton*.
%
%      PART2_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART2_1.M with the given input arguments.
%
%      PART2_1('Property','Value',...) creates a new PART2_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part2_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part2_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part2_1

% Last Modified by GUIDE v2.5 07-Apr-2020 22:32:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part2_1_OpeningFcn, ...
                   'gui_OutputFcn',  @part2_1_OutputFcn, ...
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


% --- Executes just before part2_1 is made visible.
function part2_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part2_1 (see VARARGIN)
bbb=axes('units','normalized','pos',[0 0 1 1]);
axis off
aaa=imread('data.jpg');
image(aaa);
set(bbb,'visible','off');
movegui(handles.figure1,'center');

in='in this part you will see';
how='how virus spread through diagrams';
text('string',in,'fontsize',20,'position',[150 60],'color','white');
text('string',how,'fontsize',25,'position',[50 100],'color','white');
% Choose default command line output for part2_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part2_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part2_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in START222.
function START222_Callback(hObject, eventdata, handles)
% hObject    handle to START222 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
part2_2;
% Hint: get(hObject,'Value') returns toggle state of START222


% --- Executes on button press in BACK222.
function BACK222_Callback(hObject, eventdata, handles)
% hObject    handle to BACK222 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
gui2;
% Hint: get(hObject,'Value') returns toggle state of BACK222
