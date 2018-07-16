%shuffle.m Shuffles a number of songs

% Clear the Workspace and intialise variables.
clear
num_songs = 5;
current_song = 1;
% Create a cell array of strings containing the song titles, notice the
% brackets used.
songs = {'Only living boy...', 'The Boxer', 'Cecilia', 'Bridge over...', 'Mrs Robinson'};
% songs is a list of the available songs.

% While loop checks that the number of songs left is not equal zero
while num_songs ~= 0
	index = ceil(rand*num_songs); % Gets a random index, ceil is used to avoid and index of 0
	playlist{current_song} = songs{index}; % Set the song at that index to be the value in the playlist at current_song index
	songs(index) = []; %clears the value from songs at index.
    current_song = current_song +1; % Increment current_song index.
    num_songs = num_songs - 1; % Decrement num_songs 
end

 playlist % Display playlist