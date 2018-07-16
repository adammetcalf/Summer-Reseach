% determine_youngs.m A program for programming functions task 1: calculation of young's modulus

F = input('Enter the applied force (N): ');
A = input('Enter the cross-sectional area (m^2): ');
L = input('Enter original length (m): ');
delL = input('Enter the increase in length (m): ');

% Call the user-defined function young, which you will write 
modulus = young(F,A,L,delL);

% Display the result
disp(['Young`s Modulus is: ' num2str(modulus) ' Pa']);
