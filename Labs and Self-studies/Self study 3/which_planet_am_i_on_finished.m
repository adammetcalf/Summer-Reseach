% which_planet_am_i_on.m determines which planet I'm on based on escape
% velocity. This represents one way of doing it, see
% which_planet_am_i_on_2.m for an alternative method.

% clear existing data from workspace and clear command window

clear
clc

% load data to workspace

load self_study_3.mat

% start a for loop that will give an index, x, for each planet and then use
% that to index the data in the vectors and cell array and calcutlate and
% display answers

for x = 1:length(planets)
    escape_velocity(x)=sqrt(2*G*mass(x)/radius(x));
    
    % note curly brackets for the cell array
    
    disp(['The escape velocity for ' planets{x} ' is ' num2str(escape_velocity(x)) ' m/s']) 
end

% initialise variables test velocity and increment

test_velocity = 100;
increment = 1;

% get an initial value for escape

escape = check_escape(test_velocity);

%  Use a while loop to increment the test velocity and use the check_escape
%  function to see if it is correct. The loop will stop when escape is
%  true

while escape == false
    test_velocity=test_velocity+increment;
    escape = check_escape(test_velocity);
end

% now we have the escape_velocity needed, we need to check which planet it
% matches. We'll use a for loop to step through each in planet in turn and
% check the value in escape_velocity.

for x = 1:length(planets)
    
    % This if structure uses the conditional statement that will determine
    % which planet matches our test velocity
    
    if test_velocity >= escape_velocity(x) && test_velocity <= (escape_velocity(x)+increment)
        planet_index = x;
    end
end

% display the test velocity
planet_name = planets{planet_index};
disp(['The planet you are on is ' planet_name])

