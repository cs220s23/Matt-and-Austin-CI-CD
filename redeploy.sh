#!/bin/bash

sudo yum install git -y

sudo yum install docker

sudo rm -rf Matt-and-Austin-CI-CD

sudo git clone https://github.com/cs220s23/Matt-and-Austin-CI-CD.git

sudo systemctl start docker

sudo docker build -t app .

sudo ./Matt-and-Austin-CI-CD/down

sudo ./Matt-and-Austin-CI-CD/up
