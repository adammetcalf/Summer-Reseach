% surface_plot.m Reads data from a .csv file then displays the data in a
% surface plot.

% Clear the workspace
clear;

% Set variables for the resolution of the samples which is 5mm in each
% direction.
dx = 0.005;
dy = 0.005;

% Read in the CSV file containing the force data for area of interest
force = dlmread('area_of_interest.txt', '\t');

% Get the dimensions of the data, we need this to build the vectors for x
% and y positions.
dimensions = size(force);

% Create 2 vectors that start at zero and go up to dimensions - 1 * dx or
% dy. Remember x should be the length of the number of columns in the data
% while y should be the number of rows.
x = dx*(0:dimensions(2)-1);

max_y = dx*(dimensions(1)-1);
y = 0:dx:max_y;


surf(x,y,force) % Create a surface plot using the two vectors x and y and area as the output
xlabel('X position (mm)');
ylabel('Y Position (mm)');
shading interp
zlabel('Force (N)')





