function varargout = Interface2(varargin)
% INTERFACE2 MATLAB code for Interface2.fig
%      INTERFACE2, by itself, creates a new INTERFACE2 or raises the existing
%      singleton*.
%
%      H = INTERFACE2 returns the handle to a new INTERFACE2 or the handle to
%      the existing singleton*.
%
%      INTERFACE2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFACE2.M with the given input arguments.
%
%      INTERFACE2('Property','Value',...) creates a new INTERFACE2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Interface2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Interface2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Interface2

% Last Modified by GUIDE v2.5 02-Jul-2018 13:42:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Interface2_OpeningFcn, ...
                   'gui_OutputFcn',  @Interface2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Interface2 is made visible.
function Interface2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Interface2 (see VARARGIN)

% Choose default command line output for Interface2
set(gcf, 'renderer', 'painters');
axes(handles.axes1_Interface);
handles.output = hObject;
handles.xrange = 0.353;
handles.yrange = 0.293;
handles.Mode_Visual = 'Horizontal';
handles.Mode_Cursor = 'Line';
handles.DOF = 'x';
handles.stop = false;
handles.record = false;
% handles.calib = 0; %0 no calibration, 1 calibration phase, 2 calibration ended
% handles.xrangecalib = 0.353;
% handles.yrangecalib = [];
% handles.prangecalib = [];
% handles.xmincalib = [];
% handles.ymincalib = [];
% handles.pmaxcalib = [];
handles.C =[];
rosinit('128.178.145.250');
handles.sub = rossubscriber('FI_Pose',@callback);
guidata(hObject,handles);

global FlagCalib Xrangecalib Yrangecalib Prangecalib Xmincalib Ymincalib Pmaxcalib;
global    Xmaxcalib Ymaxcalib Pmincalib;
FlagCalib = 0;
Xrangecalib = [];
Yrangecalib = [];
Prangecalib = [];
Xmincalib = [];
Ymincalib = [];
Pmaxcalib = [];
Xmaxcalib = [];
Ymaxcalib = [];
Pmincalib = [];
global Targets Targets_Pos T Duration_Pause;
Targets = Target_order(4);
Targets_Pos = Targets_positions( Targets, 4, handles.Mode_Visual, 25, 0, 10, 60);
T = [];
Duration_Pause = 2;

% if exist('handles.hbh1', 'var')
%     close(handles.hbh1);
%     clear handles.hbh1;
% end
% 
% if exist('handles.hbh2', 'var')
%     close(handles.hbh2);
%     clear handles.hbh2;
% end
% 
% if exist('handles.hbh3', 'var')
%     close(handles.hbh3);
%     clear handles.hbh3;
% end
% 
% if ~isempty(instrfind)
%     fclose(instrfind);
% end
% 
% % Open communication
% boardComPort1 = hri_comm.getHriComPort(); % Find the serial port name.
% handles.hbh1 = hri_comm(boardComPort1, 0); % Create a "HRI board communication" object.
% open(handles.hbh1);
% boardComPort2 = hri_comm.getHriComPort();
% handles.hbh2 = hri_comm(boardComPort2, 0);
% open(handles.hbh2);
% boardComPort3 = hri_comm.getHriComPort();
% handles.hbh3 = hri_comm(boardComPort3, 0);
% open(handles.hbh3);
% 
% % Check if the board is responding.
% ok1 = ping(handles.hbh1);
% ok2 = ping(handles.hbh2);
% ok3 = ping(handles.hbh3);
% 
% if ok1
%     disp('Board 1 responded to the ping request.');
% else
%     warning('Board 1 did not respond to the ping request.');
% end
% 
% if ok2
%     disp('Board 2 responded to the ping request.');
% else
%     warning('Board 2 did not respond to the ping request.');
% end
% 
% if ok3
%     disp('Board 3 responded to the ping request.');
% else
%     warning('Board 3 did not respond to the ping request.');
% end
% 
% % Setup encoder position streaming.
% setStreamedVars(handles.hbh1, []);
% encoderVarId = getVarIdFromName(handles.hbh1, 'outputPosition[m de');
% setStreamedVars(handles.hbh1,encoderVarId);
% setStreamedVars(handles.hbh2, []);
% encoderVarId = getVarIdFromName(handles.hbh2, 'outputPosition[m de');
% setStreamedVars(handles.hbh2,encoderVarId);
% setStreamedVars(handles.hbh3, []);
% encoderVarId = getVarIdFromName(handles.hbh3, 'outputPosition[m de');
% setStreamedVars(handles.hbh3,encoderVarId);
% 
% % Update handles structure
% guidata(hObject, handles);
% if(ok1 && ok2 && ok3)
%     %axes(handles.axes1)
[handles.ypos, handles.xpos, handles.yheight, handles.xwidth] = Visual_display(handles.Mode_Visual);
[ handles.C_dim, handles.C_shift, handles.C_align_v, handles.im, handles.map, handles.alpha ] = Cursor(handles.Mode_Cursor, handles.Mode_Visual, handles.xwidth, handles.yheight, handles.xpos, handles.ypos);
handles.C = Display_Cursor( [0 0 0], handles.Mode_Visual, handles.Mode_Cursor, handles.xpos, handles.xwidth, handles.ypos, handles.yheight )
guidata(hObject,handles);
    
