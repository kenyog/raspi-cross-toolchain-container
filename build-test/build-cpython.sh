#!/bin/bash

. /opt/corss-env.sh

# get source code and make build dir
git clone https://github.com/python/cpython.git --depth 1 -b v3.10.6
mkdir cpython/build
cd cpython/build

# create site configuration file (https://docs.python.org/3.11/using/configure.html#cmdoption-arg-CONFIG_SITE)
cat >> config.site <<EOL
ac_cv_buggy_getaddrinfo=no
ac_cv_file__dev_ptmx=yes
ac_cv_file__dev_ptc=no
EOL

# build
CONFIG_SITE=config.site ../configure --host=arm-linux-gnueabihf --build=x86_64-pc-linux-gnu --disable-ipv6
make -j3

# install them into sysroot
make install DESTDIR=/opt/sysroot
