# coda_scripts - SBS branch
A collection scripts for use with small scale SBS DAQs.


## Install and Configuration

* Install scripts on host
  * Must be accessible by host and all components

* Configure environment variables in setupCODA3.tcsh or setupCODA3.bash

* Source the setupCODA3.tcsh in shell setup file for each DAQ component

* Modify the config file adding each DAQ component

## Howto Use

* Empty COOL_HOME:
  * Run jcedit
  * Create new COOL database
  * Expert -> Session -> New
	* Enter SESSION name (matches that defined in environment)

* Launch CODA3 and its components
  startCoda


* Restart ONLY the PEB and ROC components
  restartStuff

* Kill ALL CODA components started by startCoda
  kcoda
