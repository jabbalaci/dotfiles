#!/usr/bin/env bash
 
sudo ufw reset
sudo ufw disable
 
# open this port (example)
# sudo ufw allow 12345/tcp
 
sudo ufw default deny incoming
sudo ufw default allow outgoing
 
sudo ufw enable
 
sudo ufw status verbose
