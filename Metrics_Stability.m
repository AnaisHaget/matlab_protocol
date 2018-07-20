function [ Stability.Absolute, Stability.Relative] = Metrics_Stability( Mode_visual, Displacement_static, Pos_Last2Targets )
% Metrics_Velocity --> Return the mean velociy to reach a target

if (strcmp(Mode_visual, 'Horizontal') == 1) || (strcmp(Mode_visual, 'Vertical') == 1)
    Stability.Absolute = std(Displacement_static(1,:)); 
    Stability.Relative = mean(Displacement_static(1,:)-Pos_Last2Targets(1,2)); 

elseif strcmp(Mode_visual, '2D') == 1
    Stability.Absolute = [std(Displacement_static(1,:)) std(Displacement_static(2,:))]; 
    Stability.Relative = [mean(Displacement_static(1,:)-Pos_Last2Targets(1,2)) mean(Displacement_static(2,:)-Pos_Last2Targets(2,2))];   

elseif strcmp(Mode_visual, '3D') == 1
   Stability.Absolute = [std(Displacement_static(1,:)) std(Displacement_static(2,:)) std(Displacement_static(3,:))];  
   Stability.Relative = [mean(Displacement_static(1,:)-Pos_Last2Targets(1,2)) mean(Displacement_static(2,:)-Pos_Last2Targets(2,2)) mean(Displacement_static(3,:)-Pos_Last2Targets(3,2))]; 
end

end

