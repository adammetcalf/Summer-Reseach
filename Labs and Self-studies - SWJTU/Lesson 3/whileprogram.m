% whileprogram.m A programme to illustrate use of the while statement
% This is used repeat a loop until a condition is met
%

% Note clear all the variables in the workspace
clear

%Initialise the variables
inputnum=0;
while ( (inputnum>5) && (inputnum<10)  )  
    inputnum = input('Enter a number between 0 and 15: ');
end
disp('The loop has finished - you have entered a number that lies outside 5 and 10')

disp('Press any key to continue')
pause
clc
% You can set a condition on the number of times the loop executes

%initialise the value of counter
counter = 0;
while (counter < 5)
    counter = counter +1;
    disp(['Value of counter: ' num2str(counter) ]);
end



