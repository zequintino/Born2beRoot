#!/bin/bash

OS=$(uname -a)
PHYSICAL_CPU=$(grep -c processor /proc/cpuinfo)
VIRTUAL_CPU=$(grep -c processor /proc/cpuinfo)


echo "#Architecture: $OS"
echo "#CPU physical: $PHYSICAL_CPU"
echo "#vCPU		   : "
