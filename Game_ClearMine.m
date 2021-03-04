function  varargout = Game_ClearMine( varargin )

if nargin == 0
    OldHandle = findobj( 'Type', 'figure', 'Tag', 'ClearMine' ) ;
    if ishandle( OldHandle )
        close( OldHandle ) ;
    end
    FigureHandle = figure('Visible', 'off') ;
    
    init_FigureContent( FigureHandle ) ; 
    
elseif ischar( varargin{1} )
    if nargout > 0
        [varargout{1:nargout}] = feval(varargin{:}) ;
    else
        feval(varargin{:}) ;
    end
end


% ------------------------------------------------------------------------
function generate_FigureContent( FigureHandle, ButtonNumber ) ;

TabSpace = 10 ;

MidSpace = 1 ;

ButtonColNumber = ButtonNumber(2) ;
ButtonRowNumber = ButtonNumber(1) ;

TextHeight = 25 ;


FigureWidth = ButtonColNumber * (21 + MidSpace) + TabSpace * 4 ;
FigureHeight = ButtonRowNumber * (21 + MidSpace) + TabSpace * 5 + TextHeight ;

set( FigureHandle, 'Position', [100, 100, FigureWidth, FigureHeight], 'Menubar', 'none',...
    'Visible', 'off', 'Name', 'mine sweeper',  'Tag', 'ClearMine', 'NumberTitle', 'off',...
    'DoubleBuffer', 'on', 'Units', 'pixel', 'Color', [0.85 0.85 0.85], 'Resize', 'off',...
    'KeyPressFcn', 'Game_ClearMine(''Keypress_fcn'', gcbf)' ) ;

AxesHandle = axes( 'Position', [0, 0, 1, 1], 'Units', 'pixel',...
    'XLim', [0, FigureWidth], 'YLim', [0, FigureHeight], 'Visible', 'off' ) ;

LineXArray = [TabSpace, FigureWidth-TabSpace, FigureWidth-TabSpace, TabSpace, TabSpace] ;
LineYArray = [TabSpace, TabSpace, FigureHeight-TabSpace, FigureHeight-TabSpace, TabSpace] ;
line( LineXArray, LineYArray, 'Color', 'k' ) ;

MenuHandle = uimenu( FigureHandle, 'Label', 'Game', 'Tag', 'MainMenu' ) ;
SubMenuTag = {'Begin', 'Easy', 'Normal', 'Hard', 'Custom', 'Exit' } ;
SubMenuString = {'start(&B)', 'low(&E)', 'middle(&N)', 'high(&H)', 'Do it self (&C)', 'Quit(&Q)'};
SubMenuCallback = {'Game_ClearMine( ''BeginMenu_Callback'', gcbo)',...
        'Game_ClearMine( ''EasyMenu_Callback'', gcbo)',...
        'Game_ClearMine( ''NormalMenu_Callback'', gcbo)',...
        'Game_ClearMine( ''HardMenu_Callback'', gcbo)' ,...
        'Game_ClearMine( ''CustomMenu_Callback'', gcbo)',...
        'close(gcf)'} ;
SubMenuSeparator = {'off', 'on', 'off','off','off','on'} ;

for num = 1: length( SubMenuTag )
    SubMenuHandle(num) = uimenu( MenuHandle ) ;
    set( SubMenuHandle(num), 'Tag', SubMenuTag{num},...
        'Label', SubMenuString{num},...
        'Separator', SubMenuSeparator{num},...
        'Callback', SubMenuCallback{num} ) ;
end

MenuHandle = uimenu( FigureHandle, 'Label', 'help', 'Tag', 'MenuHelp' ) ;
uimenu( MenuHandle, 'Label', 'help', 'Tag', 'Help',...
    'Callback', 'helpdlg(''Game start when you take the first step，Ctrl+Enter can pass。'', ''the Ultimate Method'')' ) ;


if ButtonColNumber < 8
    TextWidth = (FigureWidth - TabSpace * 2 - TabSpace * 2 - TabSpace * 2 * 2) / 3 ;
else
    TextWidth = (FigureWidth - TabSpace * 2 - TabSpace * 2 - TabSpace * 4 * 2) / 3 ;
end
TextPosition = [TabSpace*2 FigureHeight-2*TabSpace-TextHeight TextWidth TextHeight] ;

if ButtonColNumber < 8
    TextFontSize = 12 ;
else
    TextFontSize = 16 ;
end

TextTag = {'MineNumber', 'Face', 'Time'} ;
TextString = {'', '', '0'} ;
TextStyle = {'text', 'pushbutton', 'text'} ;
TextCallback = {'', 'Game_ClearMine(''BeginMenu_Callback'', gcbo)', ''} ;
for num = 1: length(TextTag)
    TempTextPosition = TextPosition ;
    if ButtonColNumber < 8
        TempTextPosition(1) = TempTextPosition(1) + (num-1) * (TextWidth + 2 * TabSpace) ;
    else
        TempTextPosition(1) = TempTextPosition(1) + (num-1) * (TextWidth + 4 * TabSpace) ;
    end    
    UicontrolHandle = uicontrol( 'Style', TextStyle{num}, 'Position', TempTextPosition, 'Tag', TextTag{num},...
        'BackgroundColor', [0.7 0.7 0.7], 'FontSize', TextFontSize, 'HorizontalAlignment', 'center',...
        'String', TextString{num}, 'Callback', TextCallback{num} ) ; 
    if num == 2
        TempTextPosition(1) = TempTextPosition(1) + (TempTextPosition(3) - 23) / 2 ;
        TempTextPosition(3) = 23 ;
        set( UicontrolHandle, 'Position', TempTextPosition) ;
    end
end

ButtonXPos = TabSpace * 2 ;
ButtonWidth =  21 ;
ButtonHeight = 21 ;
ButtonYPos = TabSpace * 3 + ButtonHeight * ButtonRowNumber ;
ButtonPosition = [ButtonXPos ButtonYPos ButtonWidth ButtonHeight] ;

