
ARCH=arm-linux-gnueabihf
TOOLDIR=/opt/toolchain/cross-pi-gcc-10.2.0-2
ROOTFS=/opt/sysroot
BINPREFIX=$TOOLDIR/bin/$ARCH

CC=$BINPREFIX-gcc
CXX=$BINPREFIX-g++
LD=$BINPREFIX-ld
AR=$BINPREFIX-ar
NM=$BINPREFIX-nm
OBJCOPY=$BINPREFIX-objcopy
OBJDUMP=$BINPREFIX-objdump
RANLIB=$BINPREFIX-ranlib
STRIP=$BINPREFIX-strip
LDFLAGS="-fPIC -Wl,-rpath-link,$ROOTFS/usr/lib/$ARCH -L$ROOTFS/usr/lib/$ARCH"
CFLAGS="-I$ROOTFS/usr/include/arm-linux-gnueabihf -fPIC -Wl,-rpath-link,$ROOTFS/usr/lib/$ARCH -L$ROOTFS/usr/lib/$ARCH"
CXXFLAGS="-I$ROOTFS/usr/include/arm-linux-gnueabihf -fPIC -Wl,-rpath-link,$ROOTFS/usr/lib/$ARCH -L$ROOTFS/usr/lib/$ARCH"

CONFIGURE_OPTIONS="--host=arm-linux-gnueabihf --build=x86_64-pc-linux-gnu"

