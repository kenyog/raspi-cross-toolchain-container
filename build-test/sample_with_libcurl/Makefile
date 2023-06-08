SYSROOT = /opt/sysroot
ARCHITECTURE = arm-linux-gnueabihf
CC = $(ARCHITECTURE)-gcc
CXX = $(ARCHITECTURE)-g++
CFLAGS = -I${SYSROOT}/usr/include/arm-linux-gnueabihf -I${SYSROOT}/usr/include/arm-linux-gnueabihf -fPIC -Wl,-rpath-link,${SYSROOT}/usr/lib/${ARCHITECTURE} -L${SYSROOT}/usr/lib/${ARCHITECTURE}
LDFLAGS = --sysroot ${SYSROOT} -fPIC -Wl,-rpath-link,${SYSROOT}/usr/lib/${ARCHITECTURE} -L${SYSROOT}/usr/lib/ -L${SYSROOT}/usr/lib/${ARCHITECTURE} -L${SYSROOT}/lib


all: libcurl-dev curlget

.c.o:
	${CC} -o $@ -c $^ ${CFLAGS}

curlget: curlget.o
	${CC} -o $@ $^ ${LDFLAGS} -lcurl

clean:
	rm -f *.o curlget

install:
	install curlget ${SYSROOT}/usr/local/bin

libcurl-dev:
	chroot ${SYSROOT} /qemu-arm-static /bin/bash -c 'apt-get update && apt-get install -y libcurl4-gnutls-dev'
