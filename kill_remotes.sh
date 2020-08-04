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
echo "Killing local remote_vme startROC.sh connections"
pkill -f "remote_vme.*startROC.sh"


# now kill the ROC, if it's still runnin gon the remote host
for host in $ROC_hosts
do
    echo "Killing ROC on $host"
    ssh $host pkill coda_roc
done

# Get list of PEB hosts
coda_conf_get_component_list PEB
PEB_hosts=${CODA_HOSTNAME_LIST[@]}

# kill the remote_vme connections for the PEBs
echo "Killing local remote_vme startPEB.sh connections"
pkill -f "remote_vme.*startPEB.sh"

# now kill the ROC, if it's still runnin gon the remote host
for host in $PEB_hosts
do
    echo "Killing PEB on $host"
    ssh $host pkill -f org.jlab.coda.emu.EmuFactory
done
