function [ Pos_Last2Targets ] = Current_Target( Mode_visual, Pos_Targets, Current )
%Current_Target --> return the positions of the target the user just reached
% and the previous target

if Current == 1
    if (strcmp(Mode_visual, 'Horizontal') == 1) || (strcmp(Mode_visual, 'Vertical') == 1)
        Pos_Last2Targets(1) = [0 0 0];
        Pos_Last2Targets(2) = Pos_Targets(:,Current);
    
    elseif strcmp(Mode_visual, '2D') == 1
        Pos_Last2Targets(:,1) = [0 0 0];
        Pos_Last2Targets(:,2) = Pos_Targets(:,Current);
    
    elseif strcmp(Mode_visual, '3D') == 1
        Pos_Last2Targets(:,1) = [0 0 0];
        Pos_Last2Targets(:,2) = Pos_Targets(:,Current);
    end
else
    Pos_Last2Targets(:,1) = Pos_Targets(:,Current-1);
    Pos_Last2Targets(:,2) = Pos_Targets(:,Current);    
end
 
end

