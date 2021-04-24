#!/bin/sh

TOOLCHAIN_FILE="$(readlink -f dingux.cmake)"
SYSROOT_DIR="/opt/gcw0-toolchain/usr/mipsel-gcw0-linux-uclibc/sysroot"
SDL2_INC="${SYSROOT_DIR}/usr/include/SDL2/"
SDL_LIB="${SYSROOT_DIR}/usr/lib/libSDL2.so;${SYSROOT_DIR}/usr/lib/libSDL2_mixer.so"
DINGUX_FLAGS="-fomit-frame-pointer -march=mips32 -mtune=mips32r2 -mhard-float"
STRIP="/opt/gcw0-toolchain/usr/bin/mipsel-gcw0-linux-uclibc-strip"

cd ..
mkdir -p flibitBuild
cd flibitBuild

cmake .. -DCMAKE_BUILD_TYPE=Release \
-DCMAKE_TOOLCHAIN_FILE="$TOOLCHAIN_FILE" \
-DSDL2_INCLUDE_DIRS="$SDL2_INC" \
-DSDL2_LIBRARIES="$SDL_LIB" \
-DCMAKE_C_FLAGS="$DINGUX_FLAGS" \
-DCMAKE_CXX_FLAGS="$DINGUX_FLAGS"

make

$STRIP --strip-unneeded VVVVVV
