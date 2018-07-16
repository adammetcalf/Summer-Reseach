% Bridge_solver.m Solves a set of simultaneous equations that model a truss
% bridge structure.

clear
clc

% create variables to make matrix quicker to form.
c = cosd(45);
s = sind(45);

% Set external loading as a variable
Total_load = 300;
F=Total_load/6;
  
% Define the coefficient matrix
A = [c 1 0 0 0 0 0 0 0 0 0 0 0 0 0 1;
    s 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 ;
    -c 0 0 c 1 0 0 0 0 0 0 0 0 0 0 0;
    -s 0 -1 -s 0 0 0 0 0 0 0 0 0 0 0 0;
    0 -1 0 0 0 1 0 0 0 0 0 0 0 0 0 0;
    0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0;
    0 0 0 0 -1 0 0 1 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0 0;
    0 0 0 -c 0 -1 0 0 c 1 0 0 0 0 0 0;
    0 0 0 s 0 0 1 0 s 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 -1 -c  0 0 0 c 0 0 0;
    0 0 0 0 0 0 0 0 -s 0 0 -1 -s 0 0 0;
    0 0 0 0 0 0 0 0 0 -1 1 0 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0;
    0 0 0 0 0 0 0 0 0 0 -1 0 -c 0 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 s 0 1 0];

% Define the External loading column vector
b = [0; 0; 0; 0; 0; F; 0; 0; 0; F; 0; 0; 0; F; 0; 0];

% Solve using left backslash operator
x=A\b;

% Create a list of strings for display purposes
x_names = {'  F1', '  F2', '  F3', '  F4', '  F5', '  F6', '  F7', '  F8', '  F9', ' F10', ' F11', ' F12', ' F13', 'Fry1', 'Fry2', 'Frx1'};

% Use a for loop to display each member force
for index = 1:length(x)
    fprintf('The loading in  %s is %6.1f N\n', x_names{index}, x(index))
end

