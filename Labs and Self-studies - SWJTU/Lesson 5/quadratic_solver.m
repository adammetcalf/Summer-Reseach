% quadratic_roots.m program for exercise 4.1.2: calculates the type of roots of a quadratic equation

disp('If you have a quadratic equation a*x^2 + b*x + c = 0');
a = input('Enter the coefficient a: ');
b = input('Enter the coefficient b: ');
c = input('Enter constant term c: ');

[d,i] = quadratic(a,b,c); %calls the function quadratic which you must write.

disp(['d = ' num2str(d)]);

% Switch case structure informs the user of the type of roots the equation will
% have.
switch i
    case 0
        disp('Your roots are complex.');
    case 1
        disp('Your roots are repeated.');
    case 2
        disp('Your roots are real and distinct.');
end

