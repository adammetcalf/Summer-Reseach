% read_write.m Reads data from a .csv file then writes a selection of that
% data to a new .csv file.

% Clear the workspace
clear;

% Set variable for sample time used in exercise 3.2 Data recorded at 100Hz
dt=0.01;

% Read data from the waterwheel_data_1.csv file using the csvread function. Note
% that the .csv file has a header containing text defining the content of
% each column, this must not be read from the file. 
% Alter the below function such that it reads all the data in the file bar the first row.

data = csvread('file_name.csv', R, C);

% Below you can get just the power by extracting the correct column
% from the data matrix we've just read.

% power_1 = data(r,c) % Uncomment this line by pressing ctrl+T or going to Text -> Uncomment in the menu.

% Next we will read from a second data file but this time we want to just
% read the column containing the power data.



