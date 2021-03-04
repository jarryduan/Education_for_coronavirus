function snake
    axis equal
    len=40;
    axis(0.5+[0,len,0,len])
    set(gca,'xtick',[],'ytick',[],'xcolor','w','ycolor','w')
    set(gca,'color','k')
    hold on
    %axis set..........................................................................
    snaketop=[5,5;4.5,5];
    body=[5,5;4.5,5;4,5;3.5,5;3,5;2.5,5];
    food=[10,10];
    direction=[1,0];
    long=3;
    plotsnake=scatter(gca,body(:,1),body(:,2),120,'w','filled');
    plotfood=scatter(gca,food(1),food(2),120,'w','filled');
    %snake and food begining set.......................................................
    set(gcf,'WindowButtonMotionFcn',@snakefcn)                                                  
    fps = 8;                                    
    game = timer('ExecutionMode', 'FixedRate', 'Period',1/fps, 'TimerFcn', @snakegame);
    start(game) 
    %..................................................................................
    
set(gcf,'tag','co','CloseRequestFcn',@clo);
    function clo(~,~)
        stop(game)
        delete(findobj('tag','co'));
        clf
        close
    end 
    function snakegame(~,~)
        snaketop=[body(1,:)+direction;body(1,:)+1/2*direction];
        snaketop(snaketop>len)=snaketop(snaketop>len)-len;
        snaketop(snaketop<1)=snaketop(snaketop<1)+len;
        %if you want snake through the wall,dlete the'%'in the front two lines.
        %and add '%' at the beginings of every line in'dead of hitting the wall.
        body=[snaketop;body];
        while length(body)>long
            body(end,:)=[];
            body(end,:)=[];
        end
    %body of snake moves automatic..........................
        if (snaketop(1,1)-food(1))^2+(snaketop(1,2)-food(2))^2<1           
            long = long + 2;                   
            food = randi(len, [1, 2]); 
            while any(ismember(body, food, 'rows'))
                food = randi(len, [1, 2]);
            end
        end
    %food postion setting....................................    
   
    set(plotfood,'XData',food(1),'YData',food(2))
    set(plotsnake,'XData',body(:,1),'YData',body(:,2))  
    end
    function snakefcn(~,~)
        xy=get(gca,'CurrentPoint');
        x=xy(1,1);y=xy(1,2);
        dir=[x-body(1,1),y-body(1,2)];
        dis=sqrt((x-body(1,1))^2+(y-body(1,2))^2);
        direction=dir/dis;
    end
end
% 版权声明：本文为CSDN博主「slandarer」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
% 原文链接：https://blog.csdn.net/slandarer/java/article/details/87996177