#!/bin/sh

battery=$(headsetcontrol -cb 2> /dev/null)
if [ $? -ne 0 ] ; then
  printf "off"
else
  printf "${battery}%%"
fi
