!/bin/bash

cd /usr/src/

#curl -O -L "https://github.com/grafana/loki/releases/download/v2.9.4/loki-linux-amd64.zip"
#unzip loki-linux-amd64.zip
#wget https://raw.githubusercontent.com/grafana/loki/main/cmd/loki/loki-local-config.yaml

if [ ! -f /usr/src/loki/loki-linux-amd64 ]; then sudo cp /srv/shared/external-softwares/loki/loki-linux-amd64 /usr/src/loki/ ; else echo "" ; fi

if [ ! -f /usr/src/loki/loki-local-config.yaml ]; then sudo cp /srv/shared/external-softwares/loki/loki-local-config.yaml /usr/src/loki/ ; else echo ""; fi

if [ ! -f /etc/systemd/system/loki.service ]; then sudo cp /srv/shared/external-softwares/loki/loki.service /etc/systemd/system/ ; echo ""; fi

sudo systemctl enable loki

sudo service loki restart
