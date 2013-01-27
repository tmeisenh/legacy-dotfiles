#!/bin/bash
# Stupid script which mounts NFS Shares from Grendel

echo "Mounting NFS shares from grendel..."
mount_nfs grendel:/mnt/vault/pub /Volumes/User/travis/Movies/grendel
echo "Mounting NFS /mnt/vault/pub /Volumes/User/travis/Movies/grendel..."
mount_nfs grendel:/mnt/storage /Volumes/User/travis/Storage
echo "Mounting NFS /mnt/storage /Volumes/User/travis/Storage..."
