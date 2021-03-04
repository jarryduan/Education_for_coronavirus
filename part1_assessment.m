function varargout = part1_assessment(varargin)
% PART1_ASSESSMENT MATLAB code for part1_assessment.fig
%      PART1_ASSESSMENT, by itself, creates a new PART1_ASSESSMENT or raises the existing
%      singleton*.
%
%      H = PART1_ASSESSMENT returns the handle to a new PART1_ASSESSMENT or the handle to
%      the existing singleton*.
%
%      PART1_ASSESSMENT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PART1_ASSESSMENT.M with the given input arguments.
%
%      PART1_ASSESSMENT('Property','Value',...) creates a new PART1_ASSESSMENT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before part1_assessment_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to part1_assessment_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help part1_assessment

% Last Modified by GUIDE v2.5 08-Apr-2020 21:18:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @part1_assessment_OpeningFcn, ...
                   'gui_OutputFcn',  @part1_assessment_OutputFcn, ...
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


% --- Executes just before part1_assessment is made visible.
function part1_assessment_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to part1_assessment (see VARARGIN)
bbb=axes('units','normalized','pos',[0 0 1 1]);
axis off;
aaa=imread('end.jpg');
image(aaa);
set(bbb,'visible','off');
movegui(handles.figure1,'center');

you='Your virus resistance ability is       %';
text('string',you,'fontsize',25,'position',[70 40]);

score=getappdata(0,'upscore')/getappdata(0,'downscore')*100;
text('string',floor(score),'fontsize',25,'position',[850 40]);
text('string','Assessment & tips:','fontsize',15,'position',[75 100],'color','b');

text('string',getappdata(0,'words1'),'fontsize',16,'position',[70 150],'color','m');
text('string',getappdata(0,'words2'),'fontsize',16,'position',[70 220],'color','m');
text('string',getappdata(0,'words3'),'fontsize',16,'position',[70 290],'color','m');
text('string',getappdata(0,'words4'),'fontsize',16,'position',[70 360],'color','m');
text('string',getappdata(0,'words5'),'fontsize',16,'position',[70 430],'color','m');
text('string',getappdata(0,'words6'),'fontsize',16,'position',[70 500],'color','m');



% Choose default command line output for part1_assessment
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes part1_assessment wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = part1_assessment_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in playagain.
function playagain_Callback(hObject, eventdata, handles)
% hObject    handle to playagain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
part1_2;
% Hint: get(hObject,'Value') returns toggle state of playagain


% --- Executes on button press in backmenu111.
function backmenu111_Callback(hObject, eventdata, handles)
% hObject    handle to backmenu111 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all
gui2;
% Hint: get(hObject,'Value') returns toggle state of backmenu111
