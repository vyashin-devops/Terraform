#!/bin/bash
  
sudo apt-get update

sudo apt install docker.io

sudo usermod -aG docker $USER

sudo systemctl enable docker.service

sudo systemctl enable containerd.service

echo -e "\033[32m install DOCKER success!"
