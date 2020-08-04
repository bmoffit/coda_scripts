# CSH Environment setup for CODA 3

# Prune any previous CODA defs in PATH and LD_LIBRARY_PATH

set PATH=`echo $PATH | awk -v RS=: -v ORS=: '/coda/ {next} {print}' | sed 's/:*$//'`
set LD_LIBRARY_PATH=`echo $LD_LIBRARY_PATH | awk -v RS=: -v ORS=: '/coda/ {next} {print}' | sed 's/:*$//'`

########################################
# User Specific Configuration
########################################
setenv CODA /site/coda/3.10
source $CODA/.setup

setenv SESSION session
setenv EXPID expid

setenv COOL_HOME cool_home
setenv JAVA_HOME /group/da/Java/jdk/jdk1.8.0_152

setenv REMEX_CMSG_HOST deepthought
setenv REMEX_CMSG_PASSWORD ${EXPID}

setenv CODA_COMPONENT_TABLE ./config/${EXPID}/coda_component_table.cfg

# Add this script directory to environment PATH
set called=($_)

if ( "$called" != "" ) then  ### called by source 
   set script_fn=`readlink -f $called[2]`
else                         ### called by direct execution of the script
   set script_fn=`readlink -f $0`
endif

set script_dir=`dirname $script_fn`
setenv CODA_CONFIG $script_dir

# Add config scripts to path
set path = ($CODA_CONFIG $path)


