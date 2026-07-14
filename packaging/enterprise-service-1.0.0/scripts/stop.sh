#!/bin/bash

PID=$(pgrep -f enterprise-service)

if [ -n "$PID" ]
then
    echo "Stopping enterprise-service PID=$PID"

    kill $PID

    sleep 2

else
    echo "Service not running"
fi
