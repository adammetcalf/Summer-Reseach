% temperature_process.m undertakes some analysis in a sample of temperature
% across a 20x20mm surface

clc
clear 

% Load in the sample temperature data from file
load surface_sample.mat

% programatically find the size of the data
dimensions = size(temperature);
count = 0;

for a = 1:dimensions(1)
    for b = 1:dimensions(2)
        if temperature(a,b) < 24
            temperature(a,b) = 0;
            count=count+1;
        end
    end
end

% Calculate percentage of samples above room temperature
total_samples = dimensions(1)*dimensions(2);
percent_over = (1-(count/total_samples))*100;

% Display result to the user.
disp(['Percentage of surface over 24degC is ' num2str(percent_over)])
