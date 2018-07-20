function [ C_dim, C_shift, C_align_v, im, map, alpha ] = Cursor(Mode_cursor, Mode_visual, xwidth, yheight, xpos, ypos)
% Cursor --> Cursor choice information for display
%   C_Dim = Cursor width and height
%   C_shift = Shift x and y to have the point of interest of the image
%   aligned with the target
%   C_align_v = center the cursor according to the visual display

if strcmp(Mode_visual,'3D') == 1
    C_dim = [0 0];
    C_shift = [0 0];
    C_align_v = [0 0];
    im = [];
    map = [];
    alpha = [];    
end  

if strcmp(Mode_cursor,'Line') == 1
    C_shift = [0 0];
    C_align_v = [0 0];
    im = [];
    map = [];
    alpha = [];
    if strcmp(Mode_visual,'Vertical') == 1
        C_dim = [xwidth 0];
    elseif strcmp(Mode_visual,'Horizontal') == 1
        C_dim = [0 yheight];
    elseif strcmp(Mode_visual,'2D') == 1
        C_dim = [0 0];
    end  

elseif strcmp(Mode_cursor,'Arrow') == 1
    [im, map, alpha] = imread('Arrow.png');
    if strcmp(Mode_visual,'Vertical') == 1
        Scale = size(im,2)/(xwidth/4);
        C_dim = [xwidth/4 (size(im,1)/Scale)];
        C_align_v = [xpos+xwidth/2 -(size(im,1)/Scale)];
        C_shift = [0 0];
        % I = image(flipud(im),'XData',[C_align_v(1) C_align_v(1)+C_dim(1)],'YData',...
        %          [1+C_align_v(2) 1+C_dim(2)+C_align_v(2) ], 'AlphaData', flipud(alpha));
    
    elseif strcmp(Mode_visual,'Horizontal') == 1
        Scale = size(im,1)/(yheight/2);
        C_dim = [size(im,2)/Scale yheight/2];
        C_align_v = [0 ypos+(yheight/4)];
        C_shift = [-0.1 0];        
        % I = image(flipud(im),'XData',[0+C_shift(1)+C_align_v(1) 0+C_shift(1)+C_align_v(1)+C_dim(1)],'YData',...
        %     [C_align_v(2)+C_shift(2) C_align_v(2)+C_shift(2)+C_dim(2)], 'AlphaData', flipud(alpha));
    
    elseif strcmp(Mode_visual,'2D') == 1
        Scale = size(im,2)/(10/4);
        C_dim = [10/4 (size(im,1)/Scale)];
        C_align_v = [0 -(size(im,1)/Scale)];
        C_shift = [-0.1 0];
        % I = image(flipud(im),'XData',[Displacement(1)+C_shift(1)+C_align_v(1) Displacement(1)+C_shift(1)+C_align_v(1)+C_dim(1)],'YData',...
        %     [Displacement(2)+C_align_v(2)+C_shift(2) Displacement(2)+C_align_v(2)+C_shift(2)+C_dim(2)], 'AlphaData', flipud(alpha));
    end

elseif strcmp(Mode_cursor,'Hand_L') == 1
    [im, map, alpha] = imread('Hand.png');
    if strcmp(Mode_visual,'Vertical') == 1
        Scale = size(im,2)/(xwidth/2);
        C_dim = [xwidth/2 (size(im,1)/Scale)];
        C_align_v = [xpos+xwidth/10 -(size(im,1)/Scale)];
        C_shift = [0 0];
        % I = image(flipud(im),'XData',[C_align_v(1) C_align_v(1)+C_dim(1)],'YData',...
        %          [1+C_align_v(2) 1+C_dim(2)+C_align_v(2) ], 'AlphaData', flipud(alpha));

    elseif strcmp(Mode_visual,'Horizontal') == 1
        Scale = size(im,1)/(yheight/2);
        C_dim = [size(im,2)/Scale yheight/2];
        C_align_v = [0 ypos+(yheight/4)];
        C_shift = [-size(im,2)/Scale 0];        
        % I = image(flipud(im),'XData',[0+C_shift(1)+C_align_v(1) 0+C_shift(1)+C_align_v(1)+C_dim(1)],'YData',...
        %     [C_align_v(2)+C_shift(2) C_align_v(2)+C_shift(2)+C_dim(2)], 'AlphaData', flipud(alpha));

    elseif strcmp(Mode_visual,'2D') == 1
        Scale = size(im,1)/(10/2);
        C_dim = [size(im,2)/Scale 10/2];
        C_align_v = [0 -(size(im,1)/Scale)];
        C_shift = [-size(im,2)/Scale 0];
        % I = image(flipud(im),'XData',[Displacement(1)+C_shift(1)+C_align_v(1) Displacement(1)+C_shift(1)+C_align_v(1)+C_dim(1)],'YData',...
        %     [Displacement(2)+C_align_v(2)+C_shift(2) Displacement(2)+C_align_v(2)+C_shift(2)+C_dim(2)], 'AlphaData', flipud(alpha));
        % plot(Displacement(1),Displacement(2),'r*','MarkerSize',18);
    end 

elseif strcmp(Mode_cursor,'Surgery') == 1
    [im, map, alpha] = imread('Instrument.png');
    if strcmp(Mode_visual,'Vertical') == 1
        Scale = size(im,2)/(xwidth/4);
        C_dim = [xwidth/4 (size(im,1)/Scale)];
        C_align_v = [xpos+xwidth/4 -(size(im,1)/Scale)];
        C_shift = [0.4 -0.1];
        % I = image(flipud(im),'XData',[C_align_v(1) C_align_v(1)+C_dim(1)],'YData',...
        %          [1+C_align_v(2) 1+C_dim(2)+C_align_v(2) ], 'AlphaData', flipud(alpha));

    elseif strcmp(Mode_visual,'Horizontal') == 1
        Scale = size(im,1)/(yheight);
        C_dim = [size(im,2)/Scale yheight];
        C_align_v = [0 ypos];
        C_shift = [-size(im,2)/Scale 0]; 
        % I = image(flipud(im),'XData',[0+C_shift(1)+C_align_v(1) 0+C_shift(1)+C_align_v(1)+C_dim(1)],'YData',...
        %     [C_align_v(2)+C_shift(2) C_align_v(2)+C_shift(2)+C_dim(2)], 'AlphaData', flipud(alpha));
    
    elseif strcmp(Mode_visual,'2D') == 1
        Scale = size(im,1)/10;
        C_dim = [size(im,2)/Scale 10];
        C_align_v = [0 0];
        C_shift = [-size(im,2)/Scale+0.1 -(size(im,1)/Scale)+0.1];
        % I = image(flipud(im),'XData',[Displacement(1)+C_shift(1)+C_align_v(1) Displacement(1)+C_shift(1)+C_align_v(1)+C_dim(1)],'YData',...
        %     [Displacement(2)+C_align_v(2)+C_shift(2) Displacement(2)+C_align_v(2)+C_shift(2)+C_dim(2)], 'AlphaData', flipud(alpha));
        % plot(Displacement(1),Displacement(2),'r*','MarkerSize',18);
    end 
end

end


