SYSROOT = /opt/sysroot
ARCHITECTURE = arm-linux-gnueabihf
CC = $(ARCHITECTURE)-gcc
CXX = $(ARCHITECTURE)-g++
CFLAGS = -I${SYSROOT}/usr/include/arm-linux-gnueabihf -I${SYSROOT}/usr/include/arm-linux-gnueabihf -fPIC -Wl,-rpath-link,${SYSROOT}/usr/lib/${ARCHITECTURE} -L${SYSROOT}/usr/lib/${ARCHITECTURE}
LDFLAGS = --sysroot ${SYSROOT} -fPIC -Wl,-rpath-link,${SYSROOT}/usr/lib/${ARCHITECTURE} -L${SYSROOT}/usr/lib/ -L${SYSROOT}/usr/lib/${ARCHITECTURE} -L${SYSROOT}/lib


all: hello

.c.o:
	${CC} -o $@ -c $^ ${CFLAGS}

hello: hello.o
	${CC} -o $@ $^ ${LDFLAGS}

clean:
	rm -f *.o hello

install:
	install hello ${SYSROOT}/usr/local/bin

