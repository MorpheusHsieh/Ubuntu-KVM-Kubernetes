# Install etcd on k8s-master1 & 2

PATH_CURR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
PATH_DOWNLOAD=${PATH_CURR}"/../downloads/"

#
# Download Etcd
#
FILE_TARGET="etcd-v3.2.5-linux-amd64.tar.gz"
mkdir -p ${PATH_DOWNLOAD}
cd ${PATH_DOWNLOAD}
wget -nc "https://github.com/coreos/etcd/releases/download/v3.2.5/"${FILE_TARGET}
tar zxf ${FILE_TARGET}
ls -l --color=auto ${PATH_DOWNLOAD}${FILE_TARGET}

#
# Stop Etcd
#
systemctl stop etcd
systemctl status etcd

#
# Upgrade Etcd
#
PATH_SOURCE=${FILE_TARGET%.tar.gz}
PATH_INSTALL="/opt/etcd/bin/"
sudo mkdir -p ${PATH_INSTALL}
sudo chown -R user:user /opt/etcd
mv ${PATH_DOWNLOAD}${PATH_SOURCE}/etcd* ${PATH_INSTALL}
ls -l --color=auto ${PATH_INSTALL}

printf "\n\n-- Etcd version:\n\n"
/opt/etcd/bin/etcd --version

printf "\n\n-- Start etcd:\n\n"
systemctl start etcd

printf "\n\n-- Show status of etcd:\n\n"
systemctl status etcd
echo ""
