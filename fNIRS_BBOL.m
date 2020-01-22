function varargout = fNIRS_BBOL(varargin)
% FNIRS_BBOL MATLAB code for fNIRS_BBOL.fig
%      FNIRS_BBOL, by itself, creates a new FNIRS_BBOL or raises the existing
%      singleton*.
%
%      H = FNIRS_BBOL returns the handle to a new FNIRS_BBOL or the handle to
%      the existing singleton*.
%
%      FNIRS_BBOL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FNIRS_BBOL.M with the given input arguments.
%
%      FNIRS_BBOL('Property','Value',...) creates a new FNIRS_BBOL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fNIRS_BBOL_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fNIRS_BBOL_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fNIRS_BBOL

% Last Modified by GUIDE v2.5 11-Jan-2020 07:39:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fNIRS_BBOL_OpeningFcn, ...
                   'gui_OutputFcn',  @fNIRS_BBOL_OutputFcn, ...
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

% --- Executes just before fNIRS_BBOL is made visible.
function fNIRS_BBOL_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fNIRS_BBOL (see VARARGIN)

% Choose default command line output for fNIRS_BBOL
handles.output = hObject;

handles.run = 1;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes fNIRS_BBOL wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.COMlist, 'String', seriallist);

% --- Outputs from this function are returned to the command line.
function varargout = fNIRS_BBOL_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function txt_outputDir_Callback(hObject, eventdata, handles)
% hObject    handle to txt_outputDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt_outputDir as text
%        str2double(get(hObject,'String')) returns contents of txt_outputDir as a double


% --- Executes during object creation, after setting all properties.
function txt_outputDir_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt_outputDir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in bt_browse.
function bt_browse_Callback(hObject, eventdata, handles)
% hObject    handle to bt_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
output_dir = uigetdir();
set(handles.txt_outputDir,'string',output_dir);

% --- Executes on button press in streamData.
function streamData_Callback(hObject, eventdata, handles)
% hObject    handle to streamData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles=guidata(hObject);
if handles.run == 0
    disp('restart condition satisfied');
    handles.run = 1;
    guidata(hObject,handles)
end

time_array = [];
ch1R_array = [];
ch1IR_array = [];
ch2R_array = [];
ch2IR_array = [];
ch3R_array = [];
ch3IR_array = [];
ch4R_array = [];
ch4IR_array = [];
ch5R_array = [];
ch5IR_array = [];
ch6R_array = [];
ch6IR_array = [];
ch7R_array = [];
ch7IR_array = [];
ch8R_array = [];
ch8IR_array = [];
ch9R_array = [];
ch9IR_array = [];
ch10R_array = [];
ch10IR_array = [];
ch11R_array = [];
ch11IR_array = [];
ch12R_array = [];
ch12IR_array = [];
ch13R_array = [];
ch13IR_array = [];

% Begin system timer
tic;

