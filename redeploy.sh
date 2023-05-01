#!/bin/bash

sudo rm -f Matt-and-Austin-CI-CD

sudo git clone https://github.com/cs220s23/Matt-and-Austin-CI-CD.git

sudo systemctl start docker

sudo ./Matt-and-Austin-CI-CD/down

sudo cp app.env ./Matt-and-Austin-CI-CD

sudo docker build -t app ./Matt-and-Austin-CI-CD

sudo ./Matt-and-Austin-CI-CD/up

sudo cp ./Matt-and-Austin-CI-CD/redeploy.sh .
