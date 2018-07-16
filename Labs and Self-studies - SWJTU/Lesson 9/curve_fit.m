% curve_fit.m Fits a curve to some data

clear
clc

data = csvread('position_data.csv');
time = data(:,1);
position = data(:,2);
plot(time, position, 'o')
xlabel('time')
ylabel('buggy position (m)')
hold on

coeffs_2 = polyfit(time, position, 2);
coeffs_3 = polyfit(time, position, 3);
coeffs_4 = polyfit(time, position, 4);
coeffs_5 = polyfit(time, position, 5);

position_2 = polyval(coeffs_2, time);
position_3 = polyval(coeffs_3, time);
position_4 = polyval(coeffs_4, time);
position_5 = polyval(coeffs_5, time);

plot(time, position_2, time, position_3, time, position_4, time, position_5)

legend('Measured data', '2^n^d order approx.', '3^r^d order approx.','4^t^h order approx.','5^t^h order approx.')

squared_error(1) = sum((position_2-position).^2);
squared_error(2) = sum((position_3-position).^2);
squared_error(3) = sum((position_4-position).^2);
squared_error(4) = sum((position_5-position).^2);

squared_error
