% scientist_sorter.m This program loads a class list from a CSV file and then randomises the order to create a new class list

% Clear workspace and command window
clear
clc

% load in the class_list.csv which contains both string and numeric data,
% to do this we can use textscan. Search the documentation on textscan for
% info.
fileID = fopen('scientist_list.csv');
header = textscan(fileID, '%s %s',1, 'Delimiter', ',');
scientist_list = textscan(fileID, '%s %f', 'Delimiter', ',');

% Close the file.
fclose(fileID);

% You can run the program to see the format of scientist_list before removing the %% at the start of the three lines of code below.

% call your function here to randomise the order of the students
%% [sorted_names, sorted_yob] = sort_list(scientist_list);

%create a table of the two dell arrays and then call fprintf to display.
% In order to work with fprintf, table should end up as a matrix of two rows and 18 columns, if this is not
% the case you may need to transpose the vectors or the table.
%% table = [sorted_names'; num2cell(sorted_yob)];
%% fprintf('Scientist: %18s   Year of birth: %8d\n', table{:}) ;




