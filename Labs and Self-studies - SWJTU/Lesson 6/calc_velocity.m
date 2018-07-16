function velocity = calc_velocity(filtered_data)
% This function calculated the velocity of the enforcer through a numerical
% integration mentod

velocity(1) = 0;
% Step through each acceleration value in turn, calculate the area under
% the section and add to running total of velocity.

for index = 2:length(filtered_data)
    velocity(index) = velocity(index-1)+((filtered_data(index)+filtered_data(index-1))/2)*0.002;
end

end