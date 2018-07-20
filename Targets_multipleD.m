function [ Targets ] = Targets_multipleD( nb_Targets, Mode_Visual )
% Targets_multipleD --> Defines a vector of randomly ordered targets in
% case of 2D or 3D Visual display

if strcmp(Mode_Visual,'2D') == 1
    nb_Targets_2d = power(nb_Targets,2);
    [Targets_temp] = Target_order(nb_Targets_2d);
    nb_Targets_2D = [nb_Targets, nb_Targets];
    [I, J] = ind2sub(nb_Targets_2D,Targets_temp+1);
    Targets = [I-1; J-1];    

elseif strcmp(Mode_Visual,'3D') == 1
    nb_Targets_3d = power(nb_Targets,3);
    [Targets_temp] = Target_order(nb_Targets_3d);
    nb_Targets_3D = [nb_Targets, nb_Targets, nb_Targets];
    [I, J, K] = ind2sub(nb_Targets_3D,Targets_temp+1);
    Targets = [I-1; J-1; K-1];
end

end

