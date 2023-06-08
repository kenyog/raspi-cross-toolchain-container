# Docker image with cross toolchains for Raspberry Pi OS

This is the repository for making docker image with cross-building toolchains for Raspberry Pi OS(32bit bullseye).
Supporting CMake, autotools and simple Makefile build system.
in addittion, it includes root filesystem of raspberry pi system, then you can
run built-binaries using `qemu` and can debug it using `gdb`.

[日本語](./README.ja.md)

## How to use

1. Make docker image
    ```sh
    $ git clone https://github.com/kenyog/raspi-cross-toolchain-container.git
    $ cd raspi-cross-toolchain-container
    $ docker compose build
    ```

2. Run container
    ```sh
    $ docker compose up -d
    $ docker compose exec raspi-cross /bin/bash
    root@.....:/opt#
    ```

3. Build sample program.
    ```sh
    $ docker compose exec raspi-cross /bin/bash
    root@.....:/opt# cd build-test/sample_hello/
    root@.....:/opt/build-test/sample_hello# make
    root@.....:/opt/build-test/sample_hello# make
    arm-linux-gnueabihf-gcc -o hello.o -c hello.c -I/opt/sysroot/usr/include/arm-linux-gnueabihf -I/opt/sysroot/usr/include/arm-linux-gnueabihf -fPIC -Wl,-rpath-link,/opt/sysroot/usr/lib/arm-linux-gnueabihf -L/opt/sysroot/usr/lib/arm-linux-gnueabihf
    arm-linux-gnueabihf-gcc -o hello hello.o --sysroot /opt/sysroot -fPIC -Wl,-rpath-link,/opt/sysroot/usr/lib/arm-linux-gnueabihf -L/opt/sysroot/usr/lib/ -L/opt/sysroot/usr/lib/arm-linux-gnueabihf -L/opt/sysroot/lib
    root@.....:/opt/build-test/sample_hello# ls
    Makefile  hello  hello.c  hello.o
    root@.....:/opt/build-test/sample_hello# file hello
    hello: ELF 32-bit LSB executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux-armhf.so.3, for GNU/Linux 3.2.0, not stripped
    ```

