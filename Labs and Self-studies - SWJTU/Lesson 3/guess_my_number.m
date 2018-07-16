% guess_my_number.m A guessing game for two players.

% Initialise variables

answer = 0;
guess = 0;
number_of_guesses = 0;

% This variable is used for part c
distance_away = 100;
new_distance = 100;

% Display a summary of the game for the users.
disp('This is a guessing game for two players (ensure the Command History and Workspace windows are closed)')

% Request a number from player 1
answer = input('Player 1, enter a number between 1 and 50, not showing player 2: ')

% Clear command window to prevent cheating
clc

% Start the while loop that requests guesses and counts the number of them

while ?????????? % add logic to check that the correct answer had not yet been guessed.
    guess = input('Player 2, try and guess the number player 1 entered: ')
    
    % add a line here to count the number of guesses made.
    
    if ???????? % Add logic for the correct answer.
        disp(['Well done you guessed the correct number of ' num2str(answer) ' in ' num2str(number_of_guesses) ' guesses'])
    elseif ???????? % Add logic for if the guess is higher than the answer.
        disp('Your guess is higher than the answer')
    else
        % What should be added here???
    end
end