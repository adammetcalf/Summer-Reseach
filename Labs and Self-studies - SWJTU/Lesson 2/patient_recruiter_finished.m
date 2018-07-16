% patient_recruiter.m sorts through patient data to select patients
% eligible for a trial

% clear the workspace and command window
clc
clear

% load in the patient_data.mat file
load patient_data.mat

% Find the index of the patients that meet the first criteria
patient_index = find(patient_data(2,:) >= 25 & patient_data(2,:) < 40);

% Index just the eligible patients
eligible_patients = patient_data(:,patient_index);

% Now check the second criteria
patient_index = find(eligible_patients(5,:)>39);

% Index the new eligible patients from the previously eligible list.
eligible_patients = eligible_patients(:,patient_index);

% Finally look at the smoking criteria
patient_index = find(eligible_patients(6,:)==1);

chosen_patient = eligible_patients(1,patient_index);

disp(['The eligible patient has a patient ID number of ' num2str(chosen_patient)])