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
upperthreshold = 100; %This is the maximum allowed temperature
lowerthreshold = 18; %This is the minimum allowed temperature
x = numel(temperature); %Get the number of elements in the temperature matrix

% With 2 conditional operator brackets may need to be used to ensure 
% correct operation. & operators are given precendence.
while (value<upperthreshold ||value>lowerthreshold) && counter<x
    value = temperature(counter);
    %increment the counter
    counter = counter +1; 
end
