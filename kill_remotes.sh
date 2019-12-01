#!/bin/bash
#
#  Kill the remote_vme's
#
#
#

HOSTNAMES="hallavme14pc sbsvme25"

# kill the local script (because it auto-restarts the ssh connection)
pkill -f SBS_startROC.sh


# now kill the ROC, if it's still runnin gon the remote host
for host in $HOSTNAMES
do
    ssh $host pkill coda_roc
done

HOSTNAMES="eel124gemdaq"

# kill the local script (because it auto-restarts the ssh connection)
pkill -f SBS_startPEB.sh


# now kill the ROC, if it's still runnin gon the remote host
for host in $HOSTNAMES
do
    ssh $host pkill -f org.jlab.coda.emu.EmuFactory
done
