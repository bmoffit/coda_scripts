#!/bin/bash -f

#Starts Afecs platform
# author: vhg, 23-jul-2009
#         Moffit, 01aug2018

DTIME=$(date +%d%b%Y_%R)
OUTFILE=/tmp/PLATFORM_output_${DTIME}

# set classpath
export CLASSPATH=${AFECS_HOME}/afecs-1.4.jar:${AFECS_HOME}/lib/cMsg-3.3.jar:${AFECS_HOME}/lib/jena.jar:${AFECS_HOME}/lib/msql-jdbc-2-0b5.jar

# start the platform
exec &> >(tee $OUTFILE)
${JAVA_HOME}/bin/java -Xms200m -Xmx500m -Xconcurrentio org.jlab.coda.afecs.platform.APlatform $1 $2 $3  &

JAVAPID=$!

trap "kill $JAVAPID" INT TERM

wait
