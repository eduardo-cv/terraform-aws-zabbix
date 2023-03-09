#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y adduser libfontconfig1
wget https://dl.grafana.com/enterprise/release/grafana-enterprise_9.4.3_amd64.deb
sudo dpkg -i grafana-enterprise_9.4.3_amd64.deb
sudo systemctl daemon-reload
sudo systemctl start grafana-server
sudo systemctl status grafana-server
sudo systemctl enable grafana-server.service