% quadratic_roots.m program for exercise 4.1.2: calculation of the type of roots of a quadratic equation

disp('If you have a quadratic a*x^2 + b*x + c = 0');
a = input('Enter the coefficient a: ');
b = input('Enter the coefficient b: ');
c = input('Enter constant term c: ');

[d,i,rts] = quadratic(a,b,c); %calls the function you must write.

disp(['d = ' num2str(d)]);

% Switch case structure tells user of the type of roots the equation will
% have.
switch i
    case 0
        disp('Your roots are complex.');
    case 1
        disp('Your roots are repeated.');
    case 2
        disp('Your roots are real and distinct.');
end

rts % Display the roots of the equation (Exercise 4.1.3)

