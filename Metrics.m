function [ Metrics ] = Metrics( Metrics, Mode_visual, Pos_Last2Targets, Time_ReachTargets1,Time_ReachTargets2, Displacement_reach, Displacement_static )
% Metrics --> Return several foot control performance evaluation
% Nb Submovements?

begin = 200;

%Metrics.Current_Target = Metrics.Current_Target+1;
Metrics.Mean_v(:,Metrics.Current_Target) = Metrics_Velocity( Mode_visual, Pos_Last2Targets, Time_ReachTargets );
[Metrics.Stability.Absolute(:,Metrics.Current_Target), Metrics.Stability.Relative(:,Metrics.Current_Target)] = Metrics_Stability( Mode_visual, Displacement_static, Pos_Last2Targets );
[ Metrics.Overshoot.Max(:,Metrics.Current_Target), Metrics.Overshoot.Begin(:,Metrics.Current_Target)] = Metrics_Overshoot( Mode_visual, Displacement_static, Pos_Last2Targets, begin );
Metrics.SubMvt(:,Metrics.Current_Target)  = Metrics_SubMovements( Mode_visual, Displacement_reach, Pos_Last2Targets );
[ CompMvt.Static.Std(:,Metrics.Current_Target), CompMvt.Static.Mean(:,Metrics.Current_Target), CompMvt.Static.Rms(:,Metrics.Current_Target), CompMvt.Static.Min(:,Metrics.Current_Target), ...
    CompMvt.Static.Max(:,Metrics.Current_Target), CompMvt.Static.SubMvt(:,Metrics.Current_Target), CompMvt.Reach.Std(:,Metrics.Current_Target), CompMvt.Reach.Mean(:,Metrics.Current_Target), ...
    CompMvt.Reach.Rms(:,Metrics.Current_Target), CompMvt.Reach.SubMvt(:,Metrics.Current_Target) ]  = Metrics_CompensatoryMvt( Displacement_reach, Displacement_static );
Metrics.Current_Target = Metrics.Current_Target+1;
% 
% Metrics.Mean_v = Metrics_Velocity( Mode_visual, Pos_Last2Targets, Time_ReachTargets1, Time_ReachTargets2 );
% [Metrics.Stability.Absolute, Metrics.Stability.Relative] = Metrics_Stability( Mode_visual, Displacement_static, Pos_Last2Targets );
% [ Metrics.Overshoot.Max, Metrics.Overshoot.Begin] = Metrics_Overshoot( Mode_visual, Displacement_static, Pos_Last2Targets, begin );
% Metrics.SubMvt  = Metrics_SubMovements( Mode_visual, Displacement_reach, Pos_Last2Targets );
% [ CompMvt.Static.Std, CompMvt.Static.Mean, CompMvt.Static.Rms, CompMvt.Static.Min, ...
% CompMvt.Static.Max, CompMvt.Static.SubMvt, CompMvt.Reach.Std, CompMvt.Reach.Mean, ...
% CompMvt.Reach.Rms, CompMvt.Reach.SubMvt ]  = Metrics_CompensatoryMvt( Displacement_reach, Displacement_static );

end

