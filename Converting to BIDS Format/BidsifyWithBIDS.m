%% Load Data and Convert to BIDS Format with BIDS MATLAB Toolbox
data = load('subject1.bdf');
path =  "C:\Users\jadec\EEG\subject1.bdf"

% Create a BIDS dataset description file
dataset_description = struct();
dataset_description.Name = 'EEG Experiment';
dataset_description.BIDSVersion = '1.6.0';
dataset_description.License = 'CC0';

prebids_file = struct('file', path, 'session', 1, 'run', 1);
bids_export(prebids_file)
bids_export(data, 'output_dir', 'dataset_description', dataset_description);
