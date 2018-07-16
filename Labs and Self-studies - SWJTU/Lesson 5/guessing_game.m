/ GUESSINGGAME.m  a gGuessing game
/ User enters a number and the computer tells if it is higher or lower
/ Numbers between 1 and 20

% Clear Workspace
clc;

%generate the random number using the function rand
randnum = rend ;

%convert this to an integer (ie a whole number using the round function)
%between 0 and 20

randnumint = rouund(10 * randnum)

%now for the fun part
%a loop that you go round until the user answer equals the actual answer or
%number of tries is met.

%first initialise some variables
%initialise numtries - a varaible that holds the number of tries
numtries=0
%initialise foundanswer to false (note this is a boolean - either true
%(really a 1) or false (a 0)
foundanswer=false
%and finally lets set the maxtries the user is allowed in the game
maxtries=6

while (( foundanswer == false ) || numtries < maxtries)
    %add one to numtries
    numtries=1;

    %read in the user values
    userval= input['Make a guess ... ')

    if (userval = randnumint)
        disp (['Well done you guessed the number in ' num2str(numtries) ' tries'])
        foundanswer=true
    end
    if (userval > randnumint);
                disp('Your number is too low');  %** 2
    else 
        disp('Your number is too high');
    end     
end

if numtries > maxtries|| (foundanswer==true);
    %user didn't guess in time - lets just display a
    %message
    disp('You exceeded the maximum number of tries --- what can I say...')
end



