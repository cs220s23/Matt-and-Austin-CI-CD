#!/bin/bash

sudo yum install git -y

sudo yum install docker

docker build -t server .

./down

./up
