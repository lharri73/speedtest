#!/bin/bash
#"server name","server id","latency","jitter","packet loss","download","upload","download bytes","upload bytes","share url"
curTime=`date +%s`
speedtest -f csv | \
awk -vtime="${curTime}" -F"\",\"" '{print time","$3","$5","$6","$7}' >> /opt/results/values.csv
# "latency, packetloss, download, upload"
