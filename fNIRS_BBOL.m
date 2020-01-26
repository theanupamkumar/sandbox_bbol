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

% Bluetooth data parsing variables

data1 = zeros(1,3);
count_t = 1;
data_array = zeros(1,128);

% Setup point of connection

% Get Connection Details
% instrhwinfo('Bluetooth', 'FireFly-1331')
b = Bluetooth('RNBT-602E',1);

% Open Connection
fopen(b)

% Data aggregation variables

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
        
        %% BT CODE
        
        byteValue = fread(b, 1); % Read a byte of data
        %disp(byteValue)
        % Extract value
        if (byteValue == 13)
            data1(1) = byteValue;
            data1(2) = 0;
            data1(3) = 0;
        else
            if (((data1(1) == 13) && (byteValue == 17)) || ((data1(1) == 13) && (byteValue == 11)))
                data1(2) = byteValue;
                data1(3) = 0;
                if (byteValue == 17)
                    chip = 0;
                else
                    chip = 1; % ignore anything else
                end
            else
                if (((data1(1) == 13) && (data1(2) == 17) && (byteValue == 19)) || ((data1(1) == 13) && (data1(2) == 11) && (byteValue == 19)))
                    data1(3) = byteValue;
                    data1(1) = 0;
                    data1(2) = 0;
                else
                    data1(1) = 0;
                    data1(2) = 0;
                    data1(3) = 0;
                end
            end
        end

        if (data1(3) ~= 19)
            data_array(count_t) = byteValue;
            count_t = count_t + 1;
            if (count_t > 128)   % Just precaution
                count_t = 1;
            end
        else
            data1(4) = 0;
            count_t = 1;

            C1R = data_array(1) + 256 * data_array(2) + 65536 * data_array(3) + 256 * 65536 * data_array(4);
            C2R = data_array(5) + 256 * data_array(6) + 65536 * data_array(7) + 256 * 65536 * data_array(8);
            C3R = data_array(9) + 256 * data_array(10) + 65536 * data_array(11) + 256 * 65536 * data_array(12);
            C4R = data_array(13) + 256 * data_array(14) + 65536 * data_array(15) + 256 * 65536 * data_array(16);
            C5R = data_array(17) + 256 * data_array(18) + 65536 * data_array(19) + 256 * 65536 * data_array(20);
            C6R = data_array(21) + 256 * data_array(22) + 65536 * data_array(23) + 256 * 65536 * data_array(24);
            C7R = data_array(25) + 256 * data_array(26) + 65536 * data_array(27) + 256 * 65536 * data_array(28);
            C8R = data_array(29) + 256 * data_array(30) + 65536 * data_array(31) + 256 * 65536 * data_array(32);
            C9R = data_array(33) + 256 * data_array(34) + 65536 * data_array(35) + 256 * 65536 * data_array(36);
            C10R = data_array(37) + 256 * data_array(38) + 65536 * data_array(39) + 256 * 65536 * data_array(40);
            C11R = data_array(41) + 256 * data_array(42) + 65536 * data_array(43) + 256 * 65536 * data_array(44);
            C12R = data_array(45) + 256 * data_array(46) + 65536 * data_array(47) + 256 * 65536 * data_array(48);
            C13R = data_array(49) + 256 * data_array(50) + 65536 * data_array(51) + 256 * 65536 * data_array(52);

            C1IR = data_array(53) + 256 * data_array(54) + 65536 * data_array(55) + 256 * 65536 * data_array(56);
            C2IR = data_array(57) + 256 * data_array(58) + 65536 * data_array(59) + 256 * 65536 * data_array(60);
            C3IR = data_array(61) + 256 * data_array(62) + 65536 * data_array(63) + 256 * 65536 * data_array(64);
            C4IR = data_array(65) + 256 * data_array(66) + 65536 * data_array(67) + 256 * 65536 * data_array(68);
            C5IR = data_array(69) + 256 * data_array(70) + 65536 * data_array(71) + 256 * 65536 * data_array(72);
            C6IR = data_array(73) + 256 * data_array(74) + 65536 * data_array(75) + 256 * 65536 * data_array(76);
            C7IR = data_array(77) + 256 * data_array(78) + 65536 * data_array(79) + 256 * 65536 * data_array(80);
            C8IR = data_array(81) + 256 * data_array(82) + 65536 * data_array(83) + 256 * 65536 * data_array(84);
            C9IR = data_array(85) + 256 * data_array(86) + 65536 * data_array(87) + 256 * 65536 * data_array(88);
            C10IR = data_array(89) + 256 * data_array(90) + 65536 * data_array(91) + 256 * 65536 * data_array(92);
            C11IR = data_array(93) + 256 * data_array(94) + 65536 * data_array(95) + 256 * 65536 * data_array(96);
            C12IR = data_array(97) + 256 * data_array(98) + 65536 * data_array(99) + 256 * 65536 * data_array(100);
            C13IR = data_array(101) + 256 * data_array(102) + 65536 * data_array(103) + 256 * 65536 * data_array(104);

            res1 = data_array(105) + 256 * data_array(106) + 65536 * data_array(107) + 256 * 65536 * data_array(108);
            res2 = data_array(109) + 256 * data_array(110) + 65536 * data_array(111) + 256 * 65536 * data_array(112);
            res3 = data_array(113) + 256 * data_array(114) + 65536 * data_array(115) + 256 * 65536 * data_array(116);
            res4 = data_array(117) + 256 * data_array(118) + 65536 * data_array(119) + 256 * 65536 * data_array(120);
            res5 = data_array(121) + 256 * data_array(122) + 65536 * data_array(123) + 256 * 65536 * data_array(124);
            res6 = data_array(125) + 256 * data_array(126) + 65536 * data_array(127) + 256 * 65536 * data_array(128);

            if (res1 < 1)
                res1 = 1;
            end

            if (res2 < 1)
                res2 = 1;
            end

            if (res3 < 1)
                res3 = 1;
            end

            if (res4 < 1)
                res4 = 1;
            end

            if (res5 < 1)
                res5 = 1;
            end

            if (res6 < 1)
                res6 = 1;
            end

            C1Rn = C1R * 3. / (res1 * 4095.);
            C2Rn = C2R * 3. / (res5 * 4095.);
            C3Rn = C3R * 3. / (res5 * 4095.);
            C4Rn = C4R * 3. / (res3 * 4095.);
            C5Rn = C5R * 3. / (res1 * 4095.);
            C6Rn = C6R * 3. / (res3 * 4095.);
            C7Rn = C7R * 3. / (res5 * 4095.);
            C8Rn = C8R * 3. / (res1 * 4095.);
            C9Rn = C9R * 3. / (res3 * 4095.);
            C10Rn = C10R * 3. / (res3 * 4095.);
            C11Rn = C11R * 3. / (res3 * 4095.);
            C12Rn = C12R * 3. / (res1 * 4095.);
            C13Rn = C13R * 3. / (res1 * 4095.);

            C1IRn = C1IR * 3. / (res2 * 4095.);
            C2IRn = C2IR * 3. / (res6 * 4095.);
            C3IRn = C3IR * 3. / (res6 * 4095.);
            C4IRn = C4IR * 3. / (res4 * 4095.);
            C5IRn = C5IR * 3. / (res2 * 4095.);
            C6IRn = C6IR * 3. / (res4 * 4095.);
            C7IRn = C7IR * 3. / (res6 * 4095.);
            C8IRn = C8IR * 3. / (res2 * 4095.);
            C9IRn = C9IR * 3. / (res4 * 4095.);
            C10IRn = C10IR * 3. / (res4 * 4095.);
            C11IRn = C11IR * 3. / (res4 * 4095.);
            C12IRn = C12IR * 3. / (res2 * 4095.);
            C13IRn = C13IR * 3. / (res2 * 4095.);

            fprintf("\n ==========================");
            fprintf("\n C1R = %0.2f, C1IR = %0.2f", C1Rn, C1IRn);
            fprintf("\n C2R = %0.2f, C2IR = %0.2f", C2Rn, C2IRn);
            fprintf("\n C3R = %0.2f, C3IR = %0.2f", C3Rn, C3IRn);
            fprintf("\n C4R = %0.2f, C4IR = %0.2f", C4Rn, C4IRn);
            fprintf("\n C5R = %0.2f, C5IR = %0.2f", C5Rn, C5IRn);
            fprintf("\n C6R = %0.2f, C6IR = %0.2f", C6Rn, C6IRn);
            fprintf("\n C7R = %0.2f, C7IR = %0.2f", C7Rn, C7IRn);
            fprintf("\n C8R = %0.2f, C8IR = %0.2f", C8Rn, C8IRn);
            fprintf("\n C9R = %0.2f, C9IR = %0.2f", C9Rn, C9IRn);
            fprintf("\n C10R = %0.2f, C10IR = %0.2f", C10Rn, C10IRn);
            fprintf("\n C11R = %0.2f, C11IR = %0.2f", C11Rn, C11IRn);
            fprintf("\n C12R = %0.2f, C12IR = %0.2f", C12Rn, C12IRn);
            fprintf("\n C13R = %0.2f, C13IR = %0.2f", C13Rn, C13IRn);
        
            % Define fNIR Infrared Data Here
            ch1R = C1Rn;
            ch2R = C2Rn;
            ch3R = C3Rn;
            ch4R = C4Rn;
            ch5R = C5Rn;
            ch6R = C6Rn;
            ch7R = C7Rn;
            ch8R = C8Rn;
            ch9R = C9Rn;
            ch10R = C10Rn;
            ch11R = C11Rn;
            ch12R = C12Rn;
            ch13R = C13Rn;

            % Define fNIR Infrared Data Here
            ch1IR = C1IRn;
            ch2IR = C2IRn;
            ch3IR = C3IRn;
            ch4IR = C4IRn;
            ch5IR = C5IRn;
            ch6IR = C6IRn;
            ch7IR = C7IRn;
            ch8IR = C8IRn;
            ch9IR = C9IRn;
            ch10IR = C10IRn;
            ch11IR = C11IRn;
            ch12IR = C12IRn;
            ch13IR = C13IRn;

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

            % CSV File Writing
            % TODO
            
        end
        
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
