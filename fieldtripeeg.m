% This script performs a pipeline to processes eeg data.


% Load data
filename = './bids/sub-/eeg/sub-_task-oddballauditoryparadigm_eeg.bdf'; 
trialdef = load('trialdef.mat');

% Define Trials 
cfg = [];
cfg.dataset = filename;
cfg.trialfun = 'ft_trialfun_general';
cfg.trialdef.eventvalue = [1 3];
fg.trialdef.prestim        = 1; % in sec
cfg.trialdef.poststim       = 2; % in sec

cfg = ft_definetrial(cfg);


% Custom montage
cfg.montage.labelold = {'EXG1' 'EXG2' 'EXG3'};
cfg.montage.labelnew = {'HEOG' 'VEOG' 'EXG3'};
data_exg = ft_preprocessing(cfg);


% High-pass filtering

cfg = []; 
cfg.hpfilter = 'yes';
cfg.hpfreq = 0.1; 
cfg.hpfilttype = 'firws';


% Downsampling
cfg = []; 
cfg.resamples = 200; 

% Low-pass filter 
cfg = []; 
cfg.lpfilter = 'yes';
cfg.lpfreq = 30; 
cfg.lpfilttype = 'firws';

% Epoching
cfg = [];
cfg.trl = trialdef.trl;
data_all = ft_redefinetrial(cfg,data_all);

% Artefact handling 
cfg.artfctdef.zvalue.cutoff      = 4;
cfg.artfctdef.zvalue.trlpadding  = 0;
cfg.artfctdef.zvalue.artpadding  = 0.1;
cfg.artfctdef.zvalue.fltpadding  = 0;
cfg.artfctdef.zvalue.cutoff       = 4;
cfg.artfctdef.zvalue.trlpadding   = 0;
cfg.artfctdef.zvalue.fltpadding   = 0;
cfg.artfctdef.zvalue.artpadding   = 0.1;
cfg.artfctdef.zvalue.bpfilter     = 'yes';
cfg.artfctdef.zvalue.bpfilttype   = 'but';
cfg.artfctdef.zvalue.hilbert      = 'yes';
cfg.artfctdef.zvalue.detrend      = 'yes';
cfg.artfctdef.zvalue.interactive = 'no'; % no feedback


% reject artefacts 
[cfg,artifact_EOG] = ft_artifact_zvalue(cfg, data_all);
cfg.artfctdef.eog.artifact = artifact_EOG;
cfg = ft_rejectartifacts(cfg);


% Averaging
cfg.contionous = 'yes'; 
cfg.preproc.demean = 'yes';
cfg.preproc.baselinewindow = [-0.1 0];


% Re-refrencing
cfg.method = 'avg'; 
cfg.reref = 'yes'; 
cfg.refchannel = 'all'; 

data_clean = ft_preprocessing(cfg);

% Compute ERPs
cfg = []; 
cfg.trials = find(data_clean.trials == 1);
standard = ft_timelockanalysis(cfg,data_clean);


cfg = []; 
cfg.trials = find(data_clean.trials == 3);
rare = ft_timelockanalysis(cfg,data_clean);

% Plot ERP
cfg = [];
cfg.channel = 'C23';
ft_singleplotER(cfg, standard, rare)






