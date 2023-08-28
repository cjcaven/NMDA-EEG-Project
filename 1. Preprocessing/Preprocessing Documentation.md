###	**Preprocessing**

We need preprocessing because there is often a lot of noise in EEG data, which might mask weaker EEG signals, and blinking or muscle movement artifacts can contaminate the data.  Preprocessing in SPM12 involves constructing and executing a batch pipeline that can be applied to another dataset with minor adjustments. The process consists of 

**Simple Conversion:** creating an SPM compatible data file,

**Montage:** applying a montage configuration to the recorded EEG signals to define how the electrodes placed on the scalp are combined to form new channels, 

**Preparing:** linking the data to sensors which are located in a coordinate system, 

**Low-pass/High-pass Filtering:** removing unwanted frequencies below or above a certain value from the data, 

**Downsampling:** decreasing the sampling rate to reduce the file size while keeping the information that is needed,

**Epoching:** segmenting the data into smaller time intervals to extract specific time windows of interest, 

**Artifact Removal:** applying thresholding to all channels in order to detect and remove biological and environmental signals that are picked up by the system but do not come from the brain, 

**Averaging:** Averaging the epochs that are time-locked to the same event or stimulus type to obtain ERPs.



### **Automatization of Preprocessing**

Preprocessing steps in EEG data analysis can be automatized to provide consistent and repeatable preprocessing across different datasets. This process also allows for flexible modifications, saves time with large datasets and produces more reliable outcomes.
