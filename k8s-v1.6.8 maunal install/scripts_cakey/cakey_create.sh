#!/bin/bash

PATH_CURR=$( cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd )
#echo ${PATH_CURR}

IP_MASTERS=( $(jq -r '.masters[].ip' k8s-config.json) )
IP_NODES=( $(jq -r '.nodes[].ip' k8s-config.json) )
IP_PROXY=( $(jq -r '.proxy[].ip' k8s-config.json) )
#echo ${IP_PROXY}

CA_DIR=${PATH_CURR}"/key"
if [ ! -d ${CA_DIR} ]; then
  mkdir -p ${CA_DIR}
fi

cd ${CA_DIR}
openssl genrsa -out ca.key 2048
openssl req -x509 -new -nodes -key ca.key -subj "/CN=${IP_PROXY}" -days 1000 -out ca.crt
openssl genrsa -out server.key 2048 
openssl req -new -key server.key -subj "/CN=${IP_PROXY}" -out server.csr
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -days 1000
openssl x509 -noout -text -in server.crt

#
# scp to masters
#
for ip in "${IP_MASTERS[@]}"
do
  scp -r ../key ${ip}:/srv/kubernetes/
done


#
# scp to nodes
#
for ip in "${IP_NODES[@]}"
do
  scp -r ../key ${ip}:/srv/kubernetes/
done


