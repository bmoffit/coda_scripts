#!/bin/bash
#
# Shell script to start coda_roc
#


if [ -z $HOSTNAME ]; then
    HOSTNAME=$(hostname -s)
fi

. coda_conf_functions

# Get the ROC component name
codaconf_get_component_name $HOSTNAME ROC
ROCNAME=$CODA_COMPONENT_NAME

# Get this ROC's commandline option
codaconf_get_name_option $HOSTNAME $ROCNAME
ROCOPTION=$CODA_COMPONENT_OPTION

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
echo "************************************************************"
coda_roc -i -v -name $ROCNAME -session $SESSION $ROCOPTION
