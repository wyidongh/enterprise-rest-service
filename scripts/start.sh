#!/bin/bash

set -e


APP_HOME=$(cd "$(dirname "$0")/.." && pwd)

PID_FILE=$APP_HOME/run/service.pid


mkdir -p $APP_HOME/run


if [ -f $PID_FILE ]; then

    PID=$(cat $PID_FILE)

    if ps -p $PID > /dev/null
    then
        echo "Service already running PID=$PID"
        exit 1
    fi

fi


nohup $APP_HOME/bin/enterprise-service \
> $APP_HOME/service.log 2>&1 &


PID=$!

echo $PID > $PID_FILE


echo "Service started PID=$PID"
