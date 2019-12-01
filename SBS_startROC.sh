#!/bin/bash
#
# Shell script to start coda_roc
#

# default roc name
ROCNAME=ROCcrate0

# tcl script to set the randy factor
SETRF=~/SBS-GEM-Cleanroom/rol/setrf.tcl

if [ -z $CODA ]; then
    source ~/SBS-GEM-Cleanroom/env/setupCODA
elif [ -z $SBS_HOME ]; then
    source ~/SBS-GEM-Cleanroom/env/setupCODA
fi

if [ "$HOSTNAME" == "hallavme14pc" ]; then
    ROCNAME=ROCcrate0
elif [ "$HOSTNAME" == "sbsvme25" ]; then
    ROCNAME=ROCcrate1
elif [ "$HOSTNAME" == "sbsvme30" ]; then
    ROCNAME=ROCcrate2
else
    echo "ERROR.  unexpected host: $HOSTNAME"
    exit
fi

ROC_ACTIVE=$(pgrep coda_roc)
if [ -n "$ROC_ACTIVE" ]; then
    echo "WARNING: coda_roc already running"
    echo "         killing them"
    killall -v coda_roc
fi


echo "************************************************************"
echo "Starting ROC on" $HOSTNAME
echo "   SESSION   =" $SESSION
echo "   EXPID     =" $EXPID
echo "   ROC name  =" $ROCNAME
echo "   Directory =" $SBS_HOME
echo "************************************************************"
cd $SBS_HOME
coda_roc -i -v -name $ROCNAME -session $SESSION -f $SETRF
