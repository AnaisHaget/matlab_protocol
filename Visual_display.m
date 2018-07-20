function [ypos, xpos, yheight, xwidth] = Visual_display(Mode_visual)
% Visual_display --> Generate the interface visual display
% Mode visual
% axislim = [xlmin xlmax ylmin ylmax] 
% limit screen display :ylmin = 0; ylmax = 60; xlmin = 0; xlmax = 60; 
axislim = [-1 61 -1 70];
Color_Face = [175,238,238]./255;
Color_Edge = [0,206,209]./255;
Color_Edge2 = [0,139,139]./255;
set(gcf, 'renderer', 'painters');
if strcmp(Mode_visual,'Horizontal') == 1
    % Dimension interface/rectangle display 
    ypos = 25; xpos = 0; yheight = 10; xwidth = 60;

    % Plot interface
    %f1 = figure();
    hold on; axis off;
    axis(axislim); 
    set(gcf, 'color', 'white'), set(gca, 'fontsize', 12,'box', 'off'); 
    r = rectangle('Position', [xpos ypos xwidth yheight], 'FaceColor',...
        Color_Face,'EdgeColor',Color_Edge,'LineWidth',3);

elseif strcmp(Mode_visual,'Vertical') == 1
    % Dimension interface/rectangle display 
    ypos = 0; xpos = 25; yheight = 60; xwidth = 10;

    % Plot interface
    %f1 = figure();
    hold on; axis off;
    axis(axislim); 
    set(gcf, 'color', 'white'), set(gca, 'fontsize', 12,'box', 'off'); 

    r = rectangle('Position', [xpos ypos xwidth yheight], 'FaceColor',...
        Color_Face,'EdgeColor',Color_Edge,'LineWidth',3);

elseif strcmp(Mode_visual,'2D') == 1
    % Dimension interface/rectangle display 
    ypos = 0; xpos = 0; yheight = 60; xwidth = 60;

    % Plot interface
    %f1 = figure();
    hold on; axis off;
    axis(axislim); 
    set(gcf, 'color', 'white'), set(gca, 'fontsize', 12,'box', 'off'); 

    r = rectangle('Position', [xpos ypos xwidth yheight], 'FaceColor',...
        Color_Face,'EdgeColor',Color_Edge,'LineWidth',3);

elseif strcmp(Mode_visual,'3D') == 1
    % Dimension interface/rectangle display 
    axislim = [axislim -1 61];
    ypos = 0; xpos = 0; yheight = 60; xwidth = 60;

    % Plot interface
    % f1 = figure();
    hold on; axis on;
    axis(axislim); 
    grid on; grid minor; view(55,35);
    set(gcf, 'color', 'white'), set(gca, 'fontsize', 12,'box', 'off'); 
    set(gca,'Xticklabel',[],'Yticklabel',[],'Zticklabel',[])
    set(gca, 'XColor',Color_Edge2, 'YColor', Color_Edge2,'ZColor', Color_Edge2);
end

end