for j = 1: ButtonColNumber
    for i = 1: ButtonRowNumber
        %         TempButtonTag = sprintf('Button%d%d', i, j ) ;
        TempButtonPosition = ButtonPosition ;
        TempButtonPosition(1) = TempButtonPosition(1) + (j - 1) * (ButtonWidth + MidSpace) ;
        TempButtonPosition(2) = TempButtonPosition(2) - i * (ButtonHeight + MidSpace) ;
        ButtonHandles((j-1)*ButtonRowNumber+i) = uicontrol( 'Style', 'PushButton', 'Position', TempButtonPosition, 'Tag', 'Button',...
            'Enable', 'on', 'BackgroundColor', [0.75 0.75 0.75],  'UserData', (j-1)*ButtonRowNumber+i,...
            'FontSize', 13, 'Callback', 'Game_ClearMine( ''ButtonDown_Callback'', gcbo)',...
            'ButtonDownFcn', 'Game_ClearMine( ''ButtonDownFcn'', gcbo)' ) ;
    end
end

if ButtonColNumber == 16
    x = (0: ButtonColNumber) * (21 + MidSpace) + ButtonXPos - 1 ;
else
    x = (0: ButtonColNumber) * (21 + MidSpace) + ButtonXPos - 2 ;
end
y = (-ButtonRowNumber:0) * (21 + MidSpace) + ButtonYPos - 1 ;

[X, Y] = meshgrid(x, y) ;
line( X, Y, 'Color', 'k') ;
line( X', Y', 'Color', 'k') ;
setappdata( FigureHandle, 'ButtonHandles', ButtonHandles ) ;

% ------------------------------------------------------------------------
function init_FigureContent( FigureHandle ) ;

handles = guidata( FigureHandle ) ;

GameInfo = getappdata( FigureHandle, 'GameInfo' ) ;

if isempty( GameInfo )
    GameInfo.RowNumber = 9 ;
    GameInfo.ColNumber = 9 ;
    GameInfo.MineNumber = 10 ;    
end

ButtonNumber = [GameInfo.RowNumber GameInfo.ColNumber] ;
close(FigureHandle) ;
FigureHandle = figure('Visible', 'off') ;
generate_FigureContent( FigureHandle, ButtonNumber ) ;

setappdata( FigureHandle, 'GameInfo', GameInfo ) ;

movegui( FigureHandle, 'center' ) ;
set( FigureHandle, 'Visible', 'on' ) ;

handles = guihandles( FigureHandle ) ;
guidata( FigureHandle, handles) ;    

set( handles.MineNumber, 'String', num2str(GameInfo.MineNumber) ) ;

BeginMenu_Callback( FigureHandle ) ;


% -------------------------------------------------------------------------
function BeginMenu_Callback( h )

handles = guidata( h ) ;

setappdata( handles.ClearMine, 'GameIsBegin', 0 ) ;
setappdata( handles.ClearMine, 'GameOver', 1 ) ;
setappdata( handles.ClearMine, 'CountSecond', 1 ) ;
setappdata( handles.ClearMine, 'MineNumberArray', [] ) ;

Matrix = com_GetFaceImage( 'Smile' ) ;
set( handles.Face, 'CData', Matrix/255 ) ;

GameInfo = getappdata( handles.ClearMine, 'GameInfo' ) ;
set( handles.MineNumber, 'String', num2str(GameInfo.MineNumber) ) ;

ButtonHandles = getappdata( handles.ClearMine, 'ButtonHandles' ) ;
set( ButtonHandles, 'Enable', 'on', 'Style', 'pushbutton', 'String', '', 'ForeGroundColor', 'k', 'CData', [], 'BackgroundColor', [0.75 0.75 0.75] ) ;


% ------------------------------------------------------------------------
function  EasyMenu_Callback( h ) 

handles = guidata( h ) ;

GameInfo.RowNumber = 9 ;
GameInfo.ColNumber = 9 ;
GameInfo.MineNumber = 10 ; 
setappdata( handles.ClearMine, 'GameInfo', GameInfo ) ;

init_FigureContent( handles.ClearMine ) ;


% ------------------------------------------------------------------------
function  NormalMenu_Callback( h ) 

handles = guidata( h ) ;

GameInfo.RowNumber = 16 ;
GameInfo.ColNumber = 16 ;
GameInfo.MineNumber = 40 ; 
setappdata( handles.ClearMine, 'GameInfo', GameInfo ) ;

init_FigureContent( handles.ClearMine ) ;


% ------------------------------------------------------------------------
function  HardMenu_Callback( h ) 

handles = guidata( h ) ;

GameInfo.RowNumber = 16 ;
GameInfo.ColNumber = 30 ;
GameInfo.MineNumber = 99 ; 
setappdata( handles.ClearMine, 'GameInfo', GameInfo ) ;

init_FigureContent( handles.ClearMine ) ;


% -------------------------------------------------------------------------
function  ButtonDown_Callback( h )

handles = guidata( h ) ;

ButtonIndex = get( h, 'UserData' ) ;

GameIsBegin = getappdata( handles.ClearMine, 'GameIsBegin' ) ;

if isempty( GameIsBegin )
    GameIsBegin = 0 ;    
end

if GameIsBegin == 0
    setappdata( handles.ClearMine, 'GameOver', 0 ) ;
    GameInfo = getappdata( handles.ClearMine, 'GameInfo' ) ;
    RowNumber = GameInfo.RowNumber ;
    ColNumber = GameInfo.ColNumber ;
    TotalMineNumber = GameInfo.MineNumber ;
    InitMineSetting( h, RowNumber, ColNumber, TotalMineNumber, ButtonIndex ) ;
end

MineNumberArray = getappdata( handles.ClearMine, 'MineNumberArray' ) ;
SolveArray = getappdata( handles.ClearMine, 'SolveArray' ) ;

MineNumber = MineNumberArray(ButtonIndex) ;

if  isnan( MineNumber )    
    ButtonHandles = getappdata( handles.ClearMine, 'ButtonHandles' ) ;
    set( ButtonHandles, 'Enable', 'inactive' ) ;
    
    UsefulIndex = getappdata( handles.ClearMine, 'UsefulIndex' ) ;
    Matrix = com_GetMineImage ;
    set( ButtonHandles(UsefulIndex), 'CData', Matrix ) ;
    
    Matrix = com_GetFaceImage( 'Cry' ) ;
    set( handles.Face, 'CData', Matrix/255 ) ;

    setappdata( handles.ClearMine, 'GameOver', 1 ) ;    
