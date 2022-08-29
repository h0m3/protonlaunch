#!/bin/sh
# Test script for ProtonLaunch
# Used only for debugging purposes
#

echo -e "\n\t:: bash"
bash ./protonlaunch ${@}

echo -e "\n\t:: zsh"
zsh ./protonlaunch ${@}
zsh -y ./protonlaunch ${@}

echo -e "\n\t:: dash"
dash ./protonlaunch ${@}

echo -e "\n\t:: busybox"
busybox sh ./protonlaunch ${@}
