#!/usr/bin/env bash

set -e


URL=http://localhost:8080/health


echo "Checking service health..."

response=$(curl -s $URL)


echo "Response:"
echo $response


if echo "$response" | grep -q '"status":"ok"'
then
    echo "Health Check PASSED"
    exit 0
else
    echo "Health Check FAILED"
    exit 1
fi
