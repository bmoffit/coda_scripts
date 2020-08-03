#!/bin/bash
#
# Shell script to start coda_emu_peb
#

if [ -z $CODA ]; then
    echo "ERROR: CODA environment variable not defined!"
    exit -1
fi

if [ -z $HOSTNAME ]; then
    HOSTNAME=$(hostname -s)
fi

. coda_conf_functions

# Get the PEB component name
codaconf_get_component_name $HOSTNAME PEB
PEBNAME=$CODA_COMPONENT_NAME

# Get this ROC's commandline option
codaconf_get_name_option $HOSTNAME $PEBNAME
PEBOPTION=$CODA_COMPONENT_OPTION

PEB_ACTIVE=$(pgrep coda_emu_peb)
if [ -n "$PEB_ACTIVE" ]; then
    echo "WARNING: coda_emu_peb already running"
    echo "         killing them"
    killall -v coda_emu_peb
fi


echo "************************************************************"
echo "Starting PEB on" $HOSTNAME
echo "   SESSION     =" $SESSION
echo "   EXPID       =" $EXPID
echo "   PEB name    =" $PEBNAME
echo "   PEB option  =" $PEBOPTION
echo "************************************************************"
coda_emu_peb $PEBNAME $PEBOPTION
