#!/bin/bash
  
sudo apt-get update

sudo apt install docker.io

sudo snap install docker

sudo usermod -aG docker $USER

sudo systemctl enable docker.service

sudo systemctl enable containerd.service
