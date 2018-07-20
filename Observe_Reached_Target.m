function [Reached_text, x, y] = Observe_Reached_Target( Mode_visual, T, Duration_Pause, Reached_text)
% [Reached_text, x, y] = Observe_Reached_Target( Mode_visual, T)
% Reach_Target_Color --> Display info to inform the user he reached the
% target:
% Change of color
% Text message

set(T,'Color','r');

Tx = get(T,'XData');
Ty = get(T,'YData');
if (strcmp(Mode_visual, 'Horizontal') == 1) || (strcmp(Mode_visual, 'Vertical') == 1)
    y = Ty(2);
    x = (Tx(1)+Tx(2))/2;

elseif strcmp(Mode_visual, '2D') == 1
    y = Ty;
    x = Tx;
end

set(Reached_text,'Position',[19,y+10]);
set(Reached_text,'Visible','on');
% Reached_text = text(19,y+10,' !! Target Reached !!','Color','r','FontWeight','Bold','FontSize',16);

% Static Pause
% startnum = 10; % Our starting number
% Count_Down = text(x -1, y+5,num2str(startnum),'Color',[25,25,112]./255,'FontWeight','Bold','FontSize',20);
% while startnum >= 0
%     set(Count_Down, 'String', num2str(startnum)); 
%     pause(Duration_Pause/10)             
%     startnum = startnum - 1;          
% end
% set(Count_Down,'Visible','off');
% set(Reached_text,'Visible','off');
end

