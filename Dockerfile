from ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      ca-certificates \
      cmake \
      file \
      git \
      make \
      python3 \
      qemu-user-static \
      vim \
      wget \
      xz-utils \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN wget https://downloads.raspberrypi.org/raspios_lite_armhf/archive/2023-05-03-11:32/root.tar.xz
RUN wget https://sourceforge.net/projects/raspberry-pi-cross-compilers/files/Raspberry%20Pi%20GCC%20Cross-Compiler%20Toolchains/Bullseye/GCC%2010.2.0/Raspberry%20Pi%203A%2B%2C%203B%2B%2C%204/cross-gcc-10.2.0-pi_3%2B.tar.gz

RUN mkdir -p /opt/sysroot /opt/toolchain
RUN tar -xvf root.tar.xz -C /opt/sysroot
RUN tar -xvf cross-gcc-10.2.0-pi_3+.tar.gz -C /opt/toolchain

# Fix root.tar.xz error.
RUN ln -s ./arm-linux-gnueabihf/crt1.o /opt/sysroot/usr/lib/ \
 && ln -s ./arm-linux-gnueabihf/crti.o /opt/sysroot/usr/lib/ \
 && ln -s ./arm-linux-gnueabihf/crtn.o /opt/sysroot/usr/lib/

# For sysroot chroot using qemu
RUN cp /usr/bin/qemu-arm-static /opt/sysroot/

COPY cross-env.cmake /opt/
COPY cross-env.sh /opt/
RUN echo ". /opt/cross-env.sh"  >> ~/.bashrc
RUN echo "alias cmake='cmake -DCMAKE_TOOLCHAIN_FILE=/opt/cross-env.cmake'"  >> ~/.bashrc

#COPY build-test /opt/

ENV PATH /opt/toolchain/cross-pi-gcc-10.2.0-2/bin:$PATH
CMD /bin/bash

