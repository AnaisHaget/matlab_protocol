function [Count_Down] = CountDown(Duration_Pause, t_reach, Epsilon_time, x, y)
% % Static Pause

Count_Down = text(x -1, y+5,num2str(10),'Color',[25,25,112]./255,'FontWeight','Bold','FontSize',20);
t=1;
for startnum = 9:-1:0
    disp(startnum)
    disp(abs(etime(clock,t_reach)-(t*Duration_Pause/10)))
    disp(t*Duration_Pause/10)
    if (etime(clock,t_reach) >= t*Duration_Pause/10)
        set(Count_Down, 'String', num2str(startnum));
        t = t+1;
    end
end
% while startnum >= 0
%     set(Count_Down, 'String', num2str(startnum)); 
%     pause(Duration_Pause/10)             
%     startnum = startnum - 1;          
% end
% set(Count_Down,'Visible','off');
end

