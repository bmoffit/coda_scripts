#!/bin/bash
#
# Shell script to start coda_roc
#

# default roc name
ROCNAME=ROC1

# tcl script to set the randy factor
SETRF=

if [ -z $CODA ]; then
    source ~/env/setupCODA
fi

if [ "$HOSTNAME" == "sbsvme28" ]; then
    ROCNAME=ROC1
elif [ "$HOSTNAME" == "hallavtp1.jlab.org" ]; then
    ROCNAME=vtpROC
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
