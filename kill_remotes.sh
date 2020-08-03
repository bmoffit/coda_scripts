#!/bin/bash
#
#  Kill the remote_vme's
#
#
#

. coda_conf_functions

# Get list of ROC hosts
coda_conf_get_component_list ROC
ROC_hosts=${CODA_HOSTNAME_LIST[@]}


# kill the remote_vme connections for the ROCs
pkill -f "remote_vme.*startROC.sh"


# now kill the ROC, if it's still runnin gon the remote host
for host in $ROC_hosts
do
    ssh $host pkill coda_roc
done

# Get list of PEB hosts
coda_conf_get_component_list ROC
PEB_hosts=${CODA_HOSTNAME_LIST[@]}

# kill the remote_vme connections for the PEBs
pkill -f "remote_vme.*startPEB.sh"

# now kill the ROC, if it's still runnin gon the remote host
for host in $PEB_hosts
do
    ssh $host pkill -f org.jlab.coda.emu.EmuFactory
done
