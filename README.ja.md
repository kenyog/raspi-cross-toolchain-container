# ラズベリーパイ(32bit bullseye)用クロスビルド環境

Raspberry Pi OS(32bit Bullseye)向けのクロスビルドを行うためのDockerイメージを作成するためのリポジトリです。


## 使い方

1. イメージの作成
    ```sh
    $ git clone https://github.com/kenyog/raspi-cross-toolchain-container.git
    $ cd raspi-cross-toolchain-container
    $ docker compose build
    ```

2. コンテナ実行
    ```sh
    $ docker compose up -d
    $ docker compose exec raspi-cross /bin/bash
    root@.....:/opt#
    ```

3. サンプルプログラムのビルドと実行
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


