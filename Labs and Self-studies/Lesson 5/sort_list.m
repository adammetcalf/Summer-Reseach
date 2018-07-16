function [sorted_list, sorted_yob] = sort_list(scientist_list)
% sort_list.m sort a list of people into the correct order in terms of year
% of birth

% Extract the two columns of the cell matrix to give scientist names and
% year of birth
scientist_names = scientist_list{:,1};
scientist_yob = scientist_list{:,2}';

% Call the sort function to return the YOB sorted and the indices for the
% new order
[sorted_yob, sorted_indices] = sort(scientist_yob);

% Sort the scientist names into the correct order
sorted_list = scientist_names(sorted_indices);

end