elseif MineNumber == 0
    if ~isempty(get(h, 'CData' ))
        return ;
    end
    SafeIndex = getappdata( handles.ClearMine, 'SafeIndex' ) ;   
    UnionIndex = getappdata( handles.ClearMine, 'UnionIndex' ) ;
    
    Index = find(SafeIndex == ButtonIndex ) ;
    UnionID = UnionIndex(Index) ;
    
    TempUnionIndex = find(UnionIndex == UnionID) ;
    ClearIndex = SafeIndex(TempUnionIndex) ;
    
    ButtonHandles = getappdata( handles.ClearMine, 'ButtonHandles' ) ;
    set( ButtonHandles(ClearIndex), 'String', '', 'Style', 'text', 'BackgroundColor', [0.85 0.85 0.85]) ;
    
    SolveArray = setdiff(SolveArray, ClearIndex) ;
    
    GameInfo = getappdata( handles.ClearMine, 'GameInfo' ) ;
    RowNumber = GameInfo.RowNumber ;
    ColNumber = GameInfo.ColNumber ;
    AroundArray = zeros(length(ClearIndex)*8,1) ;
    for num = 1: length(ClearIndex)
        TempIndex = ClearIndex(num) ;
        if mod( TempIndex, RowNumber) == 1
            AroundIndex = TempIndex + [1 -RowNumber -RowNumber+1 RowNumber RowNumber+1] ;
        elseif mod( TempIndex, RowNumber) == 0
            AroundIndex = TempIndex + [-1 -RowNumber -RowNumber-1 RowNumber RowNumber-1] ;
        else
            AroundIndex = TempIndex + [-1 1 -RowNumber -RowNumber-1 -RowNumber+1 RowNumber-1 RowNumber RowNumber+1] ;
        end
        AroundIndex(AroundIndex<=0|AroundIndex>RowNumber*ColNumber) = [] ;
        AroundArray((num-1)*8+1:(num-1)*8+length(AroundIndex)) = AroundIndex ;
    end
    AroundArray(AroundArray==0) = [] ;
    AroundArray = unique(AroundArray) ;
    
    MineNumber = MineNumberArray(AroundArray) ;
    ColorArray = 'bgrcmykbg' ;
    for num = 1: max(max(MineNumber))
        TempIndex = find(MineNumber == num) ;
        if ~isempty(TempIndex)            
            set( ButtonHandles(AroundArray(TempIndex)), 'String', num2str(num), 'Style', 'text',...
                'ForeGroundColor', ColorArray(num), 'BackgroundColor', [0.85 0.85 0.85] ) ;
        end
    end
    
    SolveArray = setdiff(SolveArray, AroundArray) ;
    
    if isempty(SolveArray)
        setappdata( handles.ClearMine, 'GameOver', 1 ) ;
        helpdlg('you won!') ;
    else
        setappdata( handles.ClearMine, 'SolveArray', SolveArray ) ;
    end
else    
    if ~isempty(get(h, 'CData' ))
        return ;
    end
    ColorArray = 'bgrcmykbg' ;
    set( h, 'String', num2str(MineNumber), 'Style', 'text', 'ForeGroundColor', ColorArray(MineNumber), 'BackgroundColor', [0.85 0.85 0.85] ) ;
    SolveArray(SolveArray == ButtonIndex) = [] ;
    if isempty(SolveArray)
        setappdata( handles.ClearMine, 'GameOver', 1 ) ;
        helpdlg('you won!') ;
    else
        setappdata( handles.ClearMine, 'SolveArray', SolveArray ) ;
    end
end

if GameIsBegin == 0
    GameIsBegin = 1 ;
    setappdata( handles.ClearMine, 'GameIsBegin', GameIsBegin ) ;
    BeginCalculate_Callback( h ) ;
end


% --------------------------------------------------------------------
function ButtonDownFcn( h ) 

handles = guidata( h ) ;

if strcmp( get(handles.ClearMine, 'SelectionType' ), 'alt' )
    GameIsBegin = getappdata( handles.ClearMine, 'GameIsBegin' ) ;
    GameOver = getappdata( handles.ClearMine, 'GameOver' ) ;
    if isempty(GameIsBegin) | GameIsBegin == 0
        return ;
    end
    if isempty(GameOver) | GameOver == 1
        return ;
    end    
    CurrentHandle = gco ;
    if ~strcmp(get(CurrentHandle, 'Style'), 'pushbutton' )
        return ;
    end
    Matrix = get( CurrentHandle, 'CData' ) ;
    MineNumber = str2num( get( handles.MineNumber, 'String' ) ) ;
    
    if isempty( MineNumber) | MineNumber <= 0 
        return ;
    end
    
    if isempty(Matrix)
        Matrix = com_GetFlagImage ;
        set( CurrentHandle, 'CData', Matrix ) ;
        set( handles.MineNumber, 'String', num2str(MineNumber-1) ) ;
        set( CurrentHandle, 'Enable', 'inactive' ) ;
    else
        set( CurrentHandle, 'CData', [] ) ;
        set( handles.MineNumber, 'String', num2str(MineNumber+1) ) ;
        set( CurrentHandle, 'Enable', 'on' ) ;
    end
end


% ------------------------------------------------------------------------
function InitMineSetting( h, RowNumber, ColNumber, TotalMineNumber, ButtonIndex )

handles = guidata( h ) ;

% 随机取格子布雷
RandIndex = randperm( RowNumber*ColNumber ) ;
UsefulIndex = RandIndex(1:TotalMineNumber) ;

if  any( UsefulIndex == ButtonIndex ) % 比ismember( ButtonIndex, UsefulIndex )效率高一点 
    % 选的第一个格子不能有雷
    UsefulIndex = RandIndex(1: TotalMineNumber+1) ;
    UsefulIndex(UsefulIndex == ButtonIndex) = [] ;
end
setappdata( handles.ClearMine, 'UsefulIndex', UsefulIndex ) ;

% 定义保存雷数目的向量
MineNumberArray = zeros(RowNumber,ColNumber) ;
% 布了雷的格子的雷数值设为nan或inf
MineNumberArray(UsefulIndex) = nan ;

