#!/bin/bash
#
# Shell script to start coda_roc
#
#  FIXME: Need to support randy factor configuration
#
#


if [ -z $CODA ]; then
    echo "ERROR: CODA environment variable not defined!"
    exit -1
fi

. coda_conf_functions

codaconf_get_component_name deepthought ROC

ROCNAME=$CODA_COMPONENT_NAME

# tcl script to set the randy factor
SETRF=

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
echo "************************************************************"
coda_roc -i -v -name $ROCNAME -session $SESSION
