#!/bin/bash

# install libcurl dev package into sysroot
chroot /opt/sysroot /qemu-arm-static /bin/bash -c '\
  apt-get update && apt-get install -7 --no-install-recommends \
    libcurl4-gnutls-dev \
  && rm -rf /var/lib/apt/lists/*'

mkdir -p build-sample-curlget/build
cd build-sample-curlget/build
cmake .. -DCMAKE_TOOLCHAIN_FILE=/opt/cross-env.cmake
make install DESTDIR=/opt/sysroot

