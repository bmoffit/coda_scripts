#!/bin/bash
#
#  Kill the remote_vme's
#
#
#

HOSTNAMES="hallavtp1 sbsvme28"

# kill the local script (because it auto-restarts the ssh connection)
pkill -f COMPTON_startROC.sh


# now kill the ROC, if it's still runnin gon the remote host
for host in $HOSTNAMES
do
    ssh $host pkill coda_roc
done

HOSTNAMES="localhost"

# kill the local script (because it auto-restarts the ssh connection)
pkill -f COMPTON_startPEB.sh


# now kill the ROC, if it's still runnin gon the remote host
for host in $HOSTNAMES
do
    ssh $host pkill -f org.jlab.coda.emu.EmuFactory
done
