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

IMG_NAME="metallos-build-env"
if [[ "$1" == "--no-cache" ]]; then
    docker build --no-cache --tag=$IMG_NAME:latest .
else
    docker build --tag=$IMG_NAME:latest .
fi
#docker run --rm -it -v $(PWD):/workspace $IMG_NAME
docker run --rm -it $IMG_NAME