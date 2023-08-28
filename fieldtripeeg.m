% This script performs a pipeline to processes eeg data.


% Load data
filename = './bids/sub-/eeg/sub-_task-oddballauditoryparadigm_eeg.bdf'; 
%trialdef = load('trialdef.mat');

% Define standard & rare trials
cfg = [];
cfg.dataset = filename;
cfg.trialdef.eventvalue = 65152;
cfg.trialdef.prestim        = 0.04; 
cfg.trialdef.poststim       = 0.15; 
cfg.trl_standard = ft_definetrial(cfg); %standard trials

cfg.trialdef.eventvalue = 65216;
cfg.trl_rare = ft_definetrial(cfg); %rare trials


% Epoching
data_standard = ft_redefinetrial(cfg.trl_standard);
data_rare = ft_redefinetrial(cfg.trl_rare);


% Custom montage
%cfg.montage.labelold = {'EXG1' 'EXG2' 'EXG3'};
%cfg.montage.labelnew = {'HEOG' 'VEOG' 'EXG3'};
%data_exg = ft_preprocessing(cfg);

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

% Artefact handling 
cfg.channel = 'all';
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
cfg = [];
cfg.robust = 'yes'; 

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
figure; ft_singleplotER(cfg, standard, rare)



