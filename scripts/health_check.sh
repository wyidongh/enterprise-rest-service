#!/bin/bash


URL=http://localhost:8080/health


echo "Checking service health..."


HTTP_CODE=$(curl -s \
-o response.txt \
-w "%{http_code}" \
$URL)


cat response.txt


if [ "$HTTP_CODE" = "200" ]
then

    echo "Health Check OK"
    exit 0

else

    echo "Health Check FAILED"
    exit 1

fi
