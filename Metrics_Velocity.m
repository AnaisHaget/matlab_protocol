function [ Mean_v ] = Metrics_Velocity( Mode_visual, Pos_Last2Targets, Time_ReachTargets )
% Metrics_Velocity --> Return the mean velociy to reach a target

if (strcmp(Mode_visual, 'Horizontal') == 1) || (strcmp(Mode_visual, 'Vertical') == 1)
%     Mean_v = abs(Pos_Last2Targets(2)-Pos_Last2Targets(1))/(Time_ReachTargets(2)-Time_ReachTargets(1));    
    Mean_v = abs(Pos_Last2Targets(1,2)-Pos_Last2Targets(1,1))/etime(Time_ReachTargets(2),Time_ReachTargets(1)); 
elseif (strcmp(Mode_visual, '2D') == 1) || (strcmp(Mode_visual, '3D') == 1)
%     Mean_v = norm(Pos_Last2Targets(:,1)-Pos_Last2Targets(:,2))/(Time_ReachTargets(2)-Time_ReachTargets(1));  
    Mean_v = norm(Pos_Last2Targets(:,1)-Pos_Last2Targets(:,2))/etime(Time_ReachTargets(2),Time_ReachTargets(1)); 
end

end

