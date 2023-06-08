#!/bin/bash

# make directory
mkdir -p build-mbed
cd build-mbed

# get source code and extract it
wget https://github.com/ARMmbed/mbedtls/archive/v2.7.17.tar.gz
tar xzvf v2.7.17.tar.gz

# build
mkdir -p mbedtls-2.7.17/build
cd mbedtls-2.7.17/build
cmake .. -DCMAKE_TOOLCHAIN_FILE=/opt/cross-env.cmake
make -j3

# install them into sysroot
make install DESTDIR=/opt/sysroot
