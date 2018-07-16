% test_bridge.m Program to undertake a quick test of your code. This will
% test your function on two different test, using a different set of breaking loads
% from the breakingLoadTests file, a different truss angle and a different load
% If this works it may not mean your code is complete but it is at least
% partially correct.

% Set up the parameters for test 1.
loadFile = 'breakingLoadTests.csv';
delimiter = ',';
trussAngle = 45;
testLoad = 37;
testNo = 1;
% Call the function, the try catch structure prevents the code from
% stopping if an error occurs.
try
broken_members = breakingBridges(loadFile, delimiter, trussAngle, testNo, testLoad);
if broken_members == 4
    disp('Your code works on test 1 example.')
else 
    disp('Your code runs but gives an incorrect answer for test 1.')
end
catch
    disp('Your code has an error and does not run for test 1.')
end

% Set up the parameters for test 2.
loadFile = 'breakingLoadTests.csv';
delimiter = ',';
trussAngle = 50;
testLoad = 200;
testNo = 3;
% Call the function again.
try
broken_members = breakingBridges(loadFile, delimiter, trussAngle, testNo, testLoad);
if broken_members == 10
    disp('Your code works on test 2 example.')
else 
    disp('Your code runs but gives an incorrect answer for test 2.')
end
catch
    disp('Your code has an error and does not run for test 2.')
end