while ~get(handles.bt_stop, 'Value')
    
    handles=guidata(hObject);
    
    if handles.run==1
        
        set(handles.streamData,'enable','off');
        set(handles.bt_stop,'enable','on');
        
        %% DATA ACQUISITION 
        % TODO: Add bluetooth data acquisiton and parsing..
        % Prototyped with a random number generator
        
        % Define fNIR Infrared Data Here
        ch1R = rand;
        ch2R = rand;
        ch3R = rand;
        ch4R = rand;
        ch5R = rand;
        ch6R = rand;
        ch7R = rand;
        ch8R = rand;
        ch9R = rand;
        ch10R = rand;
        ch11R = rand;
        ch12R = rand;
        ch13R = rand;

        % Define fNIR Infrared Data Here
        ch1IR = rand;
        ch2IR = rand;
        ch3IR = rand;
        ch4IR = rand;
        ch5IR = rand;
        ch6IR = rand;
        ch7IR = rand;
        ch8IR = rand;
        ch9IR = rand;
        ch10IR = rand;
        ch11IR = rand;
        ch12IR = rand;
        ch13IR = rand;
        
        %% DATA MANAGEMENT
        
        time_array = [time_array toc];
        
        % Channel 1 Array
        ch1R_array = [ch1R_array ch1R];
        ch1IR_array = [ch1IR_array ch1IR];
        
        % Channel 2 Array
        ch2R_array = [ch2R_array ch2R];
        ch2IR_array = [ch2IR_array ch2IR];
        
        % Channel 3 Array
        ch3R_array = [ch3R_array ch3R];
        ch3IR_array = [ch3IR_array ch3IR];
                
        % Channel 4 Array
        ch4R_array = [ch4R_array ch4R];
        ch4IR_array = [ch4IR_array ch4IR];
                        
        % Channel 5 Array
        ch5R_array = [ch5R_array ch5R];
        ch5IR_array = [ch5IR_array ch5IR];
        
        % Channel 6 Array
        ch6R_array = [ch6R_array ch6R];
        ch6IR_array = [ch6IR_array ch6IR];
        
        % Channel 7 Array
        ch7R_array = [ch7R_array ch7R];
        ch7IR_array = [ch7IR_array ch7IR];
        
        % Channel 8 Array
        ch8R_array = [ch8R_array ch8R];
        ch8IR_array = [ch8IR_array ch8IR];
                
        % Channel 9 Array
        ch9R_array = [ch9R_array ch9R];
        ch9IR_array = [ch9IR_array ch9IR];
                        
        % Channel 10 Array
        ch10R_array = [ch10R_array ch10R];
        ch10IR_array = [ch10IR_array ch10IR];
        
        % Channel 11 Array
        ch11R_array = [ch11R_array ch11R];
        ch11IR_array = [ch11IR_array ch11IR];
        
        % Channel 12 Array
        ch12R_array = [ch12R_array ch12R];
        ch12IR_array = [ch12IR_array ch12IR];
        
        % Channel 13 Array
        ch13R_array = [ch13R_array ch13R];
        ch13IR_array = [ch13IR_array ch13IR];
        
        %% Plot Data on Time Series Charts in GUI
        % Using set() function to update GUI plots in real time effectively
        
        % Channel 1 Time Series
        thisax = handles.axes_ch1;
        plot2handle = get(thisax, 'UserData');
        
        if (isempty(plot2handle))
            
              plot(time_array, ch1R_array, 'r', time_array, ch1IR_array, 'k', 'linewidth', 2, 'Parent', thisax);


              hold(thisax, 'on');

              plot2handle = plot(time_array, ch1R_array, 'r', time_array, ch1IR_array, 'k', 'linewidth', 2, 'Parent', thisax);
              % Plotting the signal over the threshold line
              hold(thisax, 'off');
              set(thisax, 'UserData', plot2handle);

        else
            
              set(plot2handle(1), 'XData', time_array, 'YData', ch1R_array);
              set(plot2handle(2), 'XData', time_array, 'YData', ch1IR_array);
                            
              if length(time_array) > 30
                 set(thisax, 'xlim', [time_array((length(time_array) - 20)) time_array(length(time_array))]);
              end

        end
        
        % Channel 2 Time Series
        thisax = handles.axes_ch2;
        plot2handle = get(thisax, 'UserData');
        
        if (isempty(plot2handle))
            
              plot(time_array, ch2R_array, 'r', time_array, ch2IR_array, 'k', 'linewidth', 2, 'Parent', thisax);


              hold(thisax, 'on');

              plot2handle = plot(time_array, ch2R_array, 'r', time_array, ch2IR_array, 'k', 'linewidth', 2, 'Parent', thisax);
              % Plotting the signal over the threshold line
              hold(thisax, 'off');
              set(thisax, 'UserData', plot2handle);

        else
            
              set(plot2handle(1), 'XData', time_array, 'YData', ch2R_array);
              set(plot2handle(2), 'XData', time_array, 'YData', ch2IR_array);
                            
              if length(time_array) > 30
                 set(thisax, 'xlim', [time_array((length(time_array) - 20)) time_array(length(time_array))]);
              end

        end
        
        % Channel 3 Time Series
        thisax = handles.axes_ch3;
        plot2handle = get(thisax, 'UserData');
        
        if (isempty(plot2handle))
            
              plot(time_array, ch3R_array, 'r', time_array, ch3IR_array, 'k', 'linewidth', 2, 'Parent', thisax);


              hold(thisax, 'on');

              plot2handle = plot(time_array, ch3R_array, 'r', time_array, ch3IR_array, 'k', 'linewidth', 2, 'Parent', thisax);
              % Plotting the signal over the threshold line
              hold(thisax, 'off');
              set(thisax, 'UserData', plot2handle);

        else
            
              set(plot2handle(1), 'XData', time_array, 'YData', ch3R_array);
              set(plot2handle(2), 'XData', time_array, 'YData', ch3IR_array);
                            
              if length(time_array) > 30
                 set(thisax, 'xlim', [time_array((length(time_array) - 20)) time_array(length(time_array))]);
              end

        end
        
        % Channel 4 Time Series
        thisax = handles.axes_ch4;
        plot2handle = get(thisax, 'UserData');
        
        if (isempty(plot2handle))
            
              plot(time_array, ch4R_array, 'r', time_array, ch4IR_array, 'k', 'linewidth', 2, 'Parent', thisax);


              hold(thisax, 'on');

              plot2handle = plot(time_array, ch4R_array, 'r', time_array, ch4IR_array, 'k', 'linewidth', 2, 'Parent', thisax);
              % Plotting the signal over the threshold line
              hold(thisax, 'off');
              set(thisax, 'UserData', plot2handle);

        else
            
              set(plot2handle(1), 'XData', time_array, 'YData', ch4R_array);
              set(plot2handle(2), 'XData', time_array, 'YData', ch4IR_array);
                            
              if length(time_array) > 30
                 set(thisax, 'xlim', [time_array((length(time_array) - 20)) time_array(length(time_array))]);
              end

        end
        
        % Channel 5 Time Series
        thisax = handles.axes_ch5;
        plot2handle = get(thisax, 'UserData');
        
        if (isempty(plot2handle))
            
              plot(time_array, ch5R_array, 'r', time_array, ch5IR_array, 'k', 'linewidth', 2, 'Parent', thisax);


              hold(thisax, 'on');

              plot2handle = plot(time_array, ch5R_array, 'r', time_array, ch5IR_array, 'k', 'linewidth', 2, 'Parent', thisax);
              % Plotting the signal over the threshold line
              hold(thisax, 'off');
              set(thisax, 'UserData', plot2handle);

        else
            
              set(plot2handle(1), 'XData', time_array, 'YData', ch5R_array);
              set(plot2handle(2), 'XData', time_array, 'YData', ch5IR_array);
                            
              if length(time_array) > 30
                 set(thisax, 'xlim', [time_array((length(time_array) - 20)) time_array(length(time_array))]);
              end

        end
        
        % Channel 6 Time Series
        thisax = handles.axes_ch6;
        plot2handle = get(thisax, 'UserData');
        
        if (isempty(plot2handle))
            
              plot(time_array, ch6R_array, 'r', time_array, ch6IR_array, 'k', 'linewidth', 2, 'Parent', thisax);


              hold(thisax, 'on');

              plot2handle = plot(time_array, ch6R_array, 'r', time_array, ch6IR_array, 'k', 'linewidth', 2, 'Parent', thisax);
              % Plotting the signal over the threshold line
              hold(thisax, 'off');
              set(thisax, 'UserData', plot2handle);

        else
            
              set(plot2handle(1), 'XData', time_array, 'YData', ch6R_array);
              set(plot2handle(2), 'XData', time_array, 'YData', ch6IR_array);
                            
              if length(time_array) > 30
                 set(thisax, 'xlim', [time_array((length(time_array) - 20)) time_array(length(time_array))]);
              end

        end
                
        % Channel 7 Time Series
        thisax = handles.axes_ch7;
        plot2handle = get(thisax, 'UserData');
        
        if (isempty(plot2handle))
            
              plot(time_array, ch7R_array, 'r', time_array, ch7IR_array, 'k', 'linewidth', 2, 'Parent', thisax);


              hold(thisax, 'on');

              plot2handle = plot(time_array, ch7R_array, 'r', time_array, ch7IR_array, 'k', 'linewidth', 2, 'Parent', thisax);
              % Plotting the signal over the threshold line
              hold(thisax, 'off');
              set(thisax, 'UserData', plot2handle);

        else
            
              set(plot2handle(1), 'XData', time_array, 'YData', ch7R_array);
              set(plot2handle(2), 'XData', time_array, 'YData', ch7IR_array);
                            
              if length(time_array) > 30
                 set(thisax, 'xlim', [time_array((length(time_array) - 20)) time_array(length(time_array))]);
              end

        end
        
        % Channel 8 Time Series
        thisax = handles.axes_ch8;
        plot2handle = get(thisax, 'UserData');
        
        if (isempty(plot2handle))
            
              plot(time_array, ch8R_array, 'r', time_array, ch8IR_array, 'k', 'linewidth', 2, 'Parent', thisax);


              hold(thisax, 'on');

              plot2handle = plot(time_array, ch8R_array, 'r', time_array, ch8IR_array, 'k', 'linewidth', 2, 'Parent', thisax);
              % Plotting the signal over the threshold line
              hold(thisax, 'off');
              set(thisax, 'UserData', plot2handle);

        else
            
              set(plot2handle(1), 'XData', time_array, 'YData', ch8R_array);
              set(plot2handle(2), 'XData', time_array, 'YData', ch8IR_array);
                            
              if length(time_array) > 30
                 set(thisax, 'xlim', [time_array((length(time_array) - 20)) time_array(length(time_array))]);
              end

        end
        
        % Channel 9 Time Series
        thisax = handles.axes_ch9;
        plot2handle = get(thisax, 'UserData');
        
        if (isempty(plot2handle))
            
              plot(time_array, ch9R_array, 'r', time_array, ch9IR_array, 'k', 'linewidth', 2, 'Parent', thisax);


              hold(thisax, 'on');

              plot2handle = plot(time_array, ch9R_array, 'r', time_array, ch9IR_array, 'k', 'linewidth', 2, 'Parent', thisax);
              % Plotting the signal over the threshold line
              hold(thisax, 'off');
              set(thisax, 'UserData', plot2handle);

        else
            
              set(plot2handle(1), 'XData', time_array, 'YData', ch9R_array);
              set(plot2handle(2), 'XData', time_array, 'YData', ch9IR_array);
                            
              if length(time_array) > 30
                 set(thisax, 'xlim', [time_array((length(time_array) - 20)) time_array(length(time_array))]);
              end

        end
        
        % Channel 10 Time Series
        thisax = handles.axes_ch10;
        plot2handle = get(thisax, 'UserData');
        
        if (isempty(plot2handle))
            
              plot(time_array, ch10R_array, 'r', time_array, ch10IR_array, 'k', 'linewidth', 2, 'Parent', thisax);


              hold(thisax, 'on');

              plot2handle = plot(time_array, ch10R_array, 'r', time_array, ch10IR_array, 'k', 'linewidth', 2, 'Parent', thisax);
              % Plotting the signal over the threshold line
              hold(thisax, 'off');
              set(thisax, 'UserData', plot2handle);

        else
            
              set(plot2handle(1), 'XData', time_array, 'YData', ch10R_array);
              set(plot2handle(2), 'XData', time_array, 'YData', ch10IR_array);
                            
              if length(time_array) > 30
                 set(thisax, 'xlim', [time_array((length(time_array) - 20)) time_array(length(time_array))]);
              end

        end
        
        % Channel 11 Time Series
        thisax = handles.axes_ch11;
        plot2handle = get(thisax, 'UserData');
        
        if (isempty(plot2handle))
            
              plot(time_array, ch11R_array, 'r', time_array, ch11IR_array, 'k', 'linewidth', 2, 'Parent', thisax);


              hold(thisax, 'on');

              plot2handle = plot(time_array, ch11R_array, 'r', time_array, ch11IR_array, 'k', 'linewidth', 2, 'Parent', thisax);
              % Plotting the signal over the threshold line
              hold(thisax, 'off');
              set(thisax, 'UserData', plot2handle);

        else
            
              set(plot2handle(1), 'XData', time_array, 'YData', ch11R_array);
              set(plot2handle(2), 'XData', time_array, 'YData', ch11IR_array);
                            
              if length(time_array) > 30
                 set(thisax, 'xlim', [time_array((length(time_array) - 20)) time_array(length(time_array))]);
              end

        end
        
        % Channel 12 Time Series
        thisax = handles.axes_ch12;
        plot2handle = get(thisax, 'UserData');
        
        if (isempty(plot2handle))
            
              plot(time_array, ch12R_array, 'r', time_array, ch12IR_array, 'k', 'linewidth', 2, 'Parent', thisax);


              hold(thisax, 'on');

              plot2handle = plot(time_array, ch12R_array, 'r', time_array, ch12IR_array, 'k', 'linewidth', 2, 'Parent', thisax);
              % Plotting the signal over the threshold line
              hold(thisax, 'off');
              set(thisax, 'UserData', plot2handle);

        else
            
              set(plot2handle(1), 'XData', time_array, 'YData', ch12R_array);
              set(plot2handle(2), 'XData', time_array, 'YData', ch12IR_array);
                            
              if length(time_array) > 30
                 set(thisax, 'xlim', [time_array((length(time_array) - 20)) time_array(length(time_array))]);
              end

        end
        
        % Channel 13 Time Series
        thisax = handles.axes_ch13;
        plot2handle = get(thisax, 'UserData');
        
        if (isempty(plot2handle))
            
              plot(time_array, ch13R_array, 'r', time_array, ch13IR_array, 'k', 'linewidth', 2, 'Parent', thisax);


              hold(thisax, 'on');

              plot2handle = plot(time_array, ch13R_array, 'r', time_array, ch13IR_array, 'k', 'linewidth', 2, 'Parent', thisax);
              % Plotting the signal over the threshold line
              hold(thisax, 'off');
              set(thisax, 'UserData', plot2handle);

        else
            
              set(plot2handle(1), 'XData', time_array, 'YData', ch13R_array);
              set(plot2handle(2), 'XData', time_array, 'YData', ch13IR_array);
                            
              if length(time_array) > 30
                 set(thisax, 'xlim', [time_array((length(time_array) - 20)) time_array(length(time_array))]);
              end

        end
        
        % Aggregate data for image display
        channel_arrayR = [ch1R, ch2R, ch3R, ch4R, ch5R, ch6R, ch7R, ch8R, ch9R, ch10R, ch11R, ch12R, ch13R];
        channel_arrayIR = [ch1IR, ch2IR, ch3IR, ch4IR, ch5IR, ch6IR, ch7IR, ch8IR, ch9IR, ch10IR, ch11IR, ch12IR, ch13IR];
       
        %% Prepare Heatmap Display in Images in GUI
        
        renderImage(channel_arrayR, handles.axes_HbO2);
        renderImage(channel_arrayIR, handles.axes_HHb);
        
        drawnow();
        
        %% Data Dumping
        % TODO
        
        if length(time_array) > 300
            ch1R_array = ch1R_array((end-100):end);
            ch1IR_array = ch1IR_array((end-100):end);
            ch2R_array = ch2R_array((end-100):end);
            ch2IR_array = ch2IR_array((end-100):end);
            ch3R_array = ch3R_array((end-100):end);
            ch3IR_array = ch3IR_array((end-100):end);
            ch4R_array = ch4R_array((end-100):end);
            ch4IR_array = ch4IR_array((end-100):end);
            ch5R_array = ch5R_array((end-100):end);
            ch5IR_array = ch5IR_array((end-100):end);
            ch6R_array = ch6R_array((end-100):end);
            ch6IR_array = ch6IR_array((end-100):end);
            ch7R_array = ch7R_array((end-100):end);
            ch7IR_array = ch7IR_array((end-100):end);
            ch8R_array = ch8R_array((end-100):end);
            ch8IR_array = ch8IR_array((end-100):end);
            ch9R_array = ch9R_array((end-100):end);
            ch9IR_array = ch9IR_array((end-100):end);
            ch10R_array = ch10R_array((end-100):end);
            ch10IR_array = ch10IR_array((end-100):end);
            ch11R_array = ch11R_array((end-100):end);
            ch11IR_array = ch11IR_array((end-100):end);
            ch12R_array = ch12R_array((end-100):end);
            ch12IR_array = ch12IR_array((end-100):end);
            ch13R_array = ch13R_array((end-100):end);
            ch13IR_array = ch13IR_array((end-100):end);
        end
        
        %% CSV File Writing
        % TODO

    else
        set(handles.streamData,'enable','on');
        set(handles.bt_stop,'enable','off');
        disp('stopped');
        break
    end
    
