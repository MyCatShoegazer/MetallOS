 #
 # File: Dockerfile
 # Project: MetallOS
 # File Created: Monday, 23rd November 2020 9:29:00 pm
 # Author: mycatshoegazer (mycatshoegazer@outlook.com)
 # -----
 # Last Modified: Monday, 23rd November 2020 9:29:00 pm
 # Modified By: mycatshoegazer (mycatshoegazer@outlook.com>)
 # -----
 # Copyright 2020 - 2020 mycatshoegazer, mycatshoegazer
 #


FROM ubuntu:latest as metallos-build-env

LABEL maintainer="mycatshoegazer@outlook.com"
LABEL version="0.1"
LABEL description="MetallOS build environment."

RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt install -y tzdata

RUN apt-get install -y build-essential
RUN apt-get install -y build-essential
RUN apt-get install -y gcc
RUN apt-get install -y make
RUN apt-get install -y grub-pc
RUN apt-get install -y bison
RUN apt-get install -y flex
RUN apt-get install -y libgmp3-dev
RUN apt-get install -y libmpc-dev
RUN apt-get install -y libmpfr-dev
RUN apt-get install -y texinfo
RUN apt-get install -y wget
RUN apt-get install -y xorriso
RUN apt-get install -y aria2

WORKDIR /root
ADD _links.list .

RUN aria2c -l - -d ./ -x 16 -j 16 -i ./_links.list
RUN tar -xzf binutils-2.35.tar.gz
RUN tar -xzf gcc-10.2.0.tar.gz

WORKDIR /root/binutils-2.35
RUN \
    export PREFIX="$HOME/opt/cross" && \
    export TARGET=i686-elf && \
    export PATH="$PREFIX/bin:$PATH" && \
    ./configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror && \
    make && \
    make install

WORKDIR /root/gcc-10.2.0
RUN \
    export PREFIX="$HOME/opt/cross" && \
    export TARGET=i686-elf && \
    export PATH="$PREFIX/bin:$PATH" && \
    which -- $TARGET-as || echo $TARGET-as is not in the PATH && \
    ./configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers && \
    make all-gcc && \
    make all-target-libgcc && \
    make install-gcc && \
    make install-target-libgcc

WORKDIR /root

ENTRYPOINT [ "/bin/bash" ]