#
# File: build-env.sh
# Project: MetallOS
# File Created: Monday, 23rd November 2020 9:47:06 pm
# Author: mycatshoegazer (mycatshoegazer@outlook.com)
# -----
# Last Modified: Monday, 23rd November 2020 9:47:06 pm
# Modified By: mycatshoegazer (mycatshoegazer@outlook.com>)
# -----
# Copyright 2020 - 2020 mycatshoegazer, mycatshoegazer
#


#!/bin/bash

HEAP_SIZE="4096m"   # memory heap size
SWAP_SIZE="8192m"   # memory swap on host disk
CORE_LOAD="2"       # will load two cores

IMG_NAME="metallos-build-env"
if [[ "$1" == "--no-cache" ]]; then
    docker build --no-cache --tag=$IMG_NAME:latest .
else
    docker build --tag=$IMG_NAME:latest .
fi
#docker run --rm -it -v $(PWD):/workspace $IMG_NAME
docker run --memory=$HEAP_SIZE --memory-swap=$SWAP_SIZE --cpus=$CORE_LOAD --rm -it $IMG_NAME