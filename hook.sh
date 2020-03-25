#!/bin/bash
#Required 775 permissions
#iptables -t nat -I POSTROUTING -p all -s 172.17.0.0/16 -j SNAT --to-source 192.168.1.100