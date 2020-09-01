#!/bin/bash
#
# Shell script to start coda_emu_peb
#

HOSTNAME=$(hostname -s)

# CODA 3 PEB needs JAVA_HOME define
if [ -z $JAVA_HOME ]; then
    echo "ERROR: \$JAVA_HOME not defined!"
    exit 1
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
