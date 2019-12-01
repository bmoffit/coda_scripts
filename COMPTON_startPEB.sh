#!/bin/bash
#
# Shell script to start coda_emu_peb
#

# default peb name
PEBNAME=PEBcleanroom

if [ -z $CODA ]; then
    source ~/SBS-GEM-Cleanroom/env/setupCODA
elif [ -z $SBS_HOME ]; then
    source ~/SBS-GEM-Cleanroom/env/setupCODA
fi

PEB_ACTIVE=$(pgrep coda_emu_peb)
if [ -n "$PEB_ACTIVE" ]; then
    echo "WARNING: coda_emu_peb already running"
    echo "         killing them"
    killall -v coda_roc
fi


echo "************************************************************"
echo "Starting PEB on" $HOSTNAME
echo "   SESSION   =" $SESSION
echo "   EXPID     =" $EXPID
echo "   PEB name  =" $PEBNAME
echo "   Directory =" $SBS_HOME
echo "************************************************************"
cd $SBS_HOME
coda_emu_peb $PEBNAME
