#!/usr/bin/env bash


if ps aux | grep enterprise-service | grep -v grep
then
    echo "Service OK"
    exit 0
else
    echo "Service DOWN"
    exit 1
fi