% 对雷格四周的格子雷数值各+1
for num = 1: TotalMineNumber    
    TempIndex = UsefulIndex(num) ;
    % 周围格子的序号，可以包括自身，因为nan+1 = nan
    if mod(TempIndex, RowNumber) == 0
        AroundIndex = [-1 -1 -1; 0 0 0] + repmat( [-1:1]*RowNumber+TempIndex, 2, 1) ;
    elseif mod(TempIndex, RowNumber) == 1
        AroundIndex = [0 0 0; 1 1 1] + repmat( [-1:1]*RowNumber+TempIndex, 2, 1) ;
    else
        AroundIndex = [-1 -1 -1; 0 0 0; 1 1 1] + repmat( [-1:1]*RowNumber+TempIndex, 3, 1) ;
    end
    AroundIndex(AroundIndex<=0 | AroundIndex>RowNumber*ColNumber) = [] ;
    MineNumberArray(AroundIndex) = MineNumberArray(AroundIndex) + 1 ;
end
setappdata( handles.ClearMine, 'MineNumberArray', MineNumberArray ) ;

MineNumberArray = MineNumberArray(:) ;
% 对周围无雷（即值还是0）的点进行分组
SafeIndex = find(MineNumberArray == 0) ;
UnionIndex = ones( size(MineNumberArray) ) * inf;
UnionIndex(SafeIndex) = 0 ;
NotSureNumber = 0 ;
TempMaxUnion = 0 ;
NextNotSureIndex = 0 ;

while(any(UnionIndex<=0))    
    if NotSureNumber > 0
        if NextNotSureIndex ~= 0
            TempNotSureIndex = NextNotSureIndex ;
            if mod( TempNotSureIndex, RowNumber) == 1
                AroundIndex = TempNotSureIndex + [1 -RowNumber -RowNumber+1 RowNumber RowNumber+1] ;
            elseif mod( TempNotSureIndex, RowNumber) == 0
                AroundIndex = TempNotSureIndex + [-1 -RowNumber -RowNumber-1 RowNumber RowNumber-1] ;
            else
                AroundIndex = TempNotSureIndex + [-1 1 -RowNumber -RowNumber-1 -RowNumber+1 RowNumber-1 RowNumber RowNumber+1] ;
            end           
            AroundIndex(AroundIndex<=0 | AroundIndex>RowNumber*ColNumber) = [] ;
            if ~isempty(AroundIndex)
                RealNotSureIndex = find(UnionIndex(AroundIndex) == 0) ;
                AroundIndex = AroundIndex(RealNotSureIndex) ;
            end
            UnionIndex(TempNotSureIndex) = TempMaxUnion ;
            NotSureNumber = NotSureNumber - 1 ;
            NextNotSureIndex = 0 ;
            if ~isempty(AroundIndex)   
                UnionIndex(AroundIndex) = -1 ;
                NextNotSureIndex = AroundIndex(1) ;
                NotSureNumber = NotSureNumber + length(AroundIndex) ;
            end
        else
            for num = 1: length(SafeIndex)
                TempNotSureIndex = UnionIndex(SafeIndex(num)) ;
                if TempNotSureIndex == -1                    
                    if mod( SafeIndex(num), RowNumber) == 1
                        AroundIndex = SafeIndex(num) + [1 -RowNumber -RowNumber+1 RowNumber RowNumber+1] ;
                    elseif mod( SafeIndex(num), RowNumber) == 0
                        AroundIndex = SafeIndex(num) + [-1 -RowNumber -RowNumber-1 RowNumber RowNumber-1] ;
                    else
                        AroundIndex = SafeIndex(num) + [-1 1 -RowNumber -RowNumber-1 -RowNumber+1 RowNumber-1 RowNumber RowNumber+1] ;
                    end 
                    AroundIndex(AroundIndex<=0 | AroundIndex>RowNumber*ColNumber) = [] ;
                    if ~isempty(AroundIndex)
                        RealNotSureIndex = find(UnionIndex(AroundIndex) == 0) ;
                        AroundIndex = AroundIndex(RealNotSureIndex) ;
                    end
                    UnionIndex(SafeIndex(num)) = TempMaxUnion ;
                    NotSureNumber = NotSureNumber - 1 ;
                    NextNotSureIndex = 0 ;
                    if ~isempty(AroundIndex)                    
                        UnionIndex(AroundIndex) = -1 ;
                        NextNotSureIndex = AroundIndex(1) ;
                        NotSureNumber = NotSureNumber + length(AroundIndex) ;
                    end
                    break;
                end
            end
        end
    else 
        for num = 1: length( SafeIndex )
            TempIndex = SafeIndex(num) ;
            if UnionIndex(TempIndex) == 0
                if mod( TempIndex, RowNumber) == 1
                    AroundIndex = TempIndex + [1 -RowNumber -RowNumber+1 RowNumber RowNumber+1] ;
                elseif mod( TempIndex, RowNumber) == 0
                    AroundIndex = TempIndex + [-1 -RowNumber -RowNumber-1 RowNumber RowNumber-1] ;
                else
                    AroundIndex = TempIndex + [-1 1 -RowNumber -RowNumber-1 -RowNumber+1 RowNumber-1 RowNumber RowNumber+1] ;
                end
                AroundIndex(AroundIndex<=0 | AroundIndex>RowNumber*ColNumber) = [] ;
                if ~isempty(AroundIndex)
                    RealNotSureIndex = find(UnionIndex(AroundIndex) <= 0) ;
                    AroundIndex = AroundIndex(RealNotSureIndex) ;
                end
                TempMaxUnion = TempMaxUnion + 1 ;
                UnionIndex(TempIndex) = TempMaxUnion ;
                NextNotSureIndex = 0 ;
                if  ~isempty(AroundIndex)   
                    UnionIndex(AroundIndex) = -1 ;
                    NextNotSureIndex = AroundIndex(1) ;
                    NotSureNumber = NotSureNumber + length(AroundIndex) ;
                end
                break;
            end
        end
    end
end
UnionIndex = UnionIndex( ~isinf(UnionIndex) ) ;
setappdata( handles.ClearMine, 'SafeIndex', SafeIndex ) ;
setappdata( handles.ClearMine, 'UnionIndex', UnionIndex ) ;

% 保存剩余非雷格子序号
SolveArray = 1: numel(MineNumberArray) ;
SolveArray = setdiff(SolveArray, UsefulIndex) ;
setappdata( handles.ClearMine, 'SolveArray', SolveArray ) ;



% -----------------------------------------------------------------------
function BeginCalculate_Callback( h ) 

handles = guidata( h ) ;

