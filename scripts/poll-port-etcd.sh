#!/bin/bash
#Do a simple loop, check for an available port and light up ETCD path with the relevant details while it's alive

while true; do
    nc -zv ${CHECK_HOST} ${CHECK_PORT} \
    if [ $? -eq 0 ]; then \
      curl -sS -L -X PUT ${CHECK_ETCD_HOST}${CHECK_ETCD_PATH}?ttl=${CHECK_TTL} -d value=\'{"host": "%H", "ipv4_addr": ${CHECK_HOST}, "port": ${CHECK_PORT} }\' \
    else \
      curl -sS -L -X DELETE ${CHECK_ETCD_HOST}${CHECK_ETCD_PATH} \
    fi \
    sleep ${CHECK_SLEEP} 
done
