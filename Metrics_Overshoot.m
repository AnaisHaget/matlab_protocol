function [ Overshoot.Max, Overshoot.Begin] = Metrics_Overshoot( Mode_visual, Displacement_static, Pos_Last2Targets, begin )
% Metrics_Velocity --> Return the mean velociy to reach a target

if (strcmp(Mode_visual, 'Horizontal') == 1) || (strcmp(Mode_visual, 'Vertical') == 1)
    Overshoot.Max = max(abs(Displacement_static(1,:) -Pos_Last2Targets(1,2))); 
    Overshoot.Begin = max(abs(Displacement_static(1:begin,:) -Pos_Last2Targets(1,2))); 

elseif strcmp(Mode_visual, '2D') == 1
    Overshoot.Max = [max(abs(Displacement_static(1,:)-Pos_Last2Targets(1,2))) max(abs(Displacement_static(2,:)-Pos_Last2Targets(2,2)))]; 
    Overshoot.Begin = [max(abs(Displacement_static(1,1:begin)-Pos_Last2Targets(1,2))) max(abs(Displacement_static(2,1:begin)-Pos_Last2Targets(2,2)))];   

elseif strcmp(Mode_visual, '3D') == 1
   Overshoot.Max = [max(abs(Displacement_static(1,:)-Pos_Last2Targets(1,2))) max(abs(Displacement_static(2,:)-Pos_Last2Targets(2,2))) max(abs(Displacement_static(3,:)-Pos_Last2Targets(3,2)))];  
   Overshoot.Begin = [max(abs(Displacement_static(1,1:begin)-Pos_Last2Targets(1,2))) max(abs(Displacement_static(2,1:begin)-Pos_Last2Targets(1,2))) max(abs(Displacement_static(3,1:begin)-Pos_Last2Targets(1,2)))];
end

end