#!/bin/bash
# check whether sel is full or not, dump contents via mail, clear sel and mail status

#set -x

CUSTOMER=$(hostname -f | cut -d'.' -f2)
HOSTNAME=$(hostname -f)

if ipmitool sel | grep true;
  then
    echo "System event log on $HOSTNAME needs rotation: $(ipmitool sel)" | mail -s "[WARNING] $HOSTNAME system event log full" root;
    ipmitool sel elist | mail -s "[INFO] $HOSTNAME system event log dump $(date +%Y%m%d)" root;
    ipmitool sel clear && sleep 5;
    echo "System event log on $HOSTNAME: $(ipmitool sel | grep Percent)" | mail -s "[INFO] $HOSTNAME system event log status" root;
  else
    #trendanalyse
    echo "System event log on $HOSTNAME: $(ipmitool sel | grep Percent)" | mail -s "[INFO] $HOSTNAME system event log status" root;
fi
