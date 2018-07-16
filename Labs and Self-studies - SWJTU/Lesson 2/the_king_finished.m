% the_king.m Uses the switch case structure to display some the lyrics from Blue Suede Shoes but Elvis Presley

song_line = input('Please choose a number between 1 and 3: ');

% switch case structure used to display the relevant line from the song.
switch song_line
	case 1
		disp('One for the money')
	case 2
        disp('Two for the show')
	case 3
        disp('Three to get ready now go cat go!')
    otherwise
        disp('You failed to step on my Blue Suede Shoes, shame on you!')
  end
