#!/bin/bash

echoerr() { echo "$@" 1>&2; }

if [ nmap localhost -p 5001 |grep -c open) -ne 0 ];then
    nmap localhost -p 5001
    exit 0
else
    nmap localhost -p 1>&2
    exit 1
fi