CountSecond = getappdata( handles.ClearMine, 'CountSecond' ) ;
if isempty(CountSecond)
    CountSecond = 0 ;
end
while(1)    
    PassTime = sprintf('%d',ceil(CountSecond)) ;
    pause(1) ;
    if ishandle( handles.Time )
        GameOver = getappdata( handles.ClearMine, 'GameOver' ) ;
        if isempty(GameOver)
            setappdata( handles.ClearMine, 'GameOver', 0 ) ;
        end
        if GameOver == 1
            break ;
        end
        CountSecond = CountSecond + 1 ;
        set( handles.Time, 'String', PassTime ) ;        
        setappdata( handles.ClearMine, 'CountSecond', CountSecond ) ;
    else
        break
    end    
end



% -------------------------------------------------------------------------
function CustomMenu_Callback( h )

handles = guidata( h ) ;

GameInfo = getappdata( handles.ClearMine, 'GameInfo' ) ;

if isempty(GameInfo)
    GameInfo.RowNumber = 10 ;
    GameInfo.ColNumber = 10 ;
    GameInfo.MineNumber = 10 ;
end

RowNumber = GameInfo.RowNumber ;
ColNumber = GameInfo.ColNumber ;
MineNumber = GameInfo.MineNumber ;

FigureHandle = figure( 'Name', 'do it self', 'Menubar', 'none', 'WindowStyle', 'modal',...
    'NumberTitle', 'off', 'Position', [300 300 130 100], 'Resize', 'off', 'Visible', 'off' );

setappdata( FigureHandle, 'PassHandle', handles.ClearMine ) ;

uicontrol( 'sty', 'text', 'str', 'Height', 'pos', [10 70 30 20] ) ;
uicontrol( 'sty', 'text', 'str', 'Width', 'pos', [10 40 30 20] ) ;
uicontrol( 'sty', 'text', 'str', 'Mines', 'pos', [10 10 30 20] ) ;
uicontrol( 'sty', 'edit', 'tag', 'height', 'str', num2str(RowNumber), 'pos', [50 70 30 20] ) ;
uicontrol( 'sty', 'edit', 'tag', 'width', 'str', num2str(ColNumber), 'pos', [50 40 30 20] ) ;
uicontrol( 'sty', 'edit', 'tag', 'number', 'str', num2str(MineNumber), 'pos', [50 10 30 20] ) ;
uicontrol( 'str', 'Sure', 'pos', [90 70 30 20],...
    'cal', ['RowNumber = str2num(get(findobj(''tag'', ''height''), ''str''));',...
        'ColNumber = str2num(get(findobj(''tag'', ''width''), ''str''));',...
        'MineNumber = str2num(get(findobj(''tag'', ''number''), ''str''));',...
        '[Msg, status] = Game_ClearMine( ''CheckDefineValid'', RowNumber, ColNumber, MineNumber);',...
        'if status==0,warndlg(Msg),end;',...
        'PassHandle = getappdata( gcf, ''PassHandle'' );',...
        'GameInfo.RowNumber=RowNumber;GameInfo.ColNumber=ColNumber;GameInfo.MineNumber=MineNumber;',...
        'setappdata( PassHandle, ''GameInfo'', GameInfo);',...   
        'close(gcf);',...
        'Game_ClearMine( ''init_FigureContent'', PassHandle );'] ) ;
uicontrol( 'str', 'Cancel', 'pos', [90 10 30 20], 'cal', 'close(gcf)' ) ;

movegui( FigureHandle, 'center' ) ;
set( FigureHandle, 'Visible', 'on' ) ;




% -------------------------------------------------------------------------
function  [Msg, status] = CheckDefineValid( RowNumber, ColNumber, MineNumber) 

status = 0 ;
Msg = '' ;
if isempty(RowNumber) | RowNumber <= 0 | length(RowNumber) > 1
    Msg = 'invalid height' ;
    return 
end

if isempty(ColNumber) | ColNumber <= 0 | length(ColNumber) > 1
    Msg = 'invalid width' ;
    return 
end

if isempty(MineNumber) | MineNumber <= 0 | length(MineNumber) > 1 
    Msg = 'invalid number' ;
    return 
end

if  RowNumber < 5 |  RowNumber > 20
    Msg = 'height shoud be 5~20 ' ;
    return 
end

if  ColNumber < 5 |  ColNumber > 40 
    Msg = 'width shoud be 5~40 ' ;
    return 
end

if  MineNumber >= ColNumber*RowNumber
    Msg = 'mines shoud be larger than boxes ' ;
    return 
end

status = 1 ;


% -------------------------------------------------------------------------
function Matrix = com_GetMineImage

Matrix = ones(21,21) * 0.75 ;
Matrix(6:15,6:15) = 0 ;
Matrix([5,16],8:13) = 0 ;
Matrix(8:13,[5,16]) = 0 ;
Matrix([4,17],10:11) = 0 ;
Matrix([10,11],4:17) = 0 ;
Matrix = repmat( Matrix, [1,1,3] ) ;


% -------------------------------------------------------------------------
function Matrix = com_GetFlagImage

Matrix = ones(21,21) * 0.75 ;
Matrix(4:18,9:10) = 1  ;
Matrix([5,9],11) = 1 ;
Matrix([6,8],[11:13]) = 1 ;
Matrix(7,10:15) = 1 ;

Matrix2 = Matrix ;
Matrix2(Matrix2 == 1) = 0 ;

Matrix(:,:,2) = Matrix2 ;
Matrix(:,:,3) = Matrix2 ;


% -------------------------------------------------------------------------
function Matrix = com_GetFaceImage( Type )

