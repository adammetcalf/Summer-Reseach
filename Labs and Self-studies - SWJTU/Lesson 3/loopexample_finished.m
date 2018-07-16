 %LOOPEXAMPLE.m A programme to illustrate a for loop
%A for loop is a way of repeating a command a number of times
%

% Note clear all the variables in the workspace
clear


%_______________________
%This loop counts from 1 to 5 in steps of 1 
%Syntax looks like:   forcounter = first_num:step:last_num

disp('A simple counting loop')
for counter=1:1:5
    disp(['Value of counter ' num2str(counter)]);
end

pause(2) %this waits for you to press a key before MATLAB carries on 

%_______________________
% You may want to count up in different steps

disp('Counts up in steps of 2')
for anothercounter =1:2:6
    disp(['Value of anothercount ' num2str(anothercounter)]);
end

pause(2)

%_______________________
% You can also have non-integer step as you are essentially stepping
% through the values in a vector

disp('Gives a non-integer number on loops')
non_int = [5.6 4.3 2.1 1.1 0.5];
for counter=non_int
    disp(['Value of counter ' num2str(counter)]);
end
    
pause(2)

%_______________________
%Count from 20 to 30 in steps of three (Exercise 2.2.2a)

disp('Counts up from 20 to 30 is steps of 3')
for anothercounter =20:3:30
    disp(['Value of anothercount ' num2str(anothercounter)]);
end

pause(2)

%_______________________
%Count from 30 to 20 in steps of -1 (Exercise 2.2.2b)

disp('Counts down from 30 to 20 is steps of 1')
for anothercounter =30:-1:20
    disp(['Value of yet anothercount ' num2str(anothercounter)]);
end

pause(2)

%_______________________
%Count from 0 to pi in steps of pi/8 (Exercise 2.2.2c) 

disp('Counts up from 0 to pi is steps of pi/8')
for anothercounter =0:pi/8:pi
    disp(['Value of anothercount ' num2str(anothercounter)]);
end

pause(2)

%_______________________
% Example of a nested loop(Exercise 2.2.3a) 
disp('Nest loops')
for counter1 =1:1:5 %this is the start of the first loop
    for counter2 =1:1:6 %this is the start of the second loop
        disp(['Value of counter1 (outer loop) ' num2str(counter1) ' and value of counter2 (inner loop) ' num2str(counter2)]);
        result(counter1,counter2) = counter1*counter2; 
    end %this is the end of the second loop
end %this is the end of the first loop

