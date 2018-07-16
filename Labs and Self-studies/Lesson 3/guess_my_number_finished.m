% guess_my_number.m A guessing game for two players.

% Initialise variables
best_guess = 0;
guess = 0;
number_of_guesses = 0;

% This variable is used for part c
distance_away = 100;

% Display a summary of the game for the users.
disp('This is a guessing game for two players (ensure the Command History and Workspace windows are closed)')

% Request a number from player 1
answer = input('Player 1, enter a number between 1 and 50, not showing player 2: ')

% Clear command window to prevent cheating
clc;

% Start the while loop that requests guesses and counts the number of them

while answer ~= guess % add logic to check that the correct answer had not yet been guessed.
    guess = input('Player 2, try and guess the number player 1 entered: ');
    
    number_of_guesses = number_of_guesses + 1;
    new_distance = abs(answer - guess);
    % An if/elseif/else structure allows a range of logic to be carried out
    % on each guess. The below has a number of additional elseif to give
    % more information to the player.
    if answer == guess % Adds logic for the correct answer.
        disp(['Well done you guessed the correct number of ' num2str(answer) ' in ' num2str(number_of_guesses) ' guesses'])
    elseif guess > answer && number_of_guesses == 1
        disp('Your guess is higher than the answer')
    elseif guess < answer && number_of_guesses == 1
        disp('Your guess is lower than the answer')    
    elseif new_distance < distance_away && guess > answer
        disp('Your guess is higher than the answer but you are getting closer')
    elseif  new_distance > distance_away && guess > answer
        disp('Your guess is higher than the answer but you are getting further away')
    elseif  new_distance == distance_away && guess > answer
        disp('Your guess is higher than the answer and same the distance away as your previous guess')
    elseif  new_distance < distance_away && guess < answer
        disp('Your guess is lower than the answer but you are getting closer')
    elseif  new_distance == distance_away && guess < answer
        disp('Your guess is lower than the answer and same the distance away as your previous guess')
    else % Remember no conditional statement required.
        disp('Your guess is lower than the answer but you getting further away')
    end
    distance_away = new_distance;
end