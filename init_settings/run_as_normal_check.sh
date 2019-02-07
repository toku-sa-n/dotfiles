#!/bin/bash

which sudo > /dev/null 2>/dev/null

which_status=$?
if [ $which_status -ne 0 ];  then
    echo 'You must install sudo.'
    exit 1
fi
if whoami | grep -sq 'root' ; then
    echo 'Running as the root is risky. Try to run as a normal user.'
    exit 1
fi
