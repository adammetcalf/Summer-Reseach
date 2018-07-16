function varargout = filter_gui(varargin)
%FILTER_GUI M-file for filter_gui.fig
%      FILTER_GUI, by itself, creates a new FILTER_GUI or raises the existing
%      singleton*.
%
%      H = FILTER_GUI returns the handle to a new FILTER_GUI or the handle to
%      the existing singleton*.
%
%      FILTER_GUI('Property','Value',...) creates a new FILTER_GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to filter_gui_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      FILTER_GUI('CALLBACK') and FILTER_GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in FILTER_GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help filter_gui

% Last Modified by GUIDE v2.5 15-Mar-2016 21:28:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @filter_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @filter_gui_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before filter_gui is made visible.
function filter_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for filter_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.plot_data, 'Enable', 'off');

% UIWAIT makes filter_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = filter_gui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in load_data.
function load_data_Callback(hObject, eventdata, handles)
% hObject    handle to load_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Filename = uigetfile('*csv', 'Select data file to load');
data = csvread(Filename, 1,0);
handles.time = data(:,1);
handles.unfiltered_data = data(:,2);
guidata(hObject, handles);
set(handles.plot_data, 'Enable', 'on');


% --- Executes on button press in plot_data.
function plot_data_Callback(hObject, eventdata, handles)
% hObject    handle to plot_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
length_of_filter = get(handles.filter_length, 'String');
n = str2num(length_of_filter);
filtered_data = rolling_average_filter(handles.unfiltered_data, n);

plot(handles.unfiltered_plot, handles.time, handles.unfiltered_data, 'r');
xlabel(handles.unfiltered_plot,'time (sec)')
ylabel(handles.unfiltered_plot,'position (m)')
title(handles.unfiltered_plot,'unfiltered data')

plot(handles.filtered_plot, handles.time, filtered_data, 'b');
xlabel(handles.filtered_plot,'time (sec)')
ylabel(handles.filtered_plot,'position (m)')
title(handles.filtered_plot,'filtered data')


function filter_length_Callback(hObject, eventdata, handles)
% hObject    handle to filter_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of filter_length as text
%        str2double(get(hObject,'String')) returns contents of filter_length as a double


% --- Executes during object creation, after setting all properties.
function filter_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filter_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
