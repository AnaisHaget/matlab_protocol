function [ SubMvt ] = Metrics_SubMovements( Mode_visual, Displacement_reach, Pos_Last2Targets )
%Sub_Movements --> Indicate the number of submovements made to reach the
%target, normalised by the distance form the previous targets
Counter = 1;
Counter2 = 1;
Counter3 = 1;
Direction = 1;

if (strcmp(Mode_visual, 'Horizontal') == 1) || (strcmp(Mode_visual, 'Vertical') == 1)
    if Pos_Last2Targets(1,2) > Pos_Last2Targets(1,1)
        for i = 1:length(Displacement_reach)-1
            if Displacement_reach(1,i+1)>= Displacement_reach(1,i) && Direction == 1
                Direction = 1;
            end
            if Displacement_reach(1,i+1)< Displacement_reach(1,i) && Direction == 1
                Counter = Counter + 1;
                Direction = 0;
            end
            if Displacement_reach(1,i+1)< Displacement_reach(1,i) && Direction == 0
                Direction = 0;
            end
            if Displacement_reach(1,i+1)>= Displacement_reach(1,i) && Direction == 0
                Counter = Counter + 1;
                Direction = 1;
            end  
        end
    
    elseif Pos_Last2Targets(1,2) < Pos_Last2Targets(1,1)
        for i = 1:length(Displacement_reach)-1
            if Displacement_reach(1,i+1)<= Displacement_reach(1,i) && Direction == 1
                Direction = 1;
            end
            if Displacement_reach(1,i+1)> Displacement_reach(1,i) && Direction == 1
                Counter = Counter + 1;
                Direction = 0;
            end
            if Displacement_reach(1,i+1)> Displacement_reach(1,i) && Direction == 0
                Direction = 0;
            end
            if Displacement_reach(1,i+1)<= Displacement_reach(1,i) && Direction == 0
                Counter = Counter + 1;
                Direction = 1;
            end  
        end
    end
    SubMvt = Counter;


elseif (strcmp(Mode_visual, '2D') == 1) 
    if Pos_Last2Targets(1,2) > Pos_Last2Targets(1,1)
        for i = 1:size(Displacement_reach,2)-1
            if Displacement_reach(1,i+1)>= Displacement_reach(1,i) && Direction == 1
                Direction = 1;
            end
            if Displacement_reach(1,i+1)< Displacement_reach(1,i) && Direction == 1
                Counter = Counter + 1;
                Direction = 0;
            end
            if Displacement_reach(1,i+1)< Displacement_reach(1,i) && Direction == 0
                Direction = 0;
            end
            if Displacement_reach(1,i+1)>= Displacement_reach(1,i) && Direction == 0
                Counter = Counter + 1;
                Direction = 1;
            end  
        end
    
    elseif Pos_Last2Targets(1,2) < Pos_Last2Targets(1,1)
        for i = 1:size(Displacement_reach,2)-1
            if Displacement_reach(1,i+1)<= Displacement_reach(1,i) && Direction == 1
                Direction = 1;
            end
            if Displacement_reach(1,i+1)> Displacement_reach(1,i) && Direction == 1
                Counter = Counter + 1;
                Direction = 0;
            end
            if Displacement_reach(1,i+1)> Displacement_reach(1,i) && Direction == 0
                Direction = 0;
            end
            if Displacement_reach(1,i+1)<= Displacement_reach(1,i) && Direction == 0
                Counter = Counter + 1;
                Direction = 1;
            end  
        end
    end
    if Pos_Last2Targets(2,2) > Pos_Last2Targets(2,1)
        for i = 1:size(Displacement_reach,2)-1
            if Displacement_reach(2,i+1)>= Displacement_reach(2,i) && Direction == 1
                Direction = 1;
            end
            if Displacement_reach(2,i+1)< Displacement_reach(2,i) && Direction == 1
                Counter2 = Counter2 + 1;
                Direction = 0;
            end
            if Displacement_reach(2,i+1)< Displacement_reach(2,i) && Direction == 0
                Direction = 0;
            end
            if Displacement_reach(2,i+1)>= Displacement_reach(2,i) && Direction == 0
                Counter2 = Counter2 + 1;
                Direction = 1;
            end  
        end

    elseif Pos_Last2Targets(2,2) < Pos_Last2Targets(2,1)
        for i = 1:size(Displacement_reach,2)-1
            if Displacement_reach(2,i+1)<= Displacement_reach(2,i) && Direction == 1
                Direction = 1;
            end
            if Displacement_reach(2,i+1)> Displacement_reach(2,i) && Direction == 1
                Counter2 = Counter2 + 1;
                Direction = 0;
            end
            if Displacement_reach(2,i+1)> Displacement_reach(2,i) && Direction == 0
                Direction = 0;
            end
            if Displacement_reach(2,i+1)<= Displacement_reach(2,i) && Direction == 0
                Counter2 = Counter2 + 1;
                Direction = 1;
            end  
        end
    end
    SubMvt = [Counter Counter2];


