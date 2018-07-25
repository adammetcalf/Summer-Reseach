% whileprogram.m A programme to illustrate use of the while statement
% This is used repeat a loop until a condition is met
%

% Note clear all the variables in the workspace
clear;

% Clear the command window
clc;

% Load in the sample temperature data from file
load surface_sample.mat

%Initialise counter
counter = 1;
value = 0;
threshold = 24; %This is the maximum allowed temperature

while (value < threshold)
    value = temperature(counter);
    %increment the counter
    counter = counter +1; 
end
