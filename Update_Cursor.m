function Update_Cursor(Mode_Visual, Mode_Cursor, C, Displacement, C_dim, C_shift, C_align_v)
% Update_Cursor --> displace the cursor of the figure
if strcmp(Mode_Cursor,'Line') == 1
    if strcmp(Mode_Visual,'Vertical') == 1
        set(C,'YData',[Displacement(1) Displacement(1)]);
    elseif strcmp(Mode_Visual,'Horizontal') == 1
        set(C,'XData',[Displacement(1) Displacement(1)]);
    elseif strcmp(Mode_Visual,'2D') == 1
        set(C,'XData',Displacement(1),'YData',Displacement(2));
    elseif strcmp(Mode_Visual,'3D') == 1
        set(C,'XData',Displacement(1),'YData',Displacement(2), 'ZData',Displacement(3));
    end

elseif strcmp(Mode_Cursor,'Line') == 0
    if strcmp(Mode_Visual,'Vertical') == 1
        set(C, 'YData',[C_align_v(2)+C_shift(2)+Displacement(1) C_shift(2)+C_align_v(2)+C_dim(2)+Displacement(1)]);
    elseif strcmp(Mode_Visual,'Horizontal') == 1
        set(C, 'XData',[C_align_v(1)+C_shift(1)+Displacement(1) C_shift(1)+C_align_v(1)+C_dim(1)+Displacement(1)]);
    elseif strcmp(Mode_Visual,'2D') == 1
        set(C, 'XData',[C_align_v(1)+C_shift(1)+Displacement(1) C_shift(1)+C_align_v(1)+C_dim(1)+Displacement(1)],...
            'YData',[C_align_v(2)+C_shift(2)+Displacement(2) C_shift(2)+C_align_v(2)+C_dim(2)+Displacement(2)]);
    end
end
drawnow;

end

