#!/bin/bash

PATH_CURR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
PATH_DWONLOAD=${PATH_CURR}"/../downloads/"

if [ ! -d ${PATH_DWONLOAD} ]; then
  mkdir -p ${PATH_DWONLOAD}
fi

cd ${PATH_DWONLOAD}
FILE_WGET="flannel-v0.7.1-linux-amd64.tar.gz"
wget -nc "https://github.com/coreos/flannel/releases/download/v0.7.1/"${FILE_WGET}

PATH_INSTALL="/opt/flannel/"
if [ ! -d ${PATH_INSTALL} ]; then
  sudo mkdir -p ${PATH_INSTALL}
fi
sudo tar zxf ${FILE_WGET} -C ${PATH_INSTALL}

printf "\n\n Directory of ${PATH_INSTALL}:\n\n"
ls -l --color=auto ${PATH_INSTALL}