if strcmp( Type, 'Smile' )
    Matrix(:,:,1) = [[
            255   255   255   255   255   255   255   255   255   255   255   255   255
            255   255   255   255   255   255   255   255   255   255   255   255   255
            255   255   192   192   192   192   192   192   192   192   192   192   192
            255   255   192   192   192   192   192   192   192   192   192   192   192
            255   255   192   192   192   192   192   192   192   192     0     0     0
            255   255   192   192   192   192   192   192     0     0   255   255   255
            255   255   192   192   192   192   192     0   255   255   255   255   255
            255   255   192   192   192   192     0   255   255   255   255   255   255
            255   255   192   192   192     0   255   255   255   255   255   255   255
            255   255   192   192   192     0   255   255   255     0     0   255   255
            255   255   192   192     0   255   255   255   255     0     0   255   255
            255   255   192   192     0   255   255   255   255   255   255   255   255
            255   255   192   192     0   255   255   255   255   255   255   255   255
            255   255   192   192     0   255   255   255   255   255   255   255   255
            255   255   192   192     0   255   255   255     0   255   255   255   255
            255   255   192   192   192     0   255   255   255     0   255   255   255
            255   255   192   192   192     0   255   255   255   255     0     0     0
            255   255   192   192   192   192     0   255   255   255   255   255   255
            255   255   192   192   192   192   192     0   255   255   255   255   255
            255   255   192   192   192   192   192   192     0     0   255   255   255
            255   255   192   192   192   192   192   192   192   192     0     0     0
            255   255   192   192   192   192   192   192   192   192   192   192   192
            255   192   128   128   128   128   128   128   128   128   128   128   128
        ],  [
            255   255   255   255   255   255   255   255   255   255
            255   255   255   255   255   255   255   255   255   192
            192   192   192   192   192   192   192   192   192   128
            192   192   192   192   192   192   192   192   192   128
            0     0   192   192   192   192   192   192   192   128
            255   255     0     0   192   192   192   192   192   128
            255   255   255   255     0   192   192   192   192   128
            255   255   255   255   255     0   192   192   192   128
            255   255   255   255   255   255     0   192   192   128
            255     0     0   255   255   255     0   192   192   128
            255     0     0   255   255   255   255     0   192   128
            255   255   255   255   255   255   255     0   192   128
            255   255   255   255   255   255   255     0   192   128
            255   255   255   255   255   255   255     0   192   128
            255   255   255     0   255   255   255     0   192   128
            255   255     0   255   255   255     0   192   192   128
            0     0   255   255   255   255     0   192   192   128
            255   255   255   255   255     0   192   192   192   128
            255   255   255   255     0   192   192   192   192   128
            255   255     0     0   192   192   192   192   192   128
            0     0   192   192   192   192   192   192   192   128
            192   192   192   192   192   192   192   192   192   128
            128   128   128   128   128   128   128   128   128   128]];
    
    Matrix(:,:,2) = [[
            255   255   255   255   255   255   255   255   255   255   255   255   255
            255   255   255   255   255   255   255   255   255   255   255   255   255
            255   255   192   192   192   192   192   192   192   192   192   192   192
            255   255   192   192   192   192   192   192   192   192   192   192   192
            255   255   192   192   192   192   192   192   192   192     0     0     0
            255   255   192   192   192   192   192   192     0     0   255   255   255
            255   255   192   192   192   192   192     0   255   255   255   255   255
            255   255   192   192   192   192     0   255   255   255   255   255   255
            255   255   192   192   192     0   255   255   255   255   255   255   255
            255   255   192   192   192     0   255   255   255     0     0   255   255
            255   255   192   192     0   255   255   255   255     0     0   255   255
            255   255   192   192     0   255   255   255   255   255   255   255   255
            255   255   192   192     0   255   255   255   255   255   255   255   255
            255   255   192   192     0   255   255   255   255   255   255   255   255
            255   255   192   192     0   255   255   255     0   255   255   255   255
            255   255   192   192   192     0   255   255   255     0   255   255   255
            255   255   192   192   192     0   255   255   255   255     0     0     0
            255   255   192   192   192   192     0   255   255   255   255   255   255
            255   255   192   192   192   192   192     0   255   255   255   255   255
            255   255   192   192   192   192   192   192     0     0   255   255   255
            255   255   192   192   192   192   192   192   192   192     0     0     0
            255   255   192   192   192   192   192   192   192   192   192   192   192
            255   192   128   128   128   128   128   128   128   128   128   128   128
        ],[
            255   255   255   255   255   255   255   255   255   255
            255   255   255   255   255   255   255   255   255   192
            192   192   192   192   192   192   192   192   192   128
            192   192   192   192   192   192   192   192   192   128
            0     0   192   192   192   192   192   192   192   128
            255   255     0     0   192   192   192   192   192   128
            255   255   255   255     0   192   192   192   192   128
            255   255   255   255   255     0   192   192   192   128
            255   255   255   255   255   255     0   192   192   128
            255     0     0   255   255   255     0   192   192   128
            255     0     0   255   255   255   255     0   192   128
            255   255   255   255   255   255   255     0   192   128
            255   255   255   255   255   255   255     0   192   128
            255   255   255   255   255   255   255     0   192   128
            255   255   255     0   255   255   255     0   192   128
            255   255     0   255   255   255     0   192   192   128
            0     0   255   255   255   255     0   192   192   128
            255   255   255   255   255     0   192   192   192   128
            255   255   255   255     0   192   192   192   192   128
            255   255     0     0   192   192   192   192   192   128
            0     0   192   192   192   192   192   192   192   128
            192   192   192   192   192   192   192   192   192   128
            128   128   128   128   128   128   128   128   128   128
        ]];
    
    Matrix(:,:,3) = [[
            255   255   255   255   255   255   255   255   255   255   255   255   255
            255   255   255   255   255   255   255   255   255   255   255   255   255
            255   255   192   192   192   192   192   192   192   192   192   192   192
            255   255   192   192   192   192   192   192   192   192   192   192   192
            255   255   192   192   192   192   192   192   192   192     0     0     0
            255   255   192   192   192   192   192   192     0     0     0     0     0
            255   255   192   192   192   192   192     0     0     0     0     0     0
            255   255   192   192   192   192     0     0     0     0     0     0     0
            255   255   192   192   192     0     0     0     0     0     0     0     0
            255   255   192   192   192     0     0     0     0     0     0     0     0
            255   255   192   192     0     0     0     0     0     0     0     0     0
            255   255   192   192     0     0     0     0     0     0     0     0     0
            255   255   192   192     0     0     0     0     0     0     0     0     0
            255   255   192   192     0     0     0     0     0     0     0     0     0
            255   255   192   192     0     0     0     0     0     0     0     0     0
            255   255   192   192   192     0     0     0     0     0     0     0     0
            255   255   192   192   192     0     0     0     0     0     0     0     0
            255   255   192   192   192   192     0     0     0     0     0     0     0
            255   255   192   192   192   192   192     0     0     0     0     0     0
            255   255   192   192   192   192   192   192     0     0     0     0     0
            255   255   192   192   192   192   192   192   192   192     0     0     0
            255   255   192   192   192   192   192   192   192   192   192   192   192
            255   192   128   128   128   128   128   128   128   128   128   128   128
        ],[
            255   255   255   255   255   255   255   255   255   255
            255   255   255   255   255   255   255   255   255   192
            192   192   192   192   192   192   192   192   192   128
            192   192   192   192   192   192   192   192   192   128
            0     0   192   192   192   192   192   192   192   128
            0     0     0     0   192   192   192   192   192   128
            0     0     0     0     0   192   192   192   192   128
            0     0     0     0     0     0   192   192   192   128
            0     0     0     0     0     0     0   192   192   128
            0     0     0     0     0     0     0   192   192   128
            0     0     0     0     0     0     0     0   192   128
            0     0     0     0     0     0     0     0   192   128
            0     0     0     0     0     0     0     0   192   128
            0     0     0     0     0     0     0     0   192   128
            0     0     0     0     0     0     0     0   192   128
            0     0     0     0     0     0     0   192   192   128
            0     0     0     0     0     0     0   192   192   128
            0     0     0     0     0     0   192   192   192   128
            0     0     0     0     0   192   192   192   192   128
            0     0     0     0   192   192   192   192   192   128
            0     0   192   192   192   192   192   192   192   128
            192   192   192   192   192   192   192   192   192   128
            128   128   128   128   128   128   128   128   128   128
        ]];
