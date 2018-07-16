% howold.m Calculates how long you've been alive in days, hours, minutes and seconds.

% Set an array of the number of days in each month
days_in_month = [31 28 31 30 31 30 31 31 30 31 30 31]; 

% Use clock function to return an array containing current time and date.
time_and_date=clock;

%Assign the values in the array to the variables
year_today=time_and_date(1);
month_today=time_and_date(2);
days_today=time_and_date(3);
hours_today=time_and_date(4);
minutes_today=time_and_date(5);
seconds_today=time_and_date(6);

% initialises some variables
TF = 0;


% Request user input and then checks to see the user value is correct, if incorrect ends program using return 
month_birth = input('\nPlease enter the month of your birth as a number: ');
if month_birth <= 0 || month_birth > 12
    disp('Don`t you know there are only twelve months in the year, please start again entering a number between 1 and 12.');
    return
end

TF = 0; % Reset variable for leapyear

% Request user input and then checks to see the user value is 29th february, if it is, user is prompted to confirm it is a leap year, if no, program ends 
days_birth = input('\nPlease enter the day of the month of your birthday: ');
if month_birth == 2 && days_birth == 29
        leapyear = input('\nWas it a leap year? (yes/no): ','s');
        TF = strcmp(leapyear,'yes');
        if TF ~= 1
            disp('It was not a leap year so February only has 28 days, please start again.');
            return 
        end
end
if (days_birth <= 0 || days_birth > days_in_month(month_birth)) && TF ~= 1
    disp('That number of days is incorrect for the month you entered, please start again.');
    return
end

% Request user input and then checks to see the user value is correct, if incorrect ends program using return         
year_birth = input('\nPlease enter the year of your birth in full: ');
if year_birth < 1900
    disp('Can I just say how good you look for your age, but unfortunately I can`t work out your age in days...');
return

% Check that the current year is greater than the year of birth
elseif year_birth > year_today 
    disp('You appear to have not been born yet, how you are attending unversity I have no idea!')
else
    month_calc_today = month_today - 1;
    month_calc_birth = month_birth - 1;
    month_days_today = 0;
    month_days_birth = 0;
    leapyear_days_today = 0;
    leapyear_days_birth = 0;
    
    % while loop counts backwards each month adding the total number of
    % days as defined in days_in_month
    while month_calc_today ~= 0
        month_days_today = month_days_today + days_in_month(month_calc_today);
        month_calc_today = month_calc_today - 1;
    end
    
    % checks if is after February so it can include the current year in the
    % leapyear_days calculation
    if month_today >= 3
    leapyear_days_today = (year_today - 1900)/4;
    else
        leapyear_days_today = (year_today - 1900 - 1)/4;
    end
    
    % Rounds down the value to get total number of leapear days
    leapyear_days_today = fix(leapyear_days_today); 
    
    % calculate the total number of days since 01/01/1900 and displays the
    % answer
    days_since_1900 = (days_today - 1) + leapyear_days_today + month_days_today + 365*(year_today - 1901);
    
    % disp(['There have been ' num2str(days_since_1900) ' days since the beginning of the year 1900.']);
    
    % while loop counts backwards each month adding the total number of
    % days as defined in days_in_month
    while month_calc_birth ~= 0
        month_days_birth = month_days_birth + days_in_month(month_calc_birth);
        month_calc_birth = month_calc_birth - 1;
    end
    
    % checks if is after February so it can include the current year in the
    % leapyear_days calculation
    if month_birth >= 3
    leapyear_days_birth = (year_birth - 1900)/4;
    else
        leapyear_days_birth = (year_birth - 1900 - 1)/4;
    end
    
    % Rounds down the value to get total number of leapear days
    leapyear_days_birth = fix(leapyear_days_birth);
    
    % calculate the total number of days since 01/01/1900 and displays the
    % answer
    days_from_1900_to_birth = (days_birth - 1) + leapyear_days_birth + month_days_birth + 365*(year_birth - 1901);
    
    % disp(['You were born ' num2str(days_from_1900_to_birth) ' days after the beginning of the year 1900.']);
    
    % Subtract one answer from the other to get total days and display
    % answer
    days_alive = days_since_1900 - days_from_1900_to_birth;
    
    % assuming you were born at midday adjust days and hours accordingly
    if hours_today >= 12
        days_alive = days_alive + 1;
        hours_today = hours_today - 12;
    else
        hours_today = hours_today +12;
    end
        
    % check to see if quantities should be plural
    if hours_today == 1
        plural_hours='hour';
    else
        plural_hours='hours';
    end
    
    if minutes_today == 1
        plural_minutes='minute';
    else
        plural_minutes='minutes';
    end
    
    if minutes_today == 1
        plural_seconds='second';
    else
        plural_seconds='seconds';
    end
    
    disp(['It is now ' num2str(days_alive) ' days, ' num2str(hours_today) ' ' plural_hours ', ' num2str(minutes_today) ' ' plural_minutes ' and ' num2str(seconds_today) ' ' plural_seconds ' since you were born,']);
    disp('(assuming you were born at midday). Congratulations!');
end