#!/usr/bin/env bash

# USER
user=$(echo "$USER")
# OS
. /etc/os-release
# KERNEL
read -r kernel < /proc/sys/kernel/osrelease
# PKGS
pkgs=$(pacman -Q | wc -l)
# WM
wm=$(echo "$XDG_CURRENT_DESKTOP")
# TEMRINAL
term=$(echo "TERM")

# PALETTE
c0='[0m';
c1='[31m'; c2='[32m'
c3='[33m'; c4='[34m'
c5='[35m'; c6='[36m'
c7='[37m'; c8='[38m'
palette="[7m$c1 $c1 $c2 $c2 $c3 $c3 $c4 $c4 $c5 $c5 $c6 $c6 [m"

# OUTPUT
printf '%s\n' "
 ${c5}      /\\         ${c6}os       ${c0}${PRETTY_NAME,,}
 ${c5}     /  \\        ${c6}kernel   ${c0}${kernel,,}
 ${c5}    /\\   \\       ${c6}pkgs   ${c0}  ${pkgs}
 ${c5}   /      \\      ${c6}shell    ${c0}${SHELL##*/}
 ${c5}  /   ''  _\\     ${c6}wm       ${c0}${wm,,}
 ${c5} /   |  |   \\
 ${c5}/_-''    ''-_\\   ${palette}
"

