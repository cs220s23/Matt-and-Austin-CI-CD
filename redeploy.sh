#!/bin/bash

sudo yum install git -y

sudo yum install docker -y

sudo rm -rf Matt-and-Austin-CI-CD

sudo git clone https://github.com/cs220s23/Matt-and-Austin-CI-CD.git

cd Matt-and-Austin-CI-CD

sudo systemctl start docker

sudo docker build -t app .

sudo ./down

sudo ./up
