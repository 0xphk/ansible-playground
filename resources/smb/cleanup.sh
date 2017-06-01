#!/bin/bash

set -x

##check database files
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
