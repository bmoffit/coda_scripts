#!/bin/bash
#
# Shell script to start coda_roc
#
#  If no arguments, use coda_conf_functions to get ROC information
#
#  Otherwise:
#
#   startROC.sh ROCNAME ROCOPTIONS
#
#   Where ROCNAME is the name of the ROC component to start
#   and ROCOPTIONS (optional) are any other arguments to copy to the coda_roc
#   commandline
#

ARGS=$@

if [ -z $HOSTNAME ]; then
    HOSTNAME=$(hostname -s)
fi

if [ ${#@} -gt 0 ]; then
    # Get the ROC component name
    ROCNAME=$1

    # Get this ROC's commandline option
    shift 1
    ROCOPTION=$@
else
    . coda_conf_functions

    # Get the ROC component name
    codaconf_get_component_name $HOSTNAME ROC
    ROCNAME=$CODA_COMPONENT_NAME

    # Get this ROC's commandline option
    codaconf_get_name_option $HOSTNAME $ROCNAME
    ROCOPTION=$CODA_COMPONENT_OPTION
fi

ROC_ACTIVE=$(pgrep coda_roc)
if [ -n "$ROC_ACTIVE" ]; then
    echo "WARNING: coda_roc already running"
    echo "         killing them"
    killall -v coda_roc
fi


echo "************************************************************"
echo "Starting ROC on" $HOSTNAME
echo "   SESSION     =" $SESSION
echo "   EXPID       =" $EXPID
echo "   ROC name    =" $ROCNAME
echo "   ROC option  =" $ROCOPTION
echo "   Commandline =" $ARGS
echo "************************************************************"
coda_roc -i -v -name $ROCNAME -session $SESSION $ROCOPTION
