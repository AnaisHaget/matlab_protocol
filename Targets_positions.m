function [ Pos_Targets ] = Targets_positions( Targets,nb_Targets, Mode_visual, ypos, xpos, yheight, xwidth )
%Targets_ positions --> return the positions of each targets

if strcmp(Mode_visual,'Horizontal') == 1
    for i = 1:length(Targets)
        Pos_Targets(i) = Targets(i)*(xwidth/(nb_Targets-1));
    end
    
elseif strcmp(Mode_visual,'Vertical') == 1
    for i = 1:length(Targets)
        Pos_Targets(i) = Targets(i)*(yheight/(nb_Targets-1));
    end

elseif strcmp(Mode_visual,'2D') == 1
    for i = 1:size(Targets,2)
        Pos_Targets(1,i) = Targets(1,i)*(xwidth/(nb_Targets-1));
        Pos_Targets(2,i) = Targets(2,i)*(yheight/(nb_Targets-1));
    end

elseif strcmp(Mode_visual,'3D') == 1
    for i = 1:size(Targets,2)
        Pos_Targets(1,i) = Targets(1,i)*(xwidth/(nb_Targets-1));
        Pos_Targets(2,i) = Targets(2,i)*(yheight/(nb_Targets-1));
        Pos_Targets(3,i) = Targets(3,i)*(yheight/(nb_Targets-1));
    end
end

end

