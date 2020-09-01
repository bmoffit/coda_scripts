# BASH Environment setup for CODA 3

# Prune any previous CODA defs in PATH and LD_LIBRARY_PATH

export PATH=`echo $PATH | awk -v RS=: -v ORS=: '/coda/ {next} {print}' | sed 's/:*$//'`
export LD_LIBRARY_PATH=`echo $LD_LIBRARY_PATH | awk -v RS=: -v ORS=: '/coda/ {next} {print}' | sed 's/:*$//'`
export CODA_CONFIG="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export PATH=${CODA_CONFIG}:${PATH}

export CODA=/site/coda/3.10

if [ -f $CODA/.setup_bash ]; then
    source $CODA/.setup_bash
else
    source $CODA_CONFIG/coda3.10.setup_bash
fi

export SESSION=session
export EXPID=expid

export COOL_HOME=${HOME}/coda3/cool
export JAVA_HOME=${HOME}/jdk1.8.0_152

export REMEX_CMSG_HOST=thishost.jlab.org
export REMEX_CMSG_PASSWORD=${EXPID}

export CODA_COMPONENT_TABLE=$CODA_CONFIG/config/${EXPID}/coda_component_table.cfg

# Add config scripts to path
export PATH=${CODA_CONFIG}:$PATH
