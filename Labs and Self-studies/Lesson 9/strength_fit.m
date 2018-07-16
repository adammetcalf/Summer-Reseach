% strength_fit.m Program creates line of best fit for bridge members

clc
clear

% Read in the three data sets for the tensile and compressor tests
tensile_data = csvread('tensile_test.csv', 1,0);

comp_6x10_data = csvread('comp_test_6x10.csv', 1,0);

comp_10x10_data = csvread('comp_test_10x10.csv', 1,0);

% Separate the columns

width = tensile_data(:,1);
tensile_breaking = tensile_data(:,2);

length_6x10 = comp_6x10_data(:,1);
comp_6x10_breaking = comp_6x10_data(:,2);

length_10x10 = comp_10x10_data(:,1);
comp_10x10_breaking = comp_10x10_data(:,2);

% Use polyfit to get a line of best fit
tensile_coeffs = polyfit(width, tensile_breaking, 1);

comp_6x10_coeffs = polyfit(length_6x10, comp_6x10_breaking, 1);

comp_10x10_coeffs = polyfit(length_10x10, comp_10x10_breaking, 1);

% Evaluate the function to get fitted curve
tensile_fit = polyval(tensile_coeffs, width);

comp_6x10_fit = polyval(comp_6x10_coeffs, length_6x10);

comp_10x10_fit = polyval(comp_10x10_coeffs, length_10x10);

% Display equations to user using fprintf.

fprintf('Line of fit for tensile members is f = %4.4f*w + %4.4f \n', tensile_coeffs)
fprintf('Line of fit for 6x10 compression members is f = %4.4f*l + %4.4f \n', comp_6x10_coeffs)
fprintf('Line of fit for 10x10 compression members is f = %4.4f*l + %4.4f \n', comp_10x10_coeffs)

% Plot original data against line of best fit
figure(1)

plot(width, tensile_breaking, 'o',width, tensile_fit)
xlabel('width (mm)')
ylabel('breaking load (N)')
title('Tensile breaking load tests')

figure(2)

plot(length_6x10, comp_6x10_breaking, 'o', length_6x10, comp_6x10_fit)
xlabel('length (mm)')
ylabel('breaking load (N)')
title('6x10 compressive breaking load tests')

figure(3)

plot(length_10x10, comp_10x10_breaking, 'o',length_10x10, comp_10x10_fit)
xlabel('length (mm)')
ylabel('breaking load (N)')
title('10x10 compressive breaking load tests')