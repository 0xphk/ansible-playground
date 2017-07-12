#!/bin/bash

set -x

##quit samba
killall samba
for service in winbind nmbd smbd; do service $i stop; done
sleep 1

##flush winbind cache
net cache flush
rm -fr /var/lib/samba/winbindd_cache.tdb /var/cache/samba/*

##check database files
updatedb
locate *.tdb
locate *.ldb

##config files
rm -f /etc/samba/smb.conf
rm -f /etc/krb5.conf

##database files
#rm -f /var/run/samba/*.tdb
#rm -f /var/lib/samba/*.tdb
#rm -f /var/cache/samba/*.tdb
#rm -f /var/lib/samba/private/*.tdb
#rm -f /var/lib/samba/private/*.ldb

for i in $(locate *.tdb); do rm -f $i; done
for i in $(locate *.ldb); do rm -f $i; done

##update database
updatedb

##check database files again, should be empty
locate *.tdb
locate *.ldb

sed -i 's/10.110.40.2/10.110.0.131/g' /etc/resolv.conf

