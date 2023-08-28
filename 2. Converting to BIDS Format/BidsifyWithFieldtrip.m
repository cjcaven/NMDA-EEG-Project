sub = {'01'};

% Specify age and sex if available
%age = [11  96  nan 77  82  87  18 40  26  80];
%sex = {'f' [] 'f' 'f' 'f' 'm' 'm' 'm' 'm' 'm'};

for subindx=1:numel(sub)

  cfg = [];
  cfg.method    = 'copy';
  cfg.datatype  = 'eeg';

  % specify the input file
  cfg.dataset   = 'subject1.bdf';

  % specify the output directory
  cfg.bidsroot  = 'bids';
  cfg.sub       = sub{subindx};

  % specify general information that will be added to the eeg.json file
  cfg.InstitutionName             = 'Freie Univerität Berlin';
  cfg.InstitutionalDepartmentName = 'MCNB';

  % % provide a task description (the following is as is demonstrated on the fieldtrip website)
  % cfg.TaskName        = 'changedetection';
  % cfg.TaskDescription = 'Subjects were responding as fast as possible upon a change in a visually presented stimulus.';

  % provide EEg-specific information
  cfg.eeg.PowerLineFrequency = 50;   % since recorded in Europe
  % cfg.eeg.EEGReference       = 'M1'; 

   data2bids(cfg);

end
