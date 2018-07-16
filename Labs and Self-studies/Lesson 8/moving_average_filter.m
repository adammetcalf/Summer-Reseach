function filtered_data = moving_average_filter(data, num_averages)
% MOVING_AVERAGE_FILTER takes the input matrix, data, and applies a rolling average filter of length number of averages.

 % create for loop that will run for each point in the data.
for index=1:length(data)
        xn = index-num_averages;
    % index = 1, we set the filtered data to first value in data as we don't
    % have a filtered_data value at n-1.
    if index == 1 
        filtered_data(1) = data(1);
    else
        % check if xn is less than 1, i.e. we don't have an index value, in
        % which case we just use the first value in data.

    if xn < 1
        xn = 1;
    end
    % implement the filter
    filtered_data(index) = filtered_data(index-1) + (data(index)-data(xn))/num_averages;
    end
end