#!/bin/bash

val=$(cat /sys/class/power_supply/BAT1/capacity)

echo "$val%"
