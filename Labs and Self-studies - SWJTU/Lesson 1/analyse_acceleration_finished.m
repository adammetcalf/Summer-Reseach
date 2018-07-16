% analyse_acceleration.m Finds the buggy with the highest vertical
% acceleration from the data recorded

% Clear Command Window and Workspace
clear;
clc;

% Load the .mat file containing all the information
load acceleration_data.mat;

% Use abs function to get absolute value of all data
abs_acceleration_data = abs(acceleration_data);

% Find the maximum acceleration of each buggy (column data) by using a
% single output argument
buggy_max_acc = max(abs_acceleration_data);

% Now find which of the buggies had the highest but using the max function
% again but with two output arguments, the first being the highest
% acceleration and the secod being the index i.e. buggy number that
% measured it.
[max_acc,buggy_index] = max(buggy_max_acc);

% Use the display function to give the solution on the Command Window, note
% the use of num2str function as the numeric value is changed to a string. 
disp(['Buggy ' num2str(buggy_index) ' had the highest vertical accelerations of ' num2str(max_acc) 'm/s^2.']);

% Bouns task: Get the 4th column of data from the original data
buggy_4 = acceleration_data(:,4);

% Find the RMS value, note the use of the dot operator as you wish to
% square each value by itself not multiply the vector by itself using
% matrix multiplication.
buggy_4_rms = sqrt(mean(buggy_4.^2));

% Again display the result.
disp(['Buggy 4 had an rms vertical accelerations of ' num2str(buggy_4_rms) 'm/s^2.']);