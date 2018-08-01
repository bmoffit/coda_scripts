#!/bin/bash
#
#  coda_roc.sh
#   - Bryan Moffit June 2018
#
#   Script to take ROC output and direct it to a file (also directed
#    to standard out)
#

CODA_ROC=coda_roc_rc3
ROC_ARGS="-type ROC -name ROC2"
DTIME=$(date +%d%b%Y_%R)
OUTFILE=/tmp/ROC_output_$DTIME

check_exe ()
{
    if [ -z "$1" ] ; then                          # Is parameter #1 zero length?
	echo "ERROR: check_exe() requires one argument"
	return -1
    fi

    path_to_exe=$(type -P $1)
    if [ ! -n "$path_to_exe" ] ; then
	echo "ERROR: $1 not in PATH"
	exit -1
    fi
}

# Make sure all the stuff we need is available to us
check_exe $CODA_ROC
check_exe date
check_exe tee

$CODA_ROC $ROC_ARGS 2>&1 | tee $OUTFILE
