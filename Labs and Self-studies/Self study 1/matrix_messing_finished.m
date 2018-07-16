% matrix_messing.m Learning to manipulate arrays.

% clear current workspace values
clear; 

% load the variables from the .mat file to the workspace
load self_study_1.mat

% Get the dimensions of data using size function
dimensions = size(data); 

% Use scalar values to set gain and offset of data
scaled_data = data * gain + offset;

% Get the values from the first row of the data
first_row = scaled_data(1,:);

% Remove the last row of the data by setting it to a blank array
scaled_data(end,:) = [];

% Set valaue in row 7, column 3 to 15
scaled_data(7,3) = 15;

% replace the data in row 5 with the vector first_row
scaled_data(5,:) = first_row;

% Extract middle 3 columns, assumes odd number of columns, if not takes
% three columns closest to centre from start.
middle_columns = scaled_data(:,(floor(((dimensions(2)-3)/2))+1):(floor(((dimensions(2)-3)/2))+3));

% get absolute values of middle columns
abs_middle_columns = abs(middle_columns);

% sum columns, then sum vector
total = sum(sum(abs_middle_columns));

% display total
disp(['The value to display is: ' num2str(total)]);



