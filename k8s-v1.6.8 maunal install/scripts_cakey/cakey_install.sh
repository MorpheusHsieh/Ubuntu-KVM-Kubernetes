#!/bin/bash

sudo mkdir -p /srv/kubernetes/key/

# Change as your username and password
sudo chown -R user:user /srv/kubernetes/key/

# Change your key path
cp -a keys/. /srv/kubernetes/key/

# Show key
printf "\n\n-- Show k8s public key:\n\n"
ls -l --color=auto /srv/kubernetes/key/


