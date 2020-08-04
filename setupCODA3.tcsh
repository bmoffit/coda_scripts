# CSH Environment setup for CODA 3

# Prune any previous CODA defs in PATH and LD_LIBRARY_PATH

set PATH=`echo $PATH | awk -v RS=: -v ORS=: '/coda/ {next} {print}' | sed 's/:*$//'`
set LD_LIBRARY_PATH=`echo $LD_LIBRARY_PATH | awk -v RS=: -v ORS=: '/coda/ {next} {print}' | sed 's/:*$//'`

setenv CODA /site/coda/3.10
source $CODA/.setup

setenv SESSION session
setenv EXPID expid

setenv COOL_HOME cool_home
setenv JAVA_HOME /group/da/Java/jdk/jdk1.8.0_152

setenv REMEX_CMSG_HOST deepthought
setenv REMEX_CMSG_PASSWORD ${EXPID}

setenv CODA_COMPONENT_TABLE ./config/${EXPID}/coda_component_table.cfg
