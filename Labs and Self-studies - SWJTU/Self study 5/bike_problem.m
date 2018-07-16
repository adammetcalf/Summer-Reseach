% program for programming task 1: find the solution to an equation using
% the newton raphson method: solve equation 355x-300sinx-n = 0 given n =
% 100.

clc
clear

% initialise two vectors, one for convergence and one for estimates of
% solutions
convergence = zeros(1,15);
solution = zeros(1,15);

% initialise some new variables
step = 1;
x0 = 5;
n = 100;

% place x0 into first value in vector x
solution(1) = x0;

% set change to 100 to ensure while loop runs first time
change = 100;

xold = x0;

% while loop will run until change is less than 0.000001, i.e. the result
% is accurate to 6 decimal places.
while change > 0.000001
    
    % increment index at start of while loop so the resulting index when
    % while loop finishes the index value is correct.
    step = step+1
    
    % call user defined function that returns xnew based on xold and N
    xnew = newton_method(xold,n);
    
    % calculate the absolute change
    change = abs(xnew-xold);
    
    % place it in the vector convergence
    convergence(step) = change;
    
    % xnew to vector x and index plus 1 as first value is the first guess
    solution(step) = xnew;
    
    % place xnew in xold for next loop iteration
    xold = xnew;
    
end

x_final=solution(step);

% plot out the convergence of the solution
figure(1);

solution = solution(1:step);
convergence = convergence(1:step);

% create vector for x-axis
iteration = 0:step-1;

plot(iteration,solution,'r-');
xlabel('iteration')
ylabel('solution x (radians)');

%end

x_final=solution(step);