% end
        

% UIWAIT makes Interface2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Interface2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
handles = guidata(hObject);
%varargout{1} = handles.output;
if(handles.stop)
    close all;
end


% --- Executes on button press in Stop_button.
function Stop_button_Callback(hObject, eventdata, handles)
% hObject    handle to Stop_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles = guidata(hObject);
    handles.stop = true;
    guidata(hObject, handles);

% --- Executes on selection change in popupmenu1_dof.
function popupmenu1_dof_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1_dof (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1_dof contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1_dof
    handles = guidata(hObject);
    contents = cellstr(get(hObject,'String'));
    handles.DOF = contents{get(hObject,'Value')};
    guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function popupmenu1_dof_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1_dof (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2_Visual.
function popupmenu2_Visual_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2_Visual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2_Visual contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2_Visual
    handles = guidata(hObject);
    contents = cellstr(get(hObject,'String'));
    handles.Mode_Visual = contents{get(hObject,'Value')}; 
    cla(handles.axes1_Interface);
    view(2);
    [ypos, xpos, yheight, xwidth] = Visual_display(handles.Mode_Visual);
    handles.ypos = ypos;
    handles.xpos = xpos;
    handles.yheight = yheight;
    handles.xwidth = xwidth;
    if(~isempty(handles.C))
        delete(handles.C);
        handles.C = [];
        guidata(hObject,handles);
    end
    [C_dim, C_shift, C_align_v, im, map, alpha ] = Cursor(handles.Mode_Cursor, handles.Mode_Visual, handles.xwidth, handles.yheight, handles.xpos, handles.ypos);
    handles.C = Display_Cursor( [0 0 0], handles.Mode_Visual, handles.Mode_Cursor, handles.xpos, handles.xwidth, handles.ypos, handles.yheight )
    guidata(hObject,handles);
    


% --- Executes during object creation, after setting all properties.
function popupmenu2_Visual_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2_Visual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3_Cursor.
function popupmenu3_Cursor_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3_Cursor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3_Cursor contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3_Cursor
    handles = guidata(hObject);
    contents = cellstr(get(hObject,'String'));
    handles.Mode_Cursor = contents{get(hObject,'Value')};
    
    if(~isempty(handles.C))
        delete(handles.C);
        handles.C = [];
        guidata(hObject,handles);
    end
    [handles.C_dim, handles.C_shift, handles.C_align_v, handles.im, handles.map, handles.alpha ] = Cursor(handles.Mode_Cursor, handles.Mode_Visual, handles.xwidth, handles.yheight, handles.xpos, handles.ypos);
    handles.C = Display_Cursor( [0 0 0], handles.Mode_Visual, handles.Mode_Cursor, handles.xpos, handles.xwidth, handles.ypos, handles.yheight )
    guidata(hObject, handles);
    
% --- Executes during object creation, after setting all properties.
function popupmenu3_Cursor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3_Cursor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_targets_Callback(hObject, eventdata, handles)
% hObject    handle to edit2_targets (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2_targets as text
%        str2double(get(hObject,'String')) returns contents of edit2_targets as a double


% --- Executes during object creation, after setting all properties.
function edit2_targets_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2_targets (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2_target.
function pushbutton2_target_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2_target (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global Targets Targets_Pos;
    handles = guidata(hObject);
    Targets = [];
    Targets_Pos = [];
    nb_Targets = str2double(get(handles.edit2_targets,'String'));
    if (strcmp(handles.Mode_Visual,'Horizontal') == 1) || (strcmp(handles.Mode_Visual,'Vertical') == 1)
        Targets = Target_order(nb_Targets);
    elseif (strcmp(handles.Mode_Visual,'2D') == 1) || (strcmp(handles.Mode_Visual,'3D') == 1)
        Targets = Targets_multipleD( nb_Targets, handles.Mode_Visual );
    end
    Targets_Pos = Targets_positions( Targets,nb_Targets, handles.Mode_Visual, handles.ypos, handles.xpos, handles.yheight, handles.xwidth );
    disp(Targets)

function edit3_pause_Callback(hObject, eventdata, handles)
% hObject    handle to edit3_pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3_pause as text
%        str2double(get(hObject,'String')) returns contents of edit3_pause as a double



% --- Executes during object creation, after setting all properties.
function edit3_pause_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3_pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3_pause.
function pushbutton3_pause_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3_pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global Duration_Pause;
    handles = guidata(hObject);
    Duration_Pause = [];
    Duration_Pause = str2double(get(handles.edit3_pause,'String'));
    

% --- Executes on button press in pushbutton_start_Record.
function pushbutton_start_Record_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_start_Record (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles = guidata(hObject);
    global Targets Targets_Pos Duration_Pause;
    global TimeStep;
    global flagReach;
    handles.record = true;
    guidata(hObject,handles);
    % move(hObject,handles);
    i = 1;
    step = 1;
    T = Display_Cursor(Targets_Pos(:,i), handles.Mode_Visual, 'Line', handles.xpos, handles.xwidth, handles.ypos, handles.yheight );
    set(T,'Color',[25,25,112]./255);
    Epsilon = 0.5;
    Epsilon_time = 0.0001;
    t_reach = [];
    flagReach = 0;
%     tInit = TimeStep;
    Reached_text = text(19,10,' !! Target Reached !!','Color','r','FontWeight','Bold','FontSize',16,'Visible','off');
    Count_Down = text(19 -1, 10+5,num2str(10),'Color',[25,25,112]./255,'FontWeight','Bold','FontSize',20,'Visible','off');
    
    while (handles.stop==0) && (i<=length(Targets))
%         TimeStep-tInit
        Position = CursorPosition(hObject,handles);
        Update_Cursor(handles.Mode_Visual, handles.Mode_Cursor, handles.C, Position, handles.C_dim, handles.C_shift, handles.C_align_v);
        if strcmp(handles.Mode_Visual,'Horizontal') || strcmp(handles.Mode_Visual,'Vertical')
            d = norm(Targets_Pos(:,i)- Position(1));
        elseif strcmp(handles.Mode_Visual,'2D')
            d = norm(Targets_Pos(:,i)'- Position(1:2));
        elseif strcmp(handles.Mode_Visual,'3D')
            d = norm(Targets_Pos(:,i)'- Position);
        end
        if (d <= Epsilon)
            flagReach = 1;
        end
        if flagReach == 1
%             [Reached_text, x, y]=Observe_Reached_Target( handles.Mode_Visual, T, Duration_Pause);
%             if (i+1 <= length(Targets))
%                 Update_Cursor(handles.Mode_Visual, 'Line', T, Targets_Pos(:,i+1), handles.C_dim, handles.C_shift, handles.C_align_v);
%                 set(T,'Color',[25,25,112]./255);
% %                 set(Reached_text,'Visible','off');
%                 i=i+1;
%             elseif (i+1 > length(Targets))
%                 i=i+2;
%             end
%         end
%     end
            [Reached_text, x, y] = Observe_Reached_Target( handles.Mode_Visual, T, Duration_Pause, Reached_text);
            set(Count_Down,'Visible','on')
            set(Count_Down,'Position',[x-1, y+5])
            if isempty(t_reach)
                t_reach = clock;
            end
            for startnum = 9:-1:0
                if (etime(clock,t_reach)>=step*Duration_Pause/10)
                     set(Count_Down, 'String', num2str(startnum));
                     step = step+1;
                end
            end
            step =1;
            if (etime(clock,t_reach)>=Duration_Pause)
                if (i+1 <= length(Targets))
                    Update_Cursor(handles.Mode_Visual, 'Line', T, Targets_Pos(:,i+1), handles.C_dim, handles.C_shift, handles.C_align_v);
                    set(T,'Color',[25,25,112]./255);
                    set(Reached_text,'Visible','off');
                    set(Count_Down,'Visible','off');
                    set(Count_Down,'String',num2str(10));
                    t_reach = [];
                    flagReach = 0;
                    i=i+1;
                elseif (i+1 > length(Targets))
                    i=i+2;
                    t_reach = [];
                    flagReach = 0;
                    set(Reached_text,'Visible','off');
                    set(Count_Down,'Visible','off');
                    set(Count_Down,'String',num2str(10));
                end
            end
        end
    end 
    guidata(hObject,handles);

% --- Executes on button press in pushbutton_end_Record.
function pushbutton_end_Record_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_end_Record (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles = guidata(hObject);
    handles.record = false;
    guidata(hObject,handles);

% --- Executes on button press in pushbutton_start_Calib.
function pushbutton_start_Calib_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_start_Calib (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    %global X Y P
    global FlagCalib
    handles = guidata(hObject);
    FlagCalib = 1;
    %handles.calib = 1;
%     guidata(hObject,handles);
    move(hObject,handles);
    %handles.PositionCalib = [handles.PositionCalib; X Y P];
    guidata(hObject,handles);


% --- Executes on button press in pushbutton_end_Calib.
function pushbutton_end_Calib_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_end_Calib (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global FlagCalib Memory Xrangecalib Yrangecalib Prangecalib Xmincalib Ymincalib Pmaxcalib;
    global Xmaxcalib Ymaxcalib Pmincalib;
    FlagCalib = 2;
    handles = guidata(hObject);

    %handles.calib = 2;
    CalibNum = 30;
    SortMemory = sort(Memory,1);
    Xrangecalib = -mean(SortMemory(1:CalibNum,1))+mean(SortMemory(end-CalibNum:end,1));
    Yrangecalib = -mean(SortMemory(1:CalibNum,2))+mean(SortMemory(end-CalibNum:end,2));
    Prangecalib = -mean(SortMemory(1:CalibNum,3))+mean(SortMemory(end-CalibNum:end,3));
    Xmincalib = mean(SortMemory(1:CalibNum,1));
    Ymincalib = mean(SortMemory(1:CalibNum,2));
    Pmaxcalib = mean(SortMemory(end-CalibNum:end,3));
    Xmaxcalib = mean(SortMemory(end-CalibNum:end,1));
    Ymaxcalib = mean(SortMemory(end-CalibNum:end,2));
    Pmincalib = mean(SortMemory(1:CalibNum,3));
    guidata(hObject,handles);
    Memory = [];
    guidata(hObject,handles);
%     disp(handles.xrangecalib);
%     disp(handles.xmincalib);
    
function move(hObject,handles)
    handles = guidata(hObject);
%    global X Y P;
    global FlagCalib;
    while(handles.stop==false && handles.record==true) || (handles.stop==false && FlagCalib == 1)
%   handles = guidata(hObject);
%         x = X;
%         y = Y;
%         p = P;
%         ps = handles.xwidth-(p+60)*handles.xwidth/120; %temp
%         xs = handles.xwidth-x*handles.xwidth/handles.xrange;
%         ys = handles.yheight-y*handles.yheight/handles.yrange;
        Update_Cursor(handles.Mode_Visual, handles.Mode_Cursor, handles.C, CursorPosition(hObject,handles), handles.C_dim, handles.C_shift, handles.C_align_v);

%          handles.stop
%         pause(0.01);
%    CursorPosition(hObject,handles)
    guidata(hObject,handles);
    end
    
function callback(msg,hObject,handles)
    global X Y P Memory TimeStep;
    global FlagCalib flagReach;
    X = msg.LatestMessage.Pose.Position.X;
    Y = msg.LatestMessage.Pose.Position.Y;
    P = msg.LatestMessage.Pose.Orientation.X;
    %stamp = msg.LatestMessage.Header.Stamp;
    %TimeStep = stamp.Sec+1e-9*stamp.Nsec;
    if (FlagCalib == 1)
        Memory = [Memory; X Y P];
    end

function [Position] = CursorPosition(hObject,handles)
    handles = guidata(hObject);
    global X Y P FlagCalib;
    global Xrangecalib Yrangecalib Prangecalib Xmincalib Ymincalib Pmaxcalib;
    global Xmaxcalib Ymaxcalib Pmincalib;
    x = X;
    y = Y;
    p = P; 
    if FlagCalib ~= 2
%    if handles.calib ~= 2           
%         xs = handles.xwidth-x*handles.xwidth/handles.xrange;
%         ys = handles.yheight-y*handles.yheight/handles.yrange;
%         ps = handles.xwidth-(p+60)*handles.xwidth/120;
        xs = 60-x*60/handles.xrange;
        ys = 60-y*60/handles.yrange;
        ps = 60-(p+60)*60/120;
    elseif FlagCalib == 2
%    elseif handles.calib == 2
%     x 
%     handles.xrangecalib
        xs = 60-(x*60/Xrangecalib + ((Xmincalib*60 - Xmaxcalib*0)/(Xmincalib - Xmaxcalib)));
        ys = 60-(y*60/Yrangecalib + ((Ymincalib*60 - Ymaxcalib*0)/(Ymincalib - Ymaxcalib)));
        ps = 60-(p*60/Prangecalib + ((Pmincalib*60 - Pmaxcalib*0)/(Pmincalib - Pmaxcalib)));
    end
    if strcmp(handles.DOF,'x') == 1 
        Position = [xs ys ps];
    elseif strcmp(handles.DOF,'y') == 1
        Position = [ys xs ps];
    elseif strcmp(handles.DOF,'Pitch') == 1
        Position = [ps xs ys];
    elseif strcmp(handles.DOF,'2D') == 1
        Position = [xs ys ps];
    elseif strcmp(handles.DOF,'3D') == 1
        Position = [xs ys ps];
    end
    guidata(hObject,handles);
    
