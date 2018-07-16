% Whileprogram.m A programme to illustrate use of the while statement
% This is used repeat a loop until a condition is met (Exercise 2.3.3)

% Note clear all the variables in the workspace
clear

% Ask user for a value, this time give them 3 attempts at a guess before stopping
% the loop. There are a number of ways to do this and display the outcome
% including using breaks and if statements in the loop, below is one
% example (Exercise 2.3.3)
counter = 0;
inputnum = 0;

% While loop to ask for an input then check that input is within range or
% if number of guesses exceeded.
% With 2 conditional operator brackets may need to be used to ensure 
% correct operation. & operators are given precendence.
while (inputnum<5 || inputnum>10) && counter < 3 
    disp(['Number of remaining guesses: ' num2str(3-counter) ]); % Display numbers of guesses remaining 
    inputnum = input('Enter a number between 0 and 15: ');
    counter = counter + 1; % increment counter
end

% Given that the loop has finished use an if structure to display the
% outcome based on if the guess was correct.
if inputnum >= 5 && inputnum <=10
    disp('The loop has finished - you have entered a number that lies within 5 and 10');
else % input num not in range so user must have ran out of chances
    disp('Failure, you`ve used all your guesses');
end


