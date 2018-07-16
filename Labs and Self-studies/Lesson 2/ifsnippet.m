% IFSNIPPET.m A programme to illustrate use of the if statement
% This is used to make a decision in a computer programme
%

% Note clear all the variables in the workspace
clear
clc

%_______________________
% first read in a number from the keyboard
inputnum=input('Enter a number ');


%_______________________
%now for the if structure
%in a natural language: if the number is greater than 5 display a message
if (inputnum > 5)
    disp('Your number is greater than 5');
end

pause

%_______________________
% You can also add an else to this:
% if number is bigger than 5 display a first message, if it`s less display a
% second message

if (inputnum > 5)
    disp('Your number is greater than 5');
else
    disp('Your number is less than or equal to 5');
end

pause

% _______________________
% You can also use logical expressions so:
% if number is bigger than 5 and less than 10 give a message.

if (inputnum > 5) && (inputnum < 10)
    disp('Your number is greater than 5 and less than 10');
end

