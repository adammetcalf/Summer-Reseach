% return_to_ilkley_moor.m Reads the route taken on the night orienteering social and
% plots it in 3D.

clear;

% First we must determine the number of rows in the data so we can use the
% RNG argument in dlmread. Use the size function to determine this. Due to
% issues with dlmread reading the date format found in the first column, we
% start at C = 1 and R = 1 to not read the header.

data_points = length(dlmread('ilkley_orienteering.txt', '\t',1,1))

% Now we have the size we can use dlmread to get each of the three data
% sets representing UTM Eastings, UTM Northings and altitude. Replace values for
% R1, C1, R2 and C2 in the below functions:

east = dlmread('ilkley_orienteering.txt', '\t', [1, 3, data_points, 3]);
north = dlmread('ilkley_orienteering.txt', '\t', [1, 4, data_points, 4]);
alt = dlmread('ilkley_orienteering.txt', '\t', [1, 5, data_points, 5]);

[max_alt, index_hat]=max(alt);

east_hat = east(1:index_hat);
north_hat = north(1:index_hat);
alt_hat = alt(1:index_hat);

distance = zeros(length(alt_hat),1);

for x = 1:length(north_hat)-1
    
    % This is the part where we find the magnitude, note the triple dots at the end of the first
    % line. We can use those to spread a statement over two lines making it
    % easier to read.
    step_distance = sqrt((east_hat(x+1)-east_hat(x))^2+(north_hat(x+1)...
        -north_hat(x))^2+(alt_hat(x+1)-alt_hat(x))^2);

    % distance at x = 1 should be zero so we start adding the steps at x+1
    distance(x+1) = distance(x)+step_distance;
end


figure(1)
plot(distance, alt_hat);
xlabel('distance travelled (m)')
ylabel('latitude (m)');
title('Plot of altitude against distance travelled')

figure(2)
plot3(east_hat, north_hat, alt_hat);
xlabel('easting (m)')
ylabel('northing (m)');
zlabel('altitude (m)');
title('Plot of route taken')
grid on

solution=sprintf(...
    ['The hat can be found at an altitude of %0.1fm'...
    ' at coordinates of %0.1fm UTM-easting and %0.1fm UTM-northing.\n'...
    'You have to walk %0.1fm to get there.'],...
    alt_hat(end), east_hat(end), north_hat(end), distance(end))