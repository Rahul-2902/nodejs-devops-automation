#!/bin/bash

echo "Rolling back application..."

APP_DIR=~/nodejs-devops-automation/app

cd $APP_DIR

git checkout HEAD~1

npm install

pm2 restart nodeapp

echo "Rollback completed"

