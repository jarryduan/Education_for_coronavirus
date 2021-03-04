function varargout = movie1(varargin)
% MOVIE1 MATLAB code for movie1.fig
%      MOVIE1, by itself, creates a new MOVIE1 or raises the existing
%      singleton*.
%
%      H = MOVIE1 returns the handle to a new MOVIE1 or the handle to
%      the existing singleton*.
%
%      MOVIE1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOVIE1.M with the given input arguments.
%
%      MOVIE1('Property','Value',...) creates a new MOVIE1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before movie1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to movie1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help movie1

% Last Modified by GUIDE v2.5 12-Apr-2020 22:04:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @movie1_OpeningFcn, ...
                   'gui_OutputFcn',  @movie1_OutputFcn, ...
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


% --- Executes just before movie1 is made visible.
function movie1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to movie1 (see VARARGIN)

% Choose default command line output for movie1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes movie1 wait for user response (see UIRESUME)
% uiwait(handles.movie1);
handle1 = implay('movie1.mp4');
handle1.Parent.Position = [20 50 1500 700];
set(0,'showHiddenHandles','on')
[y , Fs] = audioread('movie1.mp4');
sound(y,Fs);play(handle1.DataSource.Controls);
fig_handle = gcf ;  
fig_handle.findobj 
ftw = fig_handle.findobj ('TooltipString', 'Maintain fit to window'); 
ftw.ClickedCallback()  


% --- Outputs from this function are returned to the command line.
function varargout = movie1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
check = get(handles.pushbutton1,'Value');
if check == 1
    UIControl_FontSize_bak = get(0, 'DefaultUIControlFontSize');
    set(0, 'DefaultUIControlFontSize', 16);
    error = menu(' you don''t wanna watch it ? ',' yes ',' no ');
    set(0, 'DefaultUIControlFontSize', UIControl_FontSize_bak);
end
if error == 1
delete(findall(0))
clear sound
run('Introduction.m')
end