else % Cry
    Matrix(:,:,1) = [[
            128   128   128   128   128   128   128   128   128   128   128   128   128
            128   255   255   255   255   255   255   255   255   255   255   255   255
            128   255   255   255   255   255   255   255   255   255   255   255   255
            128   255   255   192   192   192   192   192   192   192   192   192   192
            128   255   255   192   192   192   192   192   192   192   192   192   192
            128   255   255   192   192   192   192   192   192   192   192     0     0
            128   255   255   192   192   192   192   192   192     0     0   255   255
            128   255   255   192   192   192   192   192     0   255   255   255   255
            128   255   255   192   192   192   192     0   255   255   255   255   255
            128   255   255   192   192   192     0   255   255     0   255     0   255
            128   255   255   192   192   192     0   255   255   255     0   255   255
            128   255   255   192   192     0   255   255   255     0   255     0   255
            128   255   255   192   192     0   255   255   255   255   255   255   255
            128   255   255   192   192     0   255   255   255   255   255   255   255
            128   255   255   192   192     0   255   255   255   255   255   255   255
            128   255   255   192   192     0   255   255   255   255   255     0     0
            128   255   255   192   192   192     0   255   255   255     0   255   255
            128   255   255   192   192   192     0   255   255     0   255   255   255
            128   255   255   192   192   192   192     0   255   255   255   255   255
            128   255   255   192   192   192   192   192     0   255   255   255   255
            128   255   255   192   192   192   192   192   192     0     0   255   255
            128   255   255   192   192   192   192   192   192   192   192     0     0
            128   255   255   192   192   192   192   192   192   192   192   192   192
        ],[
            128   128   128   128   128   128   128   128   128   128   128   128
            255   255   255   255   255   255   255   255   255   255   255   192
            255   255   255   255   255   255   255   255   255   255   192   128
            192   192   192   192   192   192   192   192   192   192   128   128
            192   192   192   192   192   192   192   192   192   192   128   128
            0     0     0   192   192   192   192   192   192   192   128   128
            255   255   255     0     0   192   192   192   192   192   128   128
            255   255   255   255   255     0   192   192   192   192   128   128
            255   255   255   255   255   255     0   192   192   192   128   128
            255   255     0   255     0   255   255     0   192   192   128   128
            255   255   255     0   255   255   255     0   192   192   128   128
            255   255     0   255     0   255   255   255     0   192   128   128
            255   255   255   255   255   255   255   255     0   192   128   128
            255   255   255   255   255   255   255   255     0   192   128   128
            255   255   255   255   255   255   255   255     0   192   128   128
            0     0     0   255   255   255   255   255     0   192   128   128
            255   255   255     0   255   255   255     0   192   192   128   128
            255   255   255   255     0   255   255     0   192   192   128   128
            255   255   255   255   255   255     0   192   192   192   128   128
            255   255   255   255   255     0   192   192   192   192   128   128
            255   255   255     0     0   192   192   192   192   192   128   128
            0     0     0   192   192   192   192   192   192   192   128   128
            192   192   192   192   192   192   192   192   192   192   128   128
        ]] ;
    Matrix(:,:,2) = [[
            128   128   128   128   128   128   128   128   128   128   128   128   128
            128   255   255   255   255   255   255   255   255   255   255   255   255
            128   255   255   255   255   255   255   255   255   255   255   255   255
            128   255   255   192   192   192   192   192   192   192   192   192   192
            128   255   255   192   192   192   192   192   192   192   192   192   192
            128   255   255   192   192   192   192   192   192   192   192     0     0
            128   255   255   192   192   192   192   192   192     0     0   255   255
            128   255   255   192   192   192   192   192     0   255   255   255   255
            128   255   255   192   192   192   192     0   255   255   255   255   255
            128   255   255   192   192   192     0   255   255     0   255     0   255
            128   255   255   192   192   192     0   255   255   255     0   255   255
            128   255   255   192   192     0   255   255   255     0   255     0   255
            128   255   255   192   192     0   255   255   255   255   255   255   255
            128   255   255   192   192     0   255   255   255   255   255   255   255
            128   255   255   192   192     0   255   255   255   255   255   255   255
            128   255   255   192   192     0   255   255   255   255   255     0     0
            128   255   255   192   192   192     0   255   255   255     0   255   255
            128   255   255   192   192   192     0   255   255     0   255   255   255
            128   255   255   192   192   192   192     0   255   255   255   255   255
            128   255   255   192   192   192   192   192     0   255   255   255   255
            128   255   255   192   192   192   192   192   192     0     0   255   255
            128   255   255   192   192   192   192   192   192   192   192     0     0
            128   255   255   192   192   192   192   192   192   192   192   192   192
        ],[
            128   128   128   128   128   128   128   128   128   128   128   128
            255   255   255   255   255   255   255   255   255   255   255   192
            255   255   255   255   255   255   255   255   255   255   192   128
            192   192   192   192   192   192   192   192   192   192   128   128
            192   192   192   192   192   192   192   192   192   192   128   128
            0     0     0   192   192   192   192   192   192   192   128   128
            255   255   255     0     0   192   192   192   192   192   128   128
            255   255   255   255   255     0   192   192   192   192   128   128
            255   255   255   255   255   255     0   192   192   192   128   128
            255   255     0   255     0   255   255     0   192   192   128   128
            255   255   255     0   255   255   255     0   192   192   128   128
            255   255     0   255     0   255   255   255     0   192   128   128
            255   255   255   255   255   255   255   255     0   192   128   128
            255   255   255   255   255   255   255   255     0   192   128   128
            255   255   255   255   255   255   255   255     0   192   128   128
            0     0     0   255   255   255   255   255     0   192   128   128
            255   255   255     0   255   255   255     0   192   192   128   128
            255   255   255   255     0   255   255     0   192   192   128   128
            255   255   255   255   255   255     0   192   192   192   128   128
            255   255   255   255   255     0   192   192   192   192   128   128
            255   255   255     0     0   192   192   192   192   192   128   128
            0     0     0   192   192   192   192   192   192   192   128   128
            192   192   192   192   192   192   192   192   192   192   128   128
        ]] ;
    Matrix(:,:,3) = [[
            128   128   128   128   128   128   128   128   128   128   128   128   128
            128   255   255   255   255   255   255   255   255   255   255   255   255
            128   255   255   255   255   255   255   255   255   255   255   255   255
            128   255   255   192   192   192   192   192   192   192   192   192   192
            128   255   255   192   192   192   192   192   192   192   192   192   192
            128   255   255   192   192   192   192   192   192   192   192     0     0
            128   255   255   192   192   192   192   192   192     0     0     0     0
            128   255   255   192   192   192   192   192     0     0     0     0     0
            128   255   255   192   192   192   192     0     0     0     0     0     0
            128   255   255   192   192   192     0     0     0     0     0     0     0
            128   255   255   192   192   192     0     0     0     0     0     0     0
            128   255   255   192   192     0     0     0     0     0     0     0     0
            128   255   255   192   192     0     0     0     0     0     0     0     0
            128   255   255   192   192     0     0     0     0     0     0     0     0
            128   255   255   192   192     0     0     0     0     0     0     0     0
            128   255   255   192   192     0     0     0     0     0     0     0     0
            128   255   255   192   192   192     0     0     0     0     0     0     0
            128   255   255   192   192   192     0     0     0     0     0     0     0
            128   255   255   192   192   192   192     0     0     0     0     0     0
            128   255   255   192   192   192   192   192     0     0     0     0     0
            128   255   255   192   192   192   192   192   192     0     0     0     0
            128   255   255   192   192   192   192   192   192   192   192     0     0
            128   255   255   192   192   192   192   192   192   192   192   192   192
        ],[
            128   128   128   128   128   128   128   128   128   128   128   128
            255   255   255   255   255   255   255   255   255   255   255   192
            255   255   255   255   255   255   255   255   255   255   192   128
            192   192   192   192   192   192   192   192   192   192   128   128
            192   192   192   192   192   192   192   192   192   192   128   128
            0     0     0   192   192   192   192   192   192   192   128   128
            0     0     0     0     0   192   192   192   192   192   128   128
            0     0     0     0     0     0   192   192   192   192   128   128
            0     0     0     0     0     0     0   192   192   192   128   128
            0     0     0     0     0     0     0     0   192   192   128   128
            0     0     0     0     0     0     0     0   192   192   128   128
            0     0     0     0     0     0     0     0     0   192   128   128
            0     0     0     0     0     0     0     0     0   192   128   128
            0     0     0     0     0     0     0     0     0   192   128   128
            0     0     0     0     0     0     0     0     0   192   128   128
            0     0     0     0     0     0     0     0     0   192   128   128
            0     0     0     0     0     0     0     0   192   192   128   128
            0     0     0     0     0     0     0     0   192   192   128   128
            0     0     0     0     0     0     0   192   192   192   128   128
            0     0     0     0     0     0   192   192   192   192   128   128
            0     0     0     0     0   192   192   192   192   192   128   128
            0     0     0   192   192   192   192   192   192   192   128   128
            192   192   192   192   192   192   192   192   192   192   128   128
        ]] ;
