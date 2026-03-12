#!/bin/bash

echo "Starting Deployment..."

APP_DIR=~/nodejs-devops-automation/app

cd $APP_DIR

echo "Installing dependencies..."
npm install

echo "Restarting application..."

pm2 stop nodeapp || true
pm2 start app.js --name nodeapp

echo "Running health check..."

sleep 5

curl -f http://localhost:3000/health

if [ $? -eq 0 ]; then
    echo "Deployment Successful"
else
    echo "Deployment Failed"
fi


