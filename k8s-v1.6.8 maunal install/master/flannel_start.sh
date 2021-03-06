#!/bin/bash

clear
echo "Start Flannel steps:"
echo ""
echo " 1. Reload daemon"
echo "    $ systemctl daemon-reload"
echo ""
echo " 2. Enable flanneld"
echo "    $ systemctl enable flanneld"
echo ""
echo " 3. Reboot system"
echo "    $ sudo reboot"
echo ""
echo " 4. Restart docker"
echo "    $ systemctl restart docker"
echo ""
echo " 5. Confirm flannel inet and docker0 are work and in same network segment."
echo "    $ ifconfig"
echo "    ..."
echo "    flannel.1 Link encap:Ethernet  HWaddr xx:xx:xx:xx:xx:xx"
echo "              inet addr:172.17.41.0  ..."
echo "                        ^^^^^^^^^"
echo "    ..."
echo "    docker0   Link encap:Ethernet  HWaddr xx:xx:xx:xx:xx:xx"
echo "              inet addr:172.17.41.1  ..."
echo "                        ^^^^^^^^^"
echo "    ..."
echo ""
echo " 6. Test other nodes docker0 work"
echo "    $ ping [another node docker0 IP address] -c 1"
echo ""
