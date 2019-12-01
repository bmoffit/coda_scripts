#!/bin/bash
#
# Shell script to start coda_emu_peb
#

# default peb name
PEBNAME=PEB1

if [ -z $CODA ]; then
    export CODA=/site/coda/3.10
    source ${CODA}/.setup
fi

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
