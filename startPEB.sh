#!/bin/bash
#
# Shell script to start coda_emu_peb
#

if [ -z $CODA ]; then
    echo "ERROR: CODA environment variable not defined!"
    exit -1
fi

. coda_conf_functions

codaconf_get_component_name deepthought PEB

PEBNAME=$CODA_COMPONENT_NAME

PEB_ACTIVE=$(pgrep coda_emu_peb)
if [ -n "$PEB_ACTIVE" ]; then
    echo "WARNING: coda_emu_peb already running"
    echo "         killing them"
    killall -v coda_emu_peb
fi


echo "************************************************************"
echo "Starting PEB on" $HOSTNAME
echo "   SESSION   =" $SESSION
echo "   EXPID     =" $EXPID
echo "   PEB name  =" $PEBNAME
echo "************************************************************"
coda_emu_peb $PEBNAME
