#!/bin/bash

URL="http://localhost:3000/health"

STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)

if [ $STATUS -eq 200 ]
then
  echo "Application is Healthy"
else
  echo "Application is Down"
fi

