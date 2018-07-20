function [ CompMvt.Static.Std, CompMvt.Static.Mean, CompMvt.Static.Rms, CompMvt.Static.Min, CompMvt.Static.Max, ...
    CompMvt.Static.SubMvt, CompMvt.Reach.Std, CompMvt.Reach.Mean, CompMvt.Reach.Rms, CompMvt.Reach.SubMvt ] = Metrics_CompensatoryMvt( Displacement_reach, Displacement_static )
% Evaluate the compensatory movements (= side movements) the foot makes
% when controlling only one dof ! 
% For example, to do Pitch movement, some displacement in x,y

CompMvt.Static.Std = [std(Displacement_static(2,:)) std(Displacement_static(3,:))];
CompMvt.Static.Mean = [mean(Displacement_static(2,:)) mean(Displacement_static(3,:))];
CompMvt.Static.Rms = [rms(Displacement_static(2,:)) rms(Displacement_static(3,:))];
CompMvt.Static.Min = [min(Displacement_static(2,:)) min(Displacement_static(3,:))];
CompMvt.Static.Max = [max(Displacement_static(2,:)) max(Displacement_static(3,:))];

CompMvt.Reach.Std = [std(Displacement_reach(2,:)) std(Displacement_reach(3,:))];
CompMvt.Reach.Mean = [mean(Displacement_reach(2,:)) mean(Displacement_reach(3,:))];
CompMvt.Reach.Rms = [rms(Displacement_reach(2,:)) rms(Displacement_reach(3,:))];

Counter2 = 1;
Counter3 = 1;
Direction = 1;

if Displacement_reach(2,2) > Displacement_reach(2,1)
    for i = 2:length(Displacement_reach)-1
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
elseif Displacement_reach(2,2) < Displacement_reach(2,1)
    for i = 2:length(Displacement_reach)-1
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
%
if Displacement_reach(3,2) > Displacement_reach(3,1)
    for i = 2:length(Displacement_reach)-1
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
elseif Displacement_reach(3,2) < Displacement_reach(3,1)
    for i = 2:length(Displacement_reach)-1
        if Displacement_reach(3,i+1)<= Displacement_reach(3,i) && Direction == 1
            Direction = 1;
        end
        if Displacement_reach(3,i+1)> Displacement_reach(3,i) && Direction == 1
            Counter3 = Counter3 + 1;
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

CompMvt.Reach.SubMvt = [Counter2 Counter3];

%
Counter2 = 1;
Counter3 = 1;
Direction = 1;

if Displacement_static(2,2) > Displacement_static(2,1)
    for i = 2:length(Displacement_static)-1
        if Displacement_static(2,i+1)>= Displacement_static(2,i) && Direction == 1
            Direction = 1;
        end
        if Displacement_static(2,i+1)< Displacement_static(2,i) && Direction == 1
            Counter2 = Counter2 + 1;
            Direction = 0;
        end
        if Displacement_static(2,i+1)< Displacement_static(2,i) && Direction == 0
            Direction = 0;
        end
        if Displacement_static(2,i+1)>= Displacement_static(2,i) && Direction == 0
            Counter2 = Counter2 + 1;
            Direction = 1;
        end  
    end
elseif Displacement_static(2,2) < Displacement_static(2,1)
    for i = 2:length(Displacement_static)-1
        if Displacement_static(2,i+1)<= Displacement_static(2,i) && Direction == 1
            Direction = 1;
        end
        if Displacement_static(2,i+1)> Displacement_static(2,i) && Direction == 1
            Counter2 = Counter2 + 1;
            Direction = 0;
        end
        if Displacement_static(2,i+1)> Displacement_static(2,i) && Direction == 0
            Direction = 0;
        end
        if Displacement_static(2,i+1)<= Displacement_static(2,i) && Direction == 0
            Counter2 = Counter2 + 1;
            Direction = 1;
        end  
    end
end
%
if Displacement_static(3,2) > Displacement_static(3,1)
    for i = 2:length(Displacement_static)-1
        if Displacement_static(3,i+1)>= Displacement_static(3,i) && Direction == 1
            Direction = 1;
        end
        if Displacement_static(3,i+1)< Displacement_static(3,i) && Direction == 1
            Counter3 = Counter3 + 1;
            Direction = 0;
        end
        if Displacement_static(3,i+1)< Displacement_static(3,i) && Direction == 0
            Direction = 0;
        end
        if Displacement_static(3,i+1)>= Displacement_static(3,i) && Direction == 0
            Counter3 = Counter3 + 1;
            Direction = 1;
        end  
    end
elseif Displacement_static(3,2) < Displacement_static(3,1)
    for i = 2:length(Displacement_static)-1
        if Displacement_static(3,i+1)<= Displacement_static(3,i) && Direction == 1
            Direction = 1;
        end
        if Displacement_static(3,i+1)> Displacement_static(3,i) && Direction == 1
            Counter3 = Counter3 + 1;
            Direction = 0;
        end
        if Displacement_static(3,i+1)> Displacement_static(3,i) && Direction == 0
            Direction = 0;
        end
        if Displacement_static(3,i+1)<= Displacement_static(3,i) && Direction == 0
            Counter3 = Counter3 + 1;
            Direction = 1;
        end  
    end
end

CompMvt.Static.SubMvt = [Counter2 Counter3];
