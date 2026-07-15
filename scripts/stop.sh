#!/bin/bash

set -e

<<<<<<< HEAD

APP_HOME=$(cd "$(dirname "$0")/.." && pwd)

PID_FILE=$APP_HOME/run/service.pid


if [ ! -f $PID_FILE ]
then
    echo "No PID file"
    exit 0
fi


PID=$(cat $PID_FILE)


if ps -p $PID > /dev/null
then

    echo "Stopping service PID=$PID"
=======
>>>>>>> d96aa04 (Modify scripts/stop.sh)

APP_HOME=$(cd "$(dirname "$0")/.." && pwd)

<<<<<<< HEAD

    for i in {1..10}
    do
        if ps -p $PID > /dev/null
        then
            sleep 1
        else
            break
        fi
    done

fi


rm -f $PID_FILE


echo "Service stopped"
=======
PID_FILE=$APP_HOME/run/service.pid


if [ ! -f "$PID_FILE" ]; then

    echo "No PID file"

    exit 0

fi


PID=$(cat $PID_FILE)


echo "Stopping enterprise-service PID=$PID"


if ps -p $PID > /dev/null
then

    kill -15 $PID


    for i in {1..10}
    do

        if ps -p $PID > /dev/null
        then
            sleep 1
        else
            echo "Service stopped"
            break
        fi

    done


fi


rm -f $PID_FILE


exit 0
>>>>>>> d96aa04 (Modify scripts/stop.sh)