end

% --- Executes on selection change in COMlist.
function COMlist_Callback(hObject, eventdata, handles)
% hObject    handle to COMlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns COMlist contents as cell array
%        contents{get(hObject,'Value')} returns selected item from COMlists

% --- Executes during object creation, after setting all properties.
function COMlist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to COMlist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
    set(hObject,'Strings',seriallist);
end

% --- Executes on button press in bt_stop.
function bt_stop_Callback(hObject, eventdata, handles)
% hObject    handle to bt_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.streamData,'enable','on');
set(handles.bt_stop,'enable','off');
handles.run=0;
guidata(hObject,handles)

function renderImage(channel_array, axes)

    ch1 = channel_array(1);
    ch2 = channel_array(2);
    ch3 = channel_array(3);
    ch4 = channel_array(4);
    ch5 = channel_array(5);
    ch6 = channel_array(6);
    ch7 = channel_array(7);
    ch8 = channel_array(8);
    ch9 = channel_array(9);
    ch10 = channel_array(10);
    ch11 = channel_array(11);
    ch12 = channel_array(12);
    ch13 = channel_array(13);

    % Step 1: Normalize Values

    % Step 2: Assign Image Color Values to Individual Areas

    img_frame = zeros(500,1700);

    % Channel 1 data assignment
    img_frame((1:100),(100:400)) = ch1;

    % Channel 2 data assignment
    img_frame((1:100),(500:800)) = ch2;

    % Channel 3 data assignment
    img_frame((1:100),(900:1200)) = ch3;

    % Channel 4 data assignment
    img_frame((1:100),(1300:1600)) = ch4;

    % Channel 5 data assignment
    img_frame((100:400),(1:100)) = ch5;

    % Channel 6 data assignment
    img_frame((100:400),(400:500)) = ch6;

    % Channel 7 data assignment
    img_frame((100:400),(800:900)) = ch7;

    % Channel 8 data assignment
    img_frame((100:400),(1200:1300)) = ch8;

    % Channel 9 data assignment
    img_frame((100:400),(1600:1700)) = ch9;

    % Channel 10 data assignment
    img_frame((400:500),(100:400)) = ch10;

    % Channel 11 data assignment
    img_frame((400:500),(500:800)) = ch11;

    % Channel 12 data assignment
    img_frame((400:500),(900:1200)) = ch12;

    % Channel 13 data assignment
    img_frame((400:500),(1300:1600)) = ch13;

    % Step 3: Display Image
    imshow(img_frame, 'Parent', axes);
    colormap(hot);
