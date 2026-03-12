# Node.js DevOps Automation Project

## Introduction

This project demonstrates a basic DevOps automation setup for deploying and monitoring a Node.js application on a Linux server.

The goal of this project was to understand how DevOps engineers automate common operational tasks such as application deployment, monitoring application health, and handling failures.

In this project, I created shell scripts to automate deployment, perform rollback if something goes wrong, and continuously check whether the application is running properly.

To make the monitoring automatic, I configured a cron job that runs the health check script at regular intervals.

The project was implemented on a Linux server environment and the code was managed using Git and stored on GitHub.

---

## Technologies and Tools Used

The following tools and technologies were used while implementing this project:

- Node.js – for creating a simple application
- Linux (Ubuntu server) – for running the application and scripts
- Bash scripting – for automation
- Git – for version control
- GitHub – for storing the project repository
- AWS EC2 – for launching and managing the server
- Cron (crontab) – for scheduling automatic health checks

---

## Project Folder Structure

The project is organized in the following structure:

nodejs-devops-automation/

app/  
This folder contains the Node.js application.

scripts/  
This folder contains automation scripts used in the project.

deploy.sh – script used for deploying the application  
rollback.sh – script used to restore the previous working version  
health-check.sh – script used to check whether the application is running

README.md  
This file contains the documentation of the project.

---

## Steps Followed to Implement the Project

### Step 1 – Launch a Cloud Server

First, I launched a Linux server using AWS EC2 so that I could run the application and automation scripts in a real environment.

After launching the server, I connected to it using SSH.

Example command:

ssh ubuntu@<server-public-ip>

---

### Step 2 – Update the Server

Before installing any tools, I updated the server packages.

sudo apt update  
sudo apt upgrade -y

This ensures the server has the latest updates and security patches.

---

### Step 3 – Install Required Tools

Next, I installed the required tools needed for the project.

sudo apt install nodejs npm git -y

Node.js is required to run the application and Git is used to manage the project repository.

To verify the installation, I checked the versions:

node -v  
npm -v  
git --version

---

### Step 4 – Create Project Directory

After installing the required tools, I created a directory for the project.

mkdir nodejs-devops-automation  
cd nodejs-devops-automation

---

### Step 5 – Create Project Folder Structure

To organize the project properly, I created the following folders.

mkdir app  
mkdir scripts

The **app** folder contains the Node.js application and the **scripts** folder contains automation scripts.

---

### Step 6 – Create a Simple Node.js Application

Inside the app folder, I created a simple Node.js application to simulate a running service.

cd app  
nano app.js

Example code used:

const http = require("http");

const server = http.createServer((req, res) => {
    res.write("Node.js DevOps Automation Project Running");
    res.end();
});

server.listen(3000, () => {
    console.log("Server running on port 3000");
});

This application runs on port **3000**.

---

### Step 7 – Create Deployment Script

Next, I created a deployment script.

cd ../scripts  
nano deploy.sh

The purpose of this script is to automate the deployment process.

This script performs tasks such as:

- Pulling the latest code
- Installing dependencies
- Starting the Node.js application

After creating the script, I made it executable.

chmod +x deploy.sh

---

### Step 8 – Create Rollback Script

To handle situations where a deployment might fail, I created a rollback script.

nano rollback.sh

The rollback script helps restore the previous working version of the application if something goes wrong after deployment.

Then I made the script executable.

chmod +x rollback.sh

---

### Step 9 – Create Health Check Script

Monitoring the application is an important responsibility in DevOps.

To simulate this, I created a health check script.

nano health-check.sh

This script checks whether the application is running properly.

If the application is not running, the script restarts it to make sure the service becomes available again.

Then I made the script executable.

chmod +x health-check.sh

---

### Step 10 – Automate Health Check Using Cron

To make the health check run automatically, I scheduled the script using **crontab**.

crontab -e

Then I added a cron job to run the health check script at regular intervals.

Example:

*/5 * * * * /home/ubuntu/nodejs-devops-automation/scripts/health-check.sh

This configuration runs the health check script every 5 minutes.

---

### Step 11 – Test the Application

After setting up the scripts, I tested the Node.js application.

node app/app.js

Then I accessed the application using the server IP address.

http://<server-ip>:3000

If the message appeared in the browser, it confirmed that the application was running successfully.

---

### Step 12 – Initialize Git Repository

To manage the project using version control, I initialized a Git repository.

git init

Then I added all project files.

git add .

Then I created the first commit.

git commit -m "Initial DevOps automation project"

---

### Step 13 – Push Project to GitHub

To store the project online, I created a repository on GitHub and connected it to the local repository.

git remote add origin https://github.com/YOUR-USERNAME/nodejs-devops-automation.git

Then I pushed the code to GitHub.

git branch -M main  
git push -u origin main

---

## Learning Outcome

While working on this project, I learned the following DevOps concepts:

- Automating deployment using shell scripts
- Monitoring application health
- Scheduling automation tasks using cron
- Managing project code using Git
- Working with a Linux server environment

---

## Future Improvements

Some improvements that can be added to this project include:

- Creating a CI/CD pipeline
- Containerizing the application using Docker
- Adding monitoring tools such as Prometheus and Grafana
- Deploying the application using Kubernetes

---

## Conclusion

This project demonstrates a basic DevOps automation workflow using shell scripts and a Node.js application.

It helped me understand how automation can simplify deployment and monitoring tasks in real-world DevOps environments.
