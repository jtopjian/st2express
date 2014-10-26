#!/bin/bash

bash /vagrant/support/mistral.sh
cd /root
curl -sS -k -O https://ops.stackstorm.net/releases/st2/scripts/st2_deploy.sh
bash /root/st2_deploy.sh 0.5.1
bash /vagrant/support/rsyslog.sh
