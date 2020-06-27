#!/bin/sh

#  autmount.sh Only patches the files that get deleted on update
#  automount.sh --all-files here/there 192.168.1.xxx:/some/path
# DEBUG=1 automount.sh for debug

AUTO_NFS=/etc/auto_nfs
AUTO_MASTER=/etc/auto_master
MOUNT_POINT=$2
NFS_LOCATION=$3 # eg 192.168.1.xxx:/some/path
if [[ $DEBUG != "" ]]; then
    AUTO_MASTER=auto_master
    AUTO_NFS=auto_nfs
fi

echo "/-    auto_nfs    -nobrowse,nosuid" >> $AUTO_MASTER

if [[ $1 = "--all-files" ]]; then
    echo "/System/Volumes/Data/Users/`whoami`/$MOUNT_POINT -fstype=nfs,noowners,nolockd,resvport,hard,bg,intr,rw,tcp,nfc,rsize=8192,wsize=8192 nfs://$NFS_LOCATION" > $AUTO_NFS
fi

cat $AUTO_NFS
echo ====
cat $AUTO_MASTER