elseif (strcmp(Mode_visual, '3D') == 1) 
    if Pos_Last2Targets(1,2) > Pos_Last2Targets(1,1)
        for i = 1:size(Displacement_reach,2)-1
            if Displacement_reach(1,i+1)>= Displacement_reach(1,i) && Direction == 1
                Direction = 1;
            end
            if Displacement_reach(1,i+1)< Displacement_reach(1,i) && Direction == 1
                Counter = Counter + 1;
                Direction = 0;
            end
            if Displacement_reach(1,i+1)< Displacement_reach(1,i) && Direction == 0
                Direction = 0;
            end
            if Displacement_reach(1,i+1)>= Displacement_reach(1,i) && Direction == 0
                Counter = Counter + 1;
                Direction = 1;
            end  
        end

    elseif Pos_Last2Targets(1,2) < Pos_Last2Targets(1,1)
        for i = 1:size(Displacement_reach,2)-1
            if Displacement_reach(1,i+1)<= Displacement_reach(1,i) && Direction == 1
                Direction = 1;
            end
            if Displacement_reach(1,i+1)> Displacement_reach(1,i) && Direction == 1
                Counter = Counter + 1;
                Direction = 0;
            end
            if Displacement_reach(1,i+1)> Displacement_reach(1,i) && Direction == 0
                Direction = 0;
            end
            if Displacement_reach(1,i+1)<= Displacement_reach(1,i) && Direction == 0
                Counter = Counter + 1;
                Direction = 1;
            end  
        end
    end
    if Pos_Last2Targets(2,2) > Pos_Last2Targets(2,1)
        for i = 1:size(Displacement_reach,2)-1
            if Displacement_reach(2,i+1)>= Displacement_reach(2,i) && Direction == 1
                Direction = 1;
            end
            if Displacement_reach(2,i+1)< Displacement_reach(2,i) && Direction == 1
                Counter2 = Counter2 + 1;
                Direction = 0;
            end
            if Displacement_reach(2,i+1)< Displacement_reach(2,i) && Direction == 0
                Direction = 0;
            end
            if Displacement_reach(2,i+1)>= Displacement_reach(2,i) && Direction == 0
                Counter2 = Counter2 + 1;
                Direction = 1;
            end  
        end

    elseif Pos_Last2Targets(2,2) < Pos_Last2Targets(2,1)
        for i = 1:size(Displacement_reach,2)-1
            if Displacement_reach(2,i+1)<= Displacement_reach(2,i) && Direction == 1
                Direction = 1;
            end
            if Displacement_reach(2,i+1)> Displacement_reach(2,i) && Direction == 1
                Counter2 = Counter2 + 1;
                Direction = 0;
            end
            if Displacement_reach(2,i+1)> Displacement_reach(2,i) && Direction == 0
                Direction = 0;
            end
            if Displacement_reach(2,i+1)<= Displacement_reach(2,i) && Direction == 0
                Counter2 = Counter2 + 1;
                Direction = 1;
            end  
        end
    end
    if Pos_Last2Targets(3,2) > Pos_Last2Targets(3,1)
        for i = 1:size(Displacement_reach,2)-1
            if Displacement_reach(3,i+1)>= Displacement_reach(3,i) && Direction == 1
                Direction = 1;
            end
            if Displacement_reach(3,i+1)< Displacement_reach(3,i) && Direction == 1
                Counter3 = Counter3 + 1;
                Direction = 0;
            end
            if Displacement_reach(3,i+1)< Displacement_reach(3,i) && Direction == 0
                Direction = 0;
            end
            if Displacement_reach(3,i+1)>= Displacement_reach(3,i) && Direction == 0
                Counter3 = Counter3 + 1;
                Direction = 1;
            end  
        end

    elseif Pos_Last2Targets(3,2) < Pos_Last2Targets(3,1)
        for i = 1:size(Displacement_reach,2)-1
            if Displacement_reach(3,i+1)<= Displacement_reach(3,i) && Direction == 1
                Direction = 1;
            end
            if Displacement_reach(3,i+1)> Displacement_reach(3,i) && Direction == 1
                Counter2 = Counter2 + 1;
                Direction = 0;
            end
            if Displacement_reach(3,i+1)> Displacement_reach(3,i) && Direction == 0
                Direction = 0;
            end
            if Displacement_reach(3,i+1)<= Displacement_reach(3,i) && Direction == 0
                Counter3 = Counter3 + 1;
                Direction = 1;
            end  
        end
    end
    SubMvt = [Counter Counter2 Counter3];
end

end

