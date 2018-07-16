%LOOPEXAMPLE.m A programme to illustrate a for loop
%A for loop is a way of repeating a command a number of times
%

% Note clear all the variables in the workspace and the command window
clear
clc

%_______________________
%This loop counts from 1 to 5 in steps of 1 
%Syntax looks like:   forcounter = first_num:step:last_num

disp('A simple counting loop')
for counter=1:5
    disp(['Value of counter ' num2str(counter)]);
end

disp('Paused, press any key to continue.')
pause %this waits for you to press a key before MATLAB carries on 
clc
%_______________________
% You may want to count up in different steps

disp('Counts up in steps of 2')
for anothercounter =1:2:6
    disp(['Value of anothercount ' num2str(anothercounter)]);
end

disp('Paused, press any key to continue.')
pause
clc
%_______________________
% You can also have non-integer step as you are essentially stepping
% through the values in a vector

disp('Gives a non-integer number on loops')
non_int = [5.6 4.3 2.1 1.1 0.5]; 
for counter=non_int
    disp(['Value of a further counter ' num2str(counter)]);
end
     