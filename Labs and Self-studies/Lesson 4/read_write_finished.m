% read_plot.m Reads data from a .csv file then writes a selection of that
% data to a new .csv file and plots the data on a 2D plot.

% Clear the workspace
clear;

% Set variable for sample time used in exercise 3.2 Data recorded at 150Hz
dt=0.01;

% Read data from the waterwheel_data.csv file using the csvread function. Note
% that the .csv file has a header containing text defining the content of
% each column, this must not be read from the file. 
% Alter the below function such that it reads all the data in the file bar the first row.

data = csvread('whaterwheel_data_1.csv', 1, 0);

% Below you can get just the power by extracting the column
% from the data matrix we've just read.

power_1 = data(:,2); 

% Next we will read from a second data file but this time we want to just
% read the column containing the power data.

% First we determine the size of the data:

s = size(csvread('waterwheel_data_2.csv', 1, 0));

% Now we read the data using s(1) as an index in the range argument of csvread.

power_2 = csvread('waterwheel_data_2.csv', 1, 1, [1,1,s(1),1]);

% Now save the data in power_1 to file using csvwrite

csvwrite('power_data.csv', power_1, 0, 0);




