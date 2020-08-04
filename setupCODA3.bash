# BASH Environment setup for CODA 3

# Prune any previous CODA defs in PATH and LD_LIBRARY_PATH

export PATH=`echo $PATH | awk -v RS=: -v ORS=: '/coda/ {next} {print}' | sed 's/:*$//'`
export LD_LIBRARY_PATH=`echo $LD_LIBRARY_PATH | awk -v RS=: -v ORS=: '/coda/ {next} {print}' | sed 's/:*$//'`

export CODA=/site/coda/3.10
source $CODA/.setup_bash

export SESSION=session
export EXPID=expid

export COOL_HOME=cool_home
export JAVA_HOME=/group/da/Java/jdk/jdk1.8.0_152

export REMEX_CMSG_HOST=deepthought
export REMEX_CMSG_PASSWORD=${EXPID}

export CODA_COMPONENT_TABLE=./config/${EXPID}/coda_component_table.cfg
