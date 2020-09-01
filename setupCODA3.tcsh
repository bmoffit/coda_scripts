# CSH Environment setup for CODA 3

# Prune any previous CODA defs in PATH and LD_LIBRARY_PATH

set PATH=`echo $PATH | awk -v RS=: -v ORS=: '/coda/ {next} {print}' | sed 's/:*$//'`
if ($?LD_LIBRARY_PATH == "1") then
   set LD_LIBRARY_PATH=`echo $LD_LIBRARY_PATH | awk -v RS=: -v ORS=: '/coda/ {next} {print}' | sed 's/:*$//'`
endif

########################################
# User Specific Configuration
########################################
setenv CODA /site/coda/3.10
source $CODA/.setup

setenv SESSION session
setenv EXPID expid

setenv COOL_HOME ${HOME}/coda3/cool
setenv JAVA_HOME ${HOME}/jdk1.8.0_152

setenv REMEX_CMSG_HOST thishost.jlab.org
setenv REMEX_CMSG_PASSWORD ${EXPID}

setenv CODA_COMPONENT_TABLE ${CODA_CONFIG}/config/${EXPID}/coda_component_table.cfg

# Add config scripts to path
set path = ($CODA_CONFIG $path)


