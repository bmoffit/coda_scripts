# CSH Environment setup for CODA 3

# Prune any previous CODA defs in PATH and LD_LIBRARY_PATH

set PATH=`echo $PATH | awk -v RS=: -v ORS=: '/coda/ {next} {print}' | sed 's/:*$//'`
set LD_LIBRARY_PATH=`echo $LD_LIBRARY_PATH | awk -v RS=: -v ORS=: '/coda/ {next} {print}' | sed 's/:*$//'`

setenv CODA /site/coda/3.10
source $CODA/.setup

setenv SESSION session
setenv EXPID expid

setenv REMEX_CMSG_HOST deepthought
setenv REMEX_CMSG_PASSWORD ${EXPID}

setenv CODA_COMPONENT_TABLE ./config/${EXPID}/coda_component_table.cfg
