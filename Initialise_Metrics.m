function [ Metrics ] = Initialise_Metrics( Mode_visual, nb_Targets )
% Initialise the containing all the computed metrics

Metrics.Current_Target = 0;

if (strcmp(Mode_visual, 'Horizontal') == 1) || (strcmp(Mode_visual, 'Vertical') == 1)
    N = nb_Targets*4;
    Metrics.Stability.Absolute = zeros(1,N);
    Metrics.Stability.Relative = zeros(1,N);
    Metrics.Overshoot.Max = zeros(1,N);
    Metrics.Overshoot.Begin = zeros(1,N);
    Metrics.SubMvt = zeros(1,N);
    Merics.CompMvt.Static.Std = zeros(2,N); 
    CompMvt.Static.Mean = zeros(2,N);  
    CompMvt.Static.Rms = zeros(2,N); 
    CompMvt.Static.Min = zeros(2,N); 
    CompMvt.Static.Max = zeros(2,N); 
    CompMvt.Static.SubMvt = zeros(2,N);
    CompMvt.Reach.Std = zeros(2,N);  
    CompMvt.Reach.Mean = zeros(2,N);  
    CompMvt.Reach.Rms = zeros(2,N); 
    CompMvt.Reach.SubMvt = zeros(2,N); 

elseif strcmp(Mode_visual, '2D') == 1
    N = nb_Targets*nb_Targets*4;
    Metrics.Stability.Absolute = zeros(2,N);
    Metrics.Stability.Relative = zeros(2,N);
    Metrics.Overshoot.Max = zeros(2,N);
    Metrics.Overshoot.Begin = zeros(2,N);
    Metrics.SubMvt = zeros(2,N);

elseif strcmp(Mode_visual, '3D') == 1
    N = nb_Targets*nb_Targets*nb_Targets*4;
    Metrics.Stability.Absolute = zeros(3,N);
    Metrics.Stability.Relative = zeros(3,N);
    Metrics.Overshoot.Max = zeros(3,N);
    Metrics.Overshoot.Begin = zeros(3,N);
    Metrics.SubMvt = zeros(3,N);
end

Metrics.Mean_v = zeros(1,N);

end


