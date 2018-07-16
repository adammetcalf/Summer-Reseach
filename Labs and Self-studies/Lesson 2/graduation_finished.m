% graduation.m Tells the user what their predicted degree class will be
% based on average module mark.

clc
clear

% Ask user for their average module mark
average_mark = input('Please enter your average module mark: ');

% Use if/elseif/else structure to inform the user of their predicted grade
% based on grade boundries.
if average_mark >= 70
    disp('Well done, you are heading for a first class degree')
elseif average_mark >= 60 && average_mark < 70
    disp('You are predicted a 2(1) degree')
elseif average_mark >= 50 && average_mark < 60
    disp('You are predicted a 2(2) degree')
 elseif average_mark >= 40 && average_mark < 50
    disp('You are predicted a 3rd class degree')
else
   disp('Unfortunately it looks like you might fail') 
end