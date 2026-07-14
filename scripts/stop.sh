#!/bin/bash

set -e


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

    kill $PID


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
