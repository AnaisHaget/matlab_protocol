function [C] = Display_Cursor( Displacement, Mode_visual, Mode_cursor, xpos, xwidth, ypos, yheight )
% Display the cursor 

if strcmp(Mode_cursor,'Line') == 1
    if strcmp(Mode_visual, 'Vertical') == 1
        C = plot([xpos xpos+xwidth],[Displacement(1) Displacement(1)],'k','LineWidth',3);
    elseif strcmp(Mode_visual, 'Horizontal') == 1
        C = plot([Displacement(1) Displacement(1)],[ypos ypos+yheight],'k','LineWidth',3);
    elseif strcmp(Mode_visual, '2D') == 1
        C = plot(Displacement(1),Displacement(2),'k*','LineWidth',2,'MarkerSize',18);
    elseif strcmp(Mode_visual,'3D') == 1
        C = plot3(Displacement(1),Displacement(2),Displacement(3),'k*','MarkerSize',15,'LineWidth',1);
    end

    
elseif strcmp(Mode_cursor,'Line') == 0
    [ C_dim, C_shift, C_align_v, im, map, alpha ] = Cursor(Mode_cursor, Mode_visual, xwidth, yheight, xpos, ypos);
    if strcmp(Mode_visual, 'Vertical') == 1
        C = image(flipud(im),'XData',...
             [C_align_v(1)+C_shift(1) C_align_v(1)+C_dim(1)+C_shift(1)],...
             'YData',...
             [Displacement(1)+C_align_v(2)+C_shift(2) Displacement(1)+C_dim(2)+C_align_v(2)+C_shift(2)],...
             'AlphaData', flipud(alpha));    
         
    elseif strcmp(Mode_visual, 'Horizontal') == 1
        C = image(flipud(im),'XData',...
             [C_align_v(1)+C_shift(1)+Displacement(1) C_align_v(1)+C_dim(1)+C_shift(1)+Displacement(1)],...
             'YData',...
             [C_align_v(2)+C_shift(2) C_dim(2)+C_align_v(2)+C_shift(2)],...
             'AlphaData', flipud(alpha));    
    elseif strcmp(Mode_visual, '2D') == 1
        C = image(flipud(im),'XData',...
             [Displacement(1)+C_align_v(1)+C_shift(1) Displacement(1)+C_align_v(1)+C_dim(1)+C_shift(1)],...
             'YData',...
             [Displacement(2)+C_align_v(2)+C_shift(2) Displacement(2)+C_dim(2)+C_align_v(2)+C_shift(2)],...
             'AlphaData', flipud(alpha));
    end
end
end

