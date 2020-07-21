# CSH Environment setup for CODA 3

# Prune any previous CODA defs in PATH and LD_LIBRARY_PATH

set PATH=`echo $PATH | awk -v RS=: -v ORS=: '/coda/ {next} {print}' | sed 's/:*$//'`
set LD_LIBRARY_PATH=`echo $LD_LIBRARY_PATH | awk -v RS=: -v ORS=: '/coda/ {next} {print}' | sed 's/:*$//'`

setenv CODA /site/coda/3.10
source $CODA/.setup

setenv SESSION hcal
setenv EXPID hcal

setenv REMEX_CMSG_HOST enpcamsoone
setenv REMEX_CMSG_PASSWORD ${EXPID}

