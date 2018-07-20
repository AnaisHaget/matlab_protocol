function [Targets_R] = Target_order_coordination(Mode_coord, nb_Targets, Targets)
% Target_order_coordination --> Generate the order for thescond foot 
%                               according to the desired coordination pattern

    if strcmp(Mode_coord,'InPhase') == 1
        Targets_R = Targets;
    elseif strcmp(Mode_coord,'OutPhase') == 1
        Targets_R = nb_Targets - 1 - Targets;  
    elseif strcmp(Mode_coord,'Async') == 1
        Targets_R = Target_order(nb_Targets);
        while isequal(Targets_R, Targets)
            Targets_R = Target_order(nb_Targets);
        end
    end  
end


