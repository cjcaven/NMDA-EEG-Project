% This script converts EEG data into BIDS format using Fieldtrip.
% This script is based on the template provided by the Fieldtrip website. 

sub = 1;

cfg = [];
cfg.method    = 'copy';
cfg.datatype  = 'eeg';

% specify the input file name, here we are using the same file for every subject
cfg.dataset   = 'subject1.bdf';

% specify the output directory
cfg.bidsroot  = 'bids';
cfg.sub       = sub;

% specify the information for the participants.tsv file
% this is optional, you can also pass other pieces of info
cfg.participants.age = 19;
cfg.participants.sex = 'f';

% specify the information for the scans.tsv file
% this is optional, you can also pass other pieces of info
%cfg.scans.acq_time = datestr(now, 'yyyy-mm-ddThh:MM:SS'); % according to RFC3339

% specify some general information that will be added to the eeg.json file
cfg.InstitutionName             = ' ';
cfg.InstitutionalDepartmentName = ' ';
cfg.InstitutionAddress          = ' ';

% provide the mnemonic and long description of the task
cfg.TaskName        = 'oddballauditoryparadigm';
cfg.TaskDescription = 'Subjects were responding as fast as possible upon a change in a visually presented stimulus.';

% these are EEG specific
cfg.eeg.PowerLineFrequency = 50;   % since recorded in the USA
cfg.eeg.EEGReference       = 'B16'; 

data2bids(cfg);



