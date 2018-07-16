% enforcer.m This m-file will read in some data from an csv file and
% then apply a moving average filter.
clear
clc

% use csvread to gather the data
data = csvread('raw_acceleration.csv', 1, 0);
n = input('Enter the length of the filter: ');

% index the column vectors for time and unfiltered_data
figure(1)
time = data(:,1); 
unfiltered_data = data(:,2);

filtered_data = moving_average_filter(unfiltered_data,n);

% plot the second set of data and add legend
plot(time, unfiltered_data, 'b', time, filtered_data, 'r');
xlabel('time (sec)');
ylabel('acceleration (m/s^2)');
title('Data filter')
legend('unfiltered data', 'filtered data');

% Call the veloicty function.
velocity = calc_velocity(filtered_data);

max_velocity = max(velocity);

% Display the maximum velocity
fprintf('The maximum velocity is %4.4f m/s.\n', max_velocity)

% Plot velocity against time
figure(2)
plot(time, velocity)
xlabel('time (sec)')
ylabel('velocity (m/s)')
