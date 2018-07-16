% test_steam.m Program to undertake a quick test of your code. This will
% test your function on a single test for one value from the steam table.
% If this works it may not mean your code is complete but it is at least
% partially correct and will give feedback in scriptcheck.

steamTableFilename = 'SteamTable.csv';
delimiter = ',';
pressure = 20;
steamQuality = 0.5;

% The try structure will attempt to run a section of code, if it runs then
% the code jumps to the end of the try structure and runs the code below,
% if there is an error in your code within the try section that would
% normally cause the cose to stop, then the catch section of code runs.
% This is useful for error checking and is used extensively within
% scriptcheck.
try %tries this section of code first
density=findDensity(steamTableFilename, delimiter, pressure, steamQuality);
if density == 250
    disp('Your code works on this one example.')
else 
    disp('Your code runs but has returned an incorrect result for density.')
end
catch % if above section causes an error, this ection runs.
    disp('Your code has an error and does not run.')
end