end

% -------------------------------------------------------------------------
function Keypress_fcn( h )

handles = guidata( h ) ;

CurrentKey = get( handles.ClearMine, 'CurrentKey' ) ;
CurrentCharacter = get( handles.ClearMine, 'CurrentCharacter' ) ;

if strcmp(CurrentKey, 'f2')
    BeginMenu_Callback( handles.ClearMine ) ;
elseif  strcmp(CurrentKey, 'return')
    if strcmp( CurrentCharacter, char(10))
        GameIsBegin = getappdata( handles.ClearMine, 'GameIsBegin' ) ;        
        if isempty( GameIsBegin )
            return ;    
        end        
        MineNumberArray = getappdata( handles.ClearMine, 'MineNumberArray' ) ;
        if isempty(MineNumberArray)
            return ;
        end
        
        setappdata( handles.ClearMine, 'GameOver', 1 ) ;
        ButtonHandles = getappdata( handles.ClearMine, 'ButtonHandles' ) ;  
        set( ButtonHandles, 'Enable', 'inactive' ) ;
        
        UsefulIndex = getappdata( handles.ClearMine, 'UsefulIndex' ) ;            
        Matrix = com_GetMineImage ;            
        set( ButtonHandles(UsefulIndex), 'CData', Matrix );
        
        ZeroIndex = find( MineNumberArray == 0 ) ;
        set( ButtonHandles(ZeroIndex), 'String', '', 'Style', 'text', 'BackgroundColor', [0.85 0.85 0.85]) ;
        
        ColorArray = 'bgrcmykbg' ;
        for num = 1: max(max(MineNumberArray))
            TempIndex = find(MineNumberArray == num) ;
            if ~isempty(TempIndex)            
                set( ButtonHandles(TempIndex), 'String', num2str(num), 'Style', 'text',...
                    'ForeGroundColor', ColorArray(num), 'BackgroundColor', [0.85 0.85 0.85] ) ;
            end
        end
    end
else 
    return 
end