# coda_scripts
A collection scripts for use with small scale DAQs running CODA 3

This repo is no longer updated.  Check the fork at [JeffersonLab](https://github.com/JeffersonLab/coda_scripts).

## Install and Configuration
* Setup host ssh key for automated login to CODA component clients.
  * [ssh-keygen Generate a New SSH Key](https://www.ssh.com/ssh/keygen/)

* Install scripts on CODA 3 Platform host, ROC and PEB clients.
  * With git

        git clone git@github.com:bmoffit/coda_scripts.git ~/coda3/coda_scripts-master

  * From zip

        unzip coda_scripts-master.zip ~/coda3/

  * If you're not sharing this directory with the CODA Components (e.g. with NFS), repeat this step for each component.


* Configure environment variables in `setupCODA3.tcsh` or `setupCODA3.bash`
  * These environment variables are specific to your setup.

        setenv CODA /site/coda/3.10
        source $CODA/.setup

        setenv SESSION session
        setenv EXPID expid

	    setenv COOL_HOME ${HOME}/coda3/cool
        setenv JAVA_HOME ${HOME}/jdk1.8.0_152

        setenv REMEX_CMSG_HOST thishost.jlab.org
        setenv REMEX_CMSG_PASSWORD ${EXPID}

        setenv CODA_COMPONENT_TABLE ${CODA_CONFIG}/config/${EXPID}/coda_component_table.cfg



* Source the `setupCODA3.{tcsh,bash}` in shell setup file for each DAQ component
  * In `.bashrc`

        export CODA_CONFIG=~/coda3/coda_scripts-master
        source $CODA_CONFIG/setupCODA3.bash

  * In `.tcshrc`

        setenv CODA_CONFIG=~/coda3/coda_scripts-master
        source $CODA_CONFIG/setupCODA3.tcsh


  * Modify the config file adding each DAQ component on the host
	* The file defined by `$CODA_COMPONENT_TABLE` specifies the components that will interact with these scripts

	* File format:

        `HOSTNAME   COMPONENT_TYPE    COMPONENT_NAME   OPTIONAL_ARG`

	* For example, I have a PEB named PEB1 running on daqpc1:

        `daqpc1   PEB   PEB1`

	* For example, I have a ROC named ROC2 running on daqroc2 and needs to run a tcl script to set it's randy factor on startup:

        `daqroc2  ROC   ROC2  -t setrf.tcl`

## Howto Use

* If you have an empty COOL_HOME (otherwise, skip this step)
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
