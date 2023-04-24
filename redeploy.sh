#!/bin/bash

sudo yum install git -y

sudo yum install docker

sudo systemctl start docker

sudo docker build -t app .

sudo ./down

sudo ./up
