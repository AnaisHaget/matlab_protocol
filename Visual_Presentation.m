%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%                           Hasler Project                          %%%%
%%%%                                                                   %%%%
%%%%                   Script Display visual screen                    %%%%
%%%%                          For Presentation                         %%%%
%%%%                            Anaïs Haget                            %%%%
%%%%                            Spring 2018                            %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% -------------------------------------------------------------------------
clear all; close all; clc;
% -------------------------------------------------------------------------

%% Observe cursor
Mode_visual = 'Vertical';
Mode_cursor = 'Line';
nb_Targets = 6;
Duration_Pause = 2;

[ypos, xpos, yheight, xwidth] = Visual_display(Mode_visual);
[ C_dim, C_shift, C_align_v, im, map, alpha ] = Cursor(Mode_cursor, Mode_visual, xwidth, yheight, xpos, ypos);
[C] = Display_Cursor( [30 30 30], Mode_visual, Mode_cursor, xpos, xwidth, ypos, yheight );

%% Target observation
clear all; close all; clc;
Mode_visual = 'Vertical';
Mode_cursor = 'Surgery';
nb_Targets = 6;
Duration_Pause = 2;

[ypos, xpos, yheight, xwidth] = Visual_display(Mode_visual);
[ C_dim, C_shift, C_align_v, im, map, alpha ] = Cursor(Mode_cursor, Mode_visual, xwidth, yheight, xpos, ypos);

[Targets] = Target_order(nb_Targets);
%[ Targets ] = Targets_multipleD( nb_Targets, Mode_visual );

[ Pos_Targets ] = Targets_positions( Targets,nb_Targets, Mode_visual, ypos, xpos, yheight, xwidth );
Reached_text = text(19,64,' Observe all Targets ','Color',[25,25,112]./255,'FontWeight','Bold','FontSize',16);
for i = 1: length(Targets)
    [T] = Display_Cursor( Pos_Targets(:,i), Mode_visual, 'Line', xpos, xwidth, ypos, yheight );
    set(T, 'Color', [25,25,112]./255);
end

%% Reaching Targets
clear all; close all; clc;

Mode_visual = 'Vertical';
Mode_cursor = 'Surgery';
nb_Targets = 6;
Duration_Pause = 2;

[ypos, xpos, yheight, xwidth] = Visual_display(Mode_visual);
[ C_dim, C_shift, C_align_v, im, map, alpha ] = Cursor(Mode_cursor, Mode_visual, xwidth, yheight, xpos, ypos);
[Targets] = Target_order(nb_Targets);
[ Pos_Targets ] = Targets_positions( Targets,nb_Targets, Mode_visual, ypos, xpos, yheight, xwidth );

[C] = Display_Cursor( [0 0 0], Mode_visual, Mode_cursor, xpos, xwidth, ypos, yheight );
[T] = Display_Cursor( Pos_Targets(:,1), Mode_visual, 'Line', xpos, xwidth, ypos, yheight );
set(T, 'Color', [25,25,112]./255);

for i = 1: Pos_Targets(1,1)
    Update_Cursor(Mode_visual, Mode_cursor, C, i, C_dim, C_shift, C_align_v); 
end
[Reached_text, x, y] = Observe_Reached_Target( Mode_visual, T, Duration_Pause);
    
for i = 2:length(Targets)
    Update_Cursor(Mode_visual, 'Line', T, Pos_Targets(:,i), C_dim, C_shift, C_align_v);
    for i = Pos_Targets(1,i-1):sign(Pos_Targets(1,i)-Pos_Targets(1,i-1)): Pos_Targets(1,i)
        Update_Cursor(Mode_visual, Mode_cursor, C, i, C_dim, C_shift, C_align_v); 
    end
    [Reached_text, x, y] = Observe_Reached_Target( Mode_visual, T, Duration_Pause);
end

