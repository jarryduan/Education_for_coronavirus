function varargout = COVID19(varargin)
% COVID19 MATLAB code for COVID19.fig
%      COVID19, by itself, creates a new COVID19 or raises the existing
%      singleton*.
%
%      H = COVID19 returns the handle to a new COVID19 or the handle to
%      the existing singleton*.
%
%      COVID19('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COVID19.M with the given input arguments.
%
%      COVID19('Property','Value',...) creates a new COVID19 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before COVID19_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to COVID19_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help COVID19

% Last Modified by GUIDE v2.5 12-Apr-2020 23:27:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @COVID19_OpeningFcn, ...
                   'gui_OutputFcn',  @COVID19_OutputFcn, ...
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


% --- Executes just before COVID19 is made visible.
function COVID19_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to COVID19 (see VARARGIN)

% Choose default command line output for COVID19
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes COVID19 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = COVID19_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Va = get(hObject,'Value');
if rem(Va,1)~=0
    set(hObject,'Value',round(Va))
end
d=["Dec 31, 2019";"Jan 1, 2020";"Jan 2, 2020";"Jan 3, 2020";"Jan 4, 2020";"Jan 5, 2020";"Jan 6, 2020";"Jan 7, 2020";"Jan 8, 2020";"Jan 9, 2020";"Jan 10, 2020";"Jan 11, 2020";"Jan 12, 2020";"Jan 13, 2020";"Jan 14, 2020";"Jan 15, 2020";"Jan 16, 2020";"Jan 17, 2020";"Jan 18, 2020";"Jan 19, 2020";"Jan 20, 2020";"Jan 21, 2020";"Jan 22, 2020";"Jan 23, 2020";"Jan 24, 2020";"Jan 25, 2020";"Jan 26, 2020";"Jan 27, 2020";"Jan 28, 2020";"Jan 29, 2020";"Jan 30, 2020";"Jan 31, 2020";"Feb 1, 2020";"Feb 2, 2020";"Feb 3, 2020";"Feb 4, 2020";"Feb 5, 2020";"Feb 6, 2020";"Feb 7, 2020";"Feb 8, 2020";"Feb 9, 2020";"Feb 10, 2020";"Feb 11, 2020";"Feb 12, 2020";"Feb 13, 2020";"Feb 14, 2020";"Feb 15, 2020";"Feb 16, 2020";"Feb 17, 2020";"Feb 18, 2020";"Feb 19, 2020";"Feb 20, 2020";"Feb 21, 2020";"Feb 22, 2020";"Feb 23, 2020";"Feb 24, 2020";"Feb 25, 2020";"Feb 26, 2020";"Feb 27, 2020";"Feb 28, 2020";"Feb 29, 2020";"Mar 1, 2020";"Mar 2, 2020";"Mar 3, 2020";"Mar 4, 2020";"Mar 5, 2020";"Mar 6, 2020";"Mar 7, 2020";"Mar 8, 2020";"Mar 9, 2020";"Mar 10, 2020";"Mar 11, 2020";"Mar 12, 2020";"Mar 13, 2020";"Mar 14, 2020";"Mar 15, 2020";"Mar 16, 2020";"Mar 17, 2020";"Mar 18, 2020";"Mar 19, 2020";"Mar 20, 2020";"Mar 21, 2020";"Mar 22, 2020";"Mar 23, 2020";"Mar 24, 2020";"Mar 25, 2020";"Mar 26, 2020";"Mar 27, 2020";"Mar 28, 2020";"Mar 29, 2020";"Mar 30, 2020";"Mar 31, 2020";"Apr 1, 2020";"Apr 2, 2020";"Apr 3, 2020";"Apr 4, 2020";"Apr 5, 2020";"Apr 6, 2020";"Apr 7, 2020";"Apr 8, 2020"];
day=get(handles.slider1,'Value');
set(handles.text4,'String',d(day));

World=[27;27;27;44;44;59;59;59;59;59;59;59;59;60;60;61;61;66;83;219;239;392;534;631;897;1350;2023;2820;4587;6067;7823;9826;11946;14554;17372;20615;24522;28273;31491;34933;37552;40540;43105;45177;60328;64543;67103;69265;71332;73327;75191;75723;76719;77804;78812;79339;80132;80995;82101;83365;85203;87024;89068;90865;93077;95316;98172;102133;105824;109695;114232;118610;125497;133852;143227;154774;167418;180096;194836;213150;242364;271106;305188;338133;377918;416845;468049;527767;591690;656868;715358;777133;851341;928490;1005937;1087651;1174364;1245596;1316986;1391888];
Australia=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;4;4;4;4;6;7;9;11;11;11;12;13;14;14;14;14;14;14;14;15;15;15;15;15;15;15;17;21;22;22;22;22;23;23;25;26;29;33;41;52;59;63;74;80;100;112;126;156;197;249;298;375;454;565;709;874;1098;1709;1823;2423;2799;3166;3378;3809;4093;4557;4707;4976;5224;5548;5687;5744;5844;5956];
Austria=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;2;2;5;7;10;14;18;24;29;41;74;99;102;131;182;246;361;504;655;860;1016;1332;1646;2196;2649;3024;3631;4486;5282;5888;7029;7697;8291;8813;9618;10182;10711;11129;11525;11766;11983;12297;12640];
China=[27;27;27;44;44;59;59;59;59;59;59;59;59;59;59;59;59;63;80;216;235;386;526;623;882;1323;1988;2775;4528;5994;7734;9714;11809;14399;17211;20448;24320;28047;31207;34625;37232;40206;42696;44724;59865;64021;66559;68566;70618;72508;74258;74652;75543;76369;77016;77234;77749;78159;78598;78927;79355;79929;80134;80261;80380;80497;80667;80768;80814;80859;80879;80908;80932;80954;80973;80995;81020;81063;81086;81130;81229;81281;81346;81484;81553;81631;81733;81827;81946;82059;82157;82241;82295;82395;82465;82527;82575;82642;82698;82784];
USA=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;1;1;1;2;2;5;5;5;5;6;7;8;11;11;11;12;12;12;12;12;13;13;14;15;15;15;15;15;15;15;16;35;35;35;53;53;59;60;66;69;89;103;125;159;233;338;433;554;754;1025;1312;1663;2174;2951;3774;4661;6427;9415;14250;19624;26747;35206;46442;55231;69194;85991;104686;124665;143025;164620;189618;216721;245540;277965;312237;337635;368196;398809];
UK=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;2;2;2;2;2;2;2;3;3;4;4;8;8;9;9;9;9;9;9;9;9;9;9;9;13;13;13;13;16;18;23;36;40;51;85;115;163;206;273;321;373;456;590;707;1140;1391;1543;1950;2630;3277;3983;5018;5683;6650;8077;9529;11658;14543;17089;19522;22141;25150;29474;33718;38168;41903;47806;51608;55242];
France=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;3;3;3;3;4;5;6;6;6;6;6;6;6;6;11;11;11;11;11;11;11;11;11;12;12;12;12;12;12;12;12;12;14;17;38;57;100;130;178;212;285;423;613;716;1126;1412;1784;2281;2876;3661;4499;5423;6633;7730;9134;10995;12612;14459;16018;19856;22302;25233;29155;32964;37575;40174;44550;52128;56989;59105;64338;68605;70478;74390;78167];
Germany=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;4;4;5;7;8;9;11;11;11;12;13;13;13;13;15;15;15;15;15;15;15;15;15;15;15;15;15;15;17;21;47;57;111;129;157;196;262;400;684;847;902;1139;1296;1567;2369;3062;3795;4838;6012;7156;8198;14138;18187;21463;24774;29212;31554;36508;42288;48582;52547;57298;61913;67366;73522;79696;85778;91714;95391;99225;103228];

axes(handles.axes1);
cla;
 x=1:day;
    plot(x,World(1:day))
    axis([1 115 0 1.5*10^6]) 
    text(day,World(day), 'World','FontSize',8); 
    grid on
    ylabel('Confirmed cases')

axes(handles.axes2);
cla;

x=1:day;
plot(x,Australia(1:day))
hold on
plot(x,Austria(1:day))
plot(x,China(1:day))
plot(x,USA(1:day))
plot(x,UK(1:day))
plot(x,France(1:day))
plot(x,Germany(1:day))
text(day,Australia(day), 'Australia','FontSize',6); 
    text(day,Austria(day), 'Austria','FontSize',6); 
    text(day,China(day), 'China','FontSize',6); 
    text(day,USA(day), 'USA','FontSize',6); 
    text(day,UK(day), 'UK','FontSize',6); 
    text(day,France(day), 'France','FontSize',6); 
    text(day,Germany(day), 'Germany','FontSize',6); 
ylabel('Confirmed cases')

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
cla;

d=["Dec 31, 2019";"Jan 1, 2020";"Jan 2, 2020";"Jan 3, 2020";"Jan 4, 2020";"Jan 5, 2020";"Jan 6, 2020";"Jan 7, 2020";"Jan 8, 2020";"Jan 9, 2020";"Jan 10, 2020";"Jan 11, 2020";"Jan 12, 2020";"Jan 13, 2020";"Jan 14, 2020";"Jan 15, 2020";"Jan 16, 2020";"Jan 17, 2020";"Jan 18, 2020";"Jan 19, 2020";"Jan 20, 2020";"Jan 21, 2020";"Jan 22, 2020";"Jan 23, 2020";"Jan 24, 2020";"Jan 25, 2020";"Jan 26, 2020";"Jan 27, 2020";"Jan 28, 2020";"Jan 29, 2020";"Jan 30, 2020";"Jan 31, 2020";"Feb 1, 2020";"Feb 2, 2020";"Feb 3, 2020";"Feb 4, 2020";"Feb 5, 2020";"Feb 6, 2020";"Feb 7, 2020";"Feb 8, 2020";"Feb 9, 2020";"Feb 10, 2020";"Feb 11, 2020";"Feb 12, 2020";"Feb 13, 2020";"Feb 14, 2020";"Feb 15, 2020";"Feb 16, 2020";"Feb 17, 2020";"Feb 18, 2020";"Feb 19, 2020";"Feb 20, 2020";"Feb 21, 2020";"Feb 22, 2020";"Feb 23, 2020";"Feb 24, 2020";"Feb 25, 2020";"Feb 26, 2020";"Feb 27, 2020";"Feb 28, 2020";"Feb 29, 2020";"Mar 1, 2020";"Mar 2, 2020";"Mar 3, 2020";"Mar 4, 2020";"Mar 5, 2020";"Mar 6, 2020";"Mar 7, 2020";"Mar 8, 2020";"Mar 9, 2020";"Mar 10, 2020";"Mar 11, 2020";"Mar 12, 2020";"Mar 13, 2020";"Mar 14, 2020";"Mar 15, 2020";"Mar 16, 2020";"Mar 17, 2020";"Mar 18, 2020";"Mar 19, 2020";"Mar 20, 2020";"Mar 21, 2020";"Mar 22, 2020";"Mar 23, 2020";"Mar 24, 2020";"Mar 25, 2020";"Mar 26, 2020";"Mar 27, 2020";"Mar 28, 2020";"Mar 29, 2020";"Mar 30, 2020";"Mar 31, 2020";"Apr 1, 2020";"Apr 2, 2020";"Apr 3, 2020";"Apr 4, 2020";"Apr 5, 2020";"Apr 6, 2020";"Apr 7, 2020";"Apr 8, 2020"];
World=[27;27;27;44;44;59;59;59;59;59;59;59;59;60;60;61;61;66;83;219;239;392;534;631;897;1350;2023;2820;4587;6067;7823;9826;11946;14554;17372;20615;24522;28273;31491;34933;37552;40540;43105;45177;60328;64543;67103;69265;71332;73327;75191;75723;76719;77804;78812;79339;80132;80995;82101;83365;85203;87024;89068;90865;93077;95316;98172;102133;105824;109695;114232;118610;125497;133852;143227;154774;167418;180096;194836;213150;242364;271106;305188;338133;377918;416845;468049;527767;591690;656868;715358;777133;851341;928490;1005937;1087651;1174364;1245596;1316986;1391888];
Australia=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;4;4;4;4;6;7;9;11;11;11;12;13;14;14;14;14;14;14;14;15;15;15;15;15;15;15;17;21;22;22;22;22;23;23;25;26;29;33;41;52;59;63;74;80;100;112;126;156;197;249;298;375;454;565;709;874;1098;1709;1823;2423;2799;3166;3378;3809;4093;4557;4707;4976;5224;5548;5687;5744;5844;5956];
Austria=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;2;2;5;7;10;14;18;24;29;41;74;99;102;131;182;246;361;504;655;860;1016;1332;1646;2196;2649;3024;3631;4486;5282;5888;7029;7697;8291;8813;9618;10182;10711;11129;11525;11766;11983;12297;12640];
China=[27;27;27;44;44;59;59;59;59;59;59;59;59;59;59;59;59;63;80;216;235;386;526;623;882;1323;1988;2775;4528;5994;7734;9714;11809;14399;17211;20448;24320;28047;31207;34625;37232;40206;42696;44724;59865;64021;66559;68566;70618;72508;74258;74652;75543;76369;77016;77234;77749;78159;78598;78927;79355;79929;80134;80261;80380;80497;80667;80768;80814;80859;80879;80908;80932;80954;80973;80995;81020;81063;81086;81130;81229;81281;81346;81484;81553;81631;81733;81827;81946;82059;82157;82241;82295;82395;82465;82527;82575;82642;82698;82784];
USA=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;1;1;1;2;2;5;5;5;5;6;7;8;11;11;11;12;12;12;12;12;13;13;14;15;15;15;15;15;15;15;16;35;35;35;53;53;59;60;66;69;89;103;125;159;233;338;433;554;754;1025;1312;1663;2174;2951;3774;4661;6427;9415;14250;19624;26747;35206;46442;55231;69194;85991;104686;124665;143025;164620;189618;216721;245540;277965;312237;337635;368196;398809];
UK=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;2;2;2;2;2;2;2;3;3;4;4;8;8;9;9;9;9;9;9;9;9;9;9;9;13;13;13;13;16;18;23;36;40;51;85;115;163;206;273;321;373;456;590;707;1140;1391;1543;1950;2630;3277;3983;5018;5683;6650;8077;9529;11658;14543;17089;19522;22141;25150;29474;33718;38168;41903;47806;51608;55242];
France=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;3;3;3;3;4;5;6;6;6;6;6;6;6;6;11;11;11;11;11;11;11;11;11;12;12;12;12;12;12;12;12;12;14;17;38;57;100;130;178;212;285;423;613;716;1126;1412;1784;2281;2876;3661;4499;5423;6633;7730;9134;10995;12612;14459;16018;19856;22302;25233;29155;32964;37575;40174;44550;52128;56989;59105;64338;68605;70478;74390;78167];
Germany=[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;4;4;5;7;8;9;11;11;11;12;13;13;13;13;15;15;15;15;15;15;15;15;15;15;15;15;15;15;17;21;47;57;111;129;157;196;262;400;684;847;902;1139;1296;1567;2369;3062;3795;4838;6012;7156;8198;14138;18187;21463;24774;29212;31554;36508;42288;48582;52547;57298;61913;67366;73522;79696;85778;91714;95391;99225;103228];

for i=1:100
    axes(handles.axes1);
    cla;
    set(handles.text4,'String',d(i))
    x=1:i;
    plot(x,World(1:i))
    axis([1 115 0 1.5*10^6]) 
    text(i,World(i), 'World','FontSize',8); 
    grid on
    ylabel('Confirmed cases')
      axes(handles.axes2);
      cla;
     plot(x,Australia(1:i)) ;
     text(i,Australia(i), 'Australia','FontSize',6); 
    text(i,Austria(i), 'Austria','FontSize',6); 
    text(i,China(i), 'China','FontSize',6); 
    text(i,USA(i), 'USA','FontSize',6); 
    text(i,UK(i), 'UK','FontSize',6); 
    text(i,France(i), 'France','FontSize',6); 
    text(i,Germany(i), 'Germany','FontSize',6); 
    
    hold on
    plot(x,Austria(1:i))
    plot(x,China(1:i))
    plot(x,USA(1:i))
    plot(x,UK(1:i))
    plot(x,France(1:i))
    plot(x,Germany(1:i))
    axis([1 115 0 4.2*10^5])
    grid on
    ylabel('Confirmed cases')
end

   
    


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close 
run('page2.m')
