function varargout = part1_public(varargin)
% PART1_PUBLIC MATLAB code for part1_public.fig
%      PART1_PUBLIC, by itself, creates a new PART1_PUBLIC or raises the existing
%      singleton*.
%
%      H = PART1_PUBLIC returns the handle to a new PART1_PUBLIC or the handle to
%      the existing singleton*.
%
%      PART1_PUBLIC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART1_PUBLIC.M with the given input arguments.
%
%      PART1_PUBLIC('Property','Value',...) creates a new PART1_PUBLIC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part1_public_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part1_public_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part1_public

% Last Modified by GUIDE v2.5 05-Apr-2020 11:03:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part1_public_OpeningFcn, ...
                   'gui_OutputFcn',  @part1_public_OutputFcn, ...
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


% --- Executes just before part1_public is made visible.
function part1_public_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part1_public (see VARARGIN)
bbb=axes('units','normalized','pos',[0 0 1 1]);
axis off
aaa=imread('underway.jpg');
image(aaa);
set(bbb,'visible','off');
movegui(handles.figure1,'center');

well='a little while is all right';
text('string',well,'fontsize',14,'position',[430 200],'color','w');

mask='there are so many people';
text('string',mask,'fontsize',14,'position',[430 340],'color','w');

% Choose default command line output for part1_public
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part1_public wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part1_public_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in takeoff.
function takeoff_Callback(hObject, eventdata, handles)
% hObject    handle to takeoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'upscore',getappdata(0,'upscore')+0);
setappdata(0,'downscore',getappdata(0,'downscore')+2);
setappdata(0,'words3','3.Never take off your mask outside!!!');
close all
part1_court;
% Hint: get(hObject,'Value') returns toggle state of takeoff


% --- Executes on button press in remainon.
function remainon_Callback(hObject, eventdata, handles)
% hObject    handle to remainon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setappdata(0,'upscore',getappdata(0,'upscore')+2);
setappdata(0,'downscore',getappdata(0,'downscore')+2);
setappdata(0,'words3','3.You did not take off your mask outside, Good!');
close all
part1_court;
% Hint: get(hObject,'Value') returns toggle state of remainon
