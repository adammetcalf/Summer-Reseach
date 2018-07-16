% acceleration from the data recorded

% Clear Command Window and Workspace
clear;
clc;

% Load the .mat file containing all the information
load self_study_2.mat;

% Use abs funtion to get absolute value of all data
buggy_rms = sqrt(mean(acceleration_data.^2));

[best_rms, best_rms_index] = min(buggy_rms);

if best_rms <= 0.5
    mark_best = 5;
elseif best_rms > 0.5 && best_rms <= 1.0
    mark_best = 4;
elseif best_rms > 1.0 && best_rms <= 1.5
    mark_best = 3;
elseif best_rms > 1.5 && best_rms <= 2.0
    mark_best = 2;
else
    mark_best = 1;
end

winning_team = tutors{best_rms_index};

% Display the results
answer=...
sprintf(['%s buggy had the lowest acceleration and gets %i marks.'] ,winning_team, mark_best)