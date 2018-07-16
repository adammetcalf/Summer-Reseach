function varargout = spirograph(varargin)
% SPIROGRAPH MATLAB code for spirograph.fig
%      SPIROGRAPH, by itself, creates a new SPIROGRAPH or raises the existing
%      singleton*.
%
%      H = SPIROGRAPH returns the handle to a new SPIROGRAPH or the handle to
%      the existing singleton*.
%
%      SPIROGRAPH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPIROGRAPH.M with the given input arguments.
%
%      SPIROGRAPH('Property','Value',...) creates a new SPIROGRAPH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before spirograph_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to spirograph_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help spirograph

% Last Modified by GUIDE v2.5 02-Apr-2015 12:21:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @spirograph_OpeningFcn, ...
                   'gui_OutputFcn',  @spirograph_OutputFcn, ...
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


% --- Executes just before spirograph is made visible.
function spirograph_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to spirograph (see VARARGIN)

% Choose default command line output for spirograph
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes spirograph wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = spirograph_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in draw_graph.
function draw_graph_Callback(hObject, eventdata, handles)
% hObject    handle to draw_graph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ra = get(handles.r_value_a,'Value');
ka = get(handles.k_value_a,'Value');
la = get(handles.l_value_a,'Value');
ta = get(handles.t_value_a,'Value');
list=get(handles.colour_a,'String');
val=get(handles.colour_a,'Value');
coloura=list{val};
switch coloura
    case 'Red'
        coloura = [1 0 0];
    case 'Blue'
        coloura = [0 0 1];
    case 'Green'
        coloura = [0 1 0];
    case 'Magenta'
        coloura = [1 0 1];
    case 'Yellow'
        coloura = [1 1 0];
    case 'Black'
        coloura = [0 0 0];
    case 'Cyan'
        coloura = [0 1 1];
end
rb = get(handles.r_value_b,'Value');
kb = get(handles.k_value_b,'Value');
lb = get(handles.l_value_b,'Value');
tb = get(handles.t_value_b,'Value');
list=get(handles.colour_b,'String');
val=get(handles.colour_b,'Value');
colourb=list{val};
switch colourb
    case 'Red'
        colourb = [1 0 0];
    case 'Blue'
        colourb = [0 0 1];
    case 'Green'
        colourb = [0 1 0];
    case 'Magenta'
        colourb = [1 0 1];
    case 'Yellow'
        colourb = [1 1 0];
    case 'Black'
        colourb = [0 0 0];
    case 'Cyan'
        colourb = [0 1 1];
end
xa = sym('r*((1-k)*cos(t)+l*k*cos(((1-k)/k)*t))');
xa = subs(xa, {'r', 'k', 'l'}, {ra, ka, la});
ya = sym('r*((1-k)*sin(t)-l*k*sin(((1-k)/k)*t))');
ya = subs(ya, {'r', 'k', 'l'}, {ra, ka, la});
xb = sym('r*((1-k)*cos(t)+l*k*cos(((1-k)/k)*t))');
xb = subs(xb, {'r', 'k', 'l'}, {rb, kb, lb});
yb = sym('r*((1-k)*sin(t)-l*k*sin(((1-k)/k)*t))');
yb = subs(yb, {'r', 'k', 'l'}, {rb, kb, lb});
axis(handles.axes1, 'equal');
h = ezplot(xa, ya, [0,ta]);
xData = get(h(1),'XData');
nPoints = numel(xData)
set(h, 'Color', coloura);
hold(handles.axes1, 'on');
h = ezplot(xb, yb, [0,tb]);
set(h, 'Color', colourb);
hold(handles.axes1, 'off');
title('');

% --- Executes on slider movement.
function l_value_b_Callback(hObject, eventdata, handles)
% hObject    handle to l_value_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

val = get(handles.l_value_b,'Value'); 
str = sprintf('%3.2f',val);
set(handles.l_display_b, 'String', str);


% --- Executes during object creation, after setting all properties.
function l_value_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l_value_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function l_value_a_Callback(hObject, eventdata, handles)
% hObject    handle to l_value_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

val = get(handles.l_value_a,'Value'); 
str = sprintf('%3.2f',val);
set(handles.l_display_a, 'String', str); 


% --- Executes during object creation, after setting all properties.
function l_value_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l_value_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in colour_a.
function colour_a_Callback(hObject, eventdata, handles)
% hObject    handle to colour_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns colour_a contents as cell array
%        contents{get(hObject,'Value')} returns selected item from colour_a


% --- Executes during object creation, after setting all properties.
function colour_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colour_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function r_value_a_Callback(hObject, eventdata, handles)
% hObject    handle to r_value_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

val = get(handles.r_value_a,'Value'); 
str = sprintf('%3.2f',val);
set(handles.r_display_a, 'String', str); 


% --- Executes during object creation, after setting all properties.
function r_value_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r_value_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function k_value_a_Callback(hObject, eventdata, handles)
% hObject    handle to k_value_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

val = get(handles.k_value_a,'Value'); 
str = sprintf('%3.2f',val);
set(handles.k_display_a, 'String', str);


% --- Executes during object creation, after setting all properties.
function k_value_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k_value_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function t_value_a_Callback(hObject, eventdata, handles)
% hObject    handle to t_value_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

val = get(handles.t_value_a,'Value'); 
str = sprintf('%3.0f',val);
set(handles.t_display_a, 'String', str);


% --- Executes during object creation, after setting all properties.
function t_value_a_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t_value_a (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function r_value_b_Callback(hObject, eventdata, handles)
% hObject    handle to r_value_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

val = get(handles.r_value_b,'Value'); 
str = sprintf('%3.2f',val);
set(handles.r_display_b, 'String', str);


% --- Executes during object creation, after setting all properties.
function r_value_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r_value_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function k_value_b_Callback(hObject, eventdata, handles)
% hObject    handle to k_value_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

val = get(handles.k_value_b,'Value'); 
str = sprintf('%3.2f',val);
set(handles.k_display_b, 'String', str);


% --- Executes during object creation, after setting all properties.
function k_value_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to k_value_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function t_value_b_Callback(hObject, eventdata, handles)
% hObject    handle to t_value_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

val = get(handles.t_value_b,'Value'); 
str = sprintf('%3.0f',val);
set(handles.t_display_b, 'String', str);


% --- Executes during object creation, after setting all properties.
function t_value_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t_value_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in colour_b.
function colour_b_Callback(hObject, eventdata, handles)
% hObject    handle to colour_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns colour_b contents as cell array
%        contents{get(hObject,'Value')} returns selected item from colour_b


% --- Executes during object creation, after setting all properties.
function colour_b_CreateFcn(hObject, eventdata, handles)
% hObject    handle to colour_b (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
