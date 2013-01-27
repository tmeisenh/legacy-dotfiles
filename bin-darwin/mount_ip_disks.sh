#!/bin/bash
# Stupid script which mounts NFS Shares from Grendel

echo "Mounting NFS shares from grendel..."
mount_nfs 192.168.1.2:/mnt/vault/pub /Volumes/User/travis/Movies/grendel
echo "Mounting NFS /mnt/vault/pub /Volumes/User/travis/Movies/grendel..."
mount_nfs 192.168.1.2:/mnt/storage /Volumes/User/travis/Storage
echo "Mounting NFS /mnt/storage /Volumes/User/travis/Storage..."
