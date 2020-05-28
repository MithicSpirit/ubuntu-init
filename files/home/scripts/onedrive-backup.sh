#!/bin/bash

echo -ne "\nPlease enter your password: "
read -s SUDO
echo "$SUDO" | sudo -S -p $(echo -e "\033[0m") echo -e "\n"

if [[ ! -d "/mnt/d" ]]; then
  echo -e "\033[0;33mNo mount folder /mnt/d/\033[0m"
  echo "$SUDO" | sudo -S -p $(echo -e "\033[0m") mkdir -v /mnt/d
  echo -e "\033[0;32mCreated mount folder /mnt/d/\n\033[0m"
else 
  echo -e "\033[0;32mFound mount folder /mnt/d/\n\033[0m"
fi

echo -e "\033[0;33mMounting D: Drive\033[0m"
echo "$SUDO" | sudo -S -p $(echo -e "\033[0m") mount -t drvfs D: "/mnt/d"
echo -e "\033[0;32mD: Drive mounted to /mnt/d/\n\033[0m"


echo -e "\033[0;31mReplacing old backup directory /mnt/d/backuptemp/\033[1;33m"
echo "$SUDO" | sudo -S -p $(echo -e "\033[0m") rsync -auv --delete "/mnt/d/OneDrive/" "/mnt/d/backuptemp/"
echo -e "\033[0;32mCreated new backup directory /mnt/d/backuptemp/\n\033[1;33m"


echo -e "\033[0;33mChecking differences from main\033[1;33m"
echo "$SUDO" | sudo -S -p $(echo -e "\033[0m") diff -rq "/mnt/c/Users/rpc01/OneDrive - Sarasota County School District/" "/mnt/d/OneDrive/"

echo -e "\n\033[0;31mSynchronizing directories\033[1;33m"
echo "$SUDO" | sudo -S -p $(echo -e "\033[0m") rsync -auv --del "/mnt/c/Users/rpc01/OneDrive - Sarasota County School District/" "/mnt/d/OneDrive/"
echo -e "\033[0;32mDirectories synchronized\n\033[0m"


echo -e "\033[0;33mChecking differences to backup\033[1;33m"
echo "$SUDO" | sudo -S -p $(echo -e "\033[0m") diff -rq "/mnt/d/OneDrive/" "/mnt/d/backuptemp/"


echo -e "\n\033[0;33mUnmounting D: Drive\033[1;33m"
echo "$SUDO" | sudo -S -p $(echo -e "\033[0m") umount -v "/mnt/d"
echo -e "\033[0;32mD: Drive unmounted from /mnt/d/\n\033[0m"


echo -e "\n\033[1;32mDone!\n\033[0m"