%% 2 feet targets configurations
clear all; close all; clc;
nb_Targets = 6;
Mode_visual = 'Vertical';
% limit screen display
xlmin = 0; xlmax = 60; ylmin = 0; ylmax = 70; 
% Dimension interface/rectangle display 
lxpos = 10; lypos = 0; lxwidth = 10; lyheight = 60;
rxpos = 40; rypos = 0; rxwidth = 10; ryheight = 60;

Targets = Target_order(nb_Targets);
[Targets_R_In] = Target_order_coordination('InPhase', nb_Targets, Targets);
[Targets_R_Out] = Target_order_coordination('OutPhase', nb_Targets, Targets);
[Targets_R_Async] = Target_order_coordination('Async', nb_Targets, Targets);

[ Pos_Targets ] = Targets_positions( Targets,nb_Targets, Mode_visual, lypos, lxpos, lyheight, lxwidth );
[ Pos_Targets_R_In ] = Targets_positions( Targets_R_In,nb_Targets, Mode_visual, rypos, rxpos, ryheight, rxwidth );
[ Pos_Targets_R_Out ] = Targets_positions( Targets_R_Out,nb_Targets, Mode_visual, rypos, rxpos, ryheight, rxwidth );
[ Pos_Targets_R_Async ] = Targets_positions( Targets_R_Async,nb_Targets, Mode_visual, rypos, rxpos, ryheight, rxwidth );

% Plot interface
f1 = figure();
hold on; axis off;
axis([xlmin xlmax ylmin ylmax]); 
set(gcf, 'color', 'white'), set(gca, 'fontsize', 12,'box', 'off'); 

lr = rectangle('Position', [lxpos lypos lxwidth lyheight], 'FaceColor',...
    [175,238,238]./255,'EdgeColor',[0,206,209]./255,'LineWidth',3);
rr = rectangle('Position', [rxpos rypos rxwidth ryheight], 'FaceColor',...
    [175,238,238]./255,'EdgeColor',[0,206,209]./255,'LineWidth',3);

[ C_dim, C_shift, C_align_v, im, map, alpha ] = Cursor('Line', Mode_visual, lxwidth, lyheight, lxpos, lypos);

[Tr] = Display_Cursor( Pos_Targets_R_In(:,1), Mode_visual, 'Line', rxpos, rxwidth, rypos, ryheight );
set(Tr, 'Color', [25,25,112]./255);
[Tl] = Display_Cursor( Pos_Targets(:,1), Mode_visual, 'Line', lxpos, lxwidth, lypos, lyheight );
set(Tl, 'Color', [25,25,112]./255);

Reached_text = text(11,64,'Synchronous Coordination In Phase','Color','b','FontWeight','Bold','FontSize',16);
for i = 2:length(Pos_Targets)
    Update_Cursor(Mode_visual, 'Line', Tr, Pos_Targets_R_In(:,i), C_dim, C_shift, C_align_v); 
    Update_Cursor(Mode_visual, 'Line', Tl, Pos_Targets(:,i), C_dim, C_shift, C_align_v); 
    pause(0.5);
end

set(Reached_text,'String','Synchronous Coordination Out of Phase');
set(Reached_text,'Position',[9,64])
set(Reached_text,'Color','k')
for i = 1:length(Pos_Targets)
    Update_Cursor(Mode_visual, 'Line', Tr, Pos_Targets_R_Out(:,i), C_dim, C_shift, C_align_v); 
    Update_Cursor(Mode_visual, 'Line', Tl, Pos_Targets(:,i), C_dim, C_shift, C_align_v); 
    pause(0.5);
end

set(Reached_text,'String','Asynchronous Coordination');
set(Reached_text,'Position',[15,64])
set(Reached_text,'Color',[25,25,112]./255)
for i = 1:length(Pos_Targets)
    Update_Cursor(Mode_visual, 'Line', Tr, Pos_Targets_R_Async(:,i), C_dim, C_shift, C_align_v); 
    Update_Cursor(Mode_visual, 'Line', Tl, Pos_Targets(:,i), C_dim, C_shift, C_align_v); 
    pause(0.5);
end