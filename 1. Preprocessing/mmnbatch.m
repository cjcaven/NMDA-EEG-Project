%-----------------------------------------------------------------------
% Job saved on 24-Aug-2023 14:08:03 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
%% Specify Paths
data_file = 'C:\Users\jadec\EEG\subject1.bdf';
channel_selection = 'C:\Users\jadec\EEG\channelselection.mat';
montage_file = 'C:\Users\jadec\EEG\avref_eog.mat';
sensors = 'C:\Users\jadec\EEG\sensors.pol';
trial_definition = 'C:\Users\jadec\EEG\trialdef.mat';

matlabbatch{1}.spm.meeg.convert.dataset = {data_file};
matlabbatch{1}.spm.meeg.convert.mode.continuous.readall = 1;
matlabbatch{1}.spm.meeg.convert.channels{1}.chanfile = {channel_selection};
matlabbatch{1}.spm.meeg.convert.outfile = '';
matlabbatch{1}.spm.meeg.convert.eventpadding = 0;
matlabbatch{1}.spm.meeg.convert.blocksize = 3276800;
matlabbatch{1}.spm.meeg.convert.checkboundary = 1;
matlabbatch{1}.spm.meeg.convert.saveorigheader = 0;
matlabbatch{1}.spm.meeg.convert.inputformat = 'autodetect';
matlabbatch{2}.spm.meeg.preproc.montage.D(1) = cfg_dep('Conversion: Converted Datafile', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','Dfname'));
matlabbatch{2}.spm.meeg.preproc.montage.mode.write.montspec.montage.montagefile = {montage_file};
matlabbatch{2}.spm.meeg.preproc.montage.mode.write.montspec.montage.keepothers = 0;
matlabbatch{2}.spm.meeg.preproc.montage.mode.write.blocksize = 655360;
matlabbatch{2}.spm.meeg.preproc.montage.mode.write.prefix = 'M';
matlabbatch{3}.spm.meeg.preproc.prepare.D(1) = cfg_dep('Montage: Montaged Datafile', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','Dfname'));
matlabbatch{3}.spm.meeg.preproc.prepare.task{1}.loadeegsens.eegsens = {'sensors'};
matlabbatch{3}.spm.meeg.preproc.prepare.task{1}.loadeegsens.megmatch.nomatch = 1;
matlabbatch{4}.spm.meeg.preproc.filter.D(1) = cfg_dep('Prepare: Prepared Datafile', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','Dfname'));
matlabbatch{4}.spm.meeg.preproc.filter.type = 'butterworth';
matlabbatch{4}.spm.meeg.preproc.filter.band = 'high';
matlabbatch{4}.spm.meeg.preproc.filter.freq = 0.1;
matlabbatch{4}.spm.meeg.preproc.filter.dir = 'twopass';
matlabbatch{4}.spm.meeg.preproc.filter.order = 5;
matlabbatch{4}.spm.meeg.preproc.filter.prefix = 'f';
matlabbatch{5}.spm.meeg.preproc.downsample.D(1) = cfg_dep('Filter: Filtered Datafile', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','Dfname'));
matlabbatch{5}.spm.meeg.preproc.downsample.fsample_new = 200;
matlabbatch{5}.spm.meeg.preproc.downsample.method = 'resample';
matlabbatch{5}.spm.meeg.preproc.downsample.prefix = 'd';
matlabbatch{6}.spm.meeg.preproc.filter.D(1) = cfg_dep('Downsampling: Downsampled Datafile', substruct('.','val', '{}',{5}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','Dfname'));
matlabbatch{6}.spm.meeg.preproc.filter.type = 'butterworth';
matlabbatch{6}.spm.meeg.preproc.filter.band = 'low';
matlabbatch{6}.spm.meeg.preproc.filter.freq = 30;
matlabbatch{6}.spm.meeg.preproc.filter.dir = 'twopass';
matlabbatch{6}.spm.meeg.preproc.filter.order = 5;
matlabbatch{6}.spm.meeg.preproc.filter.prefix = 'f';
matlabbatch{7}.spm.meeg.preproc.epoch.D(1) = cfg_dep('Filter: Filtered Datafile', substruct('.','val', '{}',{6}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','Dfname'));
matlabbatch{7}.spm.meeg.preproc.epoch.trialchoice.trlfile = {trial_definition};
matlabbatch{7}.spm.meeg.preproc.epoch.bc = 1;
matlabbatch{7}.spm.meeg.preproc.epoch.eventpadding = 0;
matlabbatch{7}.spm.meeg.preproc.epoch.prefix = 'e';
matlabbatch{8}.spm.meeg.preproc.artefact.D(1) = cfg_dep('Epoching: Epoched Datafile', substruct('.','val', '{}',{7}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','Dfname'));
matlabbatch{8}.spm.meeg.preproc.artefact.mode = 'reject';
matlabbatch{8}.spm.meeg.preproc.artefact.badchanthresh = 0.2;
matlabbatch{8}.spm.meeg.preproc.artefact.append = true;
matlabbatch{8}.spm.meeg.preproc.artefact.methods.channels{1}.all = 'all';
matlabbatch{8}.spm.meeg.preproc.artefact.methods.fun.threshchan.threshold = 80;
matlabbatch{8}.spm.meeg.preproc.artefact.methods.fun.threshchan.excwin = 1000;
matlabbatch{8}.spm.meeg.preproc.artefact.prefix = 'a';
matlabbatch{9}.spm.meeg.averaging.average.D(1) = cfg_dep('Artefact detection: Artefact-detected Datafile', substruct('.','val', '{}',{8}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','Dfname'));
matlabbatch{9}.spm.meeg.averaging.average.userobust.robust.ks = 3;
matlabbatch{9}.spm.meeg.averaging.average.userobust.robust.bycondition = true;
matlabbatch{9}.spm.meeg.averaging.average.userobust.robust.savew = false;
matlabbatch{9}.spm.meeg.averaging.average.userobust.robust.removebad = false;
matlabbatch{9}.spm.meeg.averaging.average.plv = false;
matlabbatch{9}.spm.meeg.averaging.average.prefix = 'm';
