#!/usr/bin/env bash
export CROSS_COMPILE=aarch64-linux-gnu-
export CROSS_COMPILE_COMPAT=arm-linux-gnueabi-
export LLVM=1
export LLVM_IAS=1
export LD_LIBRARY_PATH="$/opt/glibc-2.36/bin:$LD_LIBRARY_PATH"

START=$(date +"%s")

make O=out CC=clang ARCH=arm64 psyche_defconfig
		

make ARCH=arm64 \
        O=out \
        CC=clang \
        AR=llvm-ar \
        NM=llvm-nm \
        OBJCOPY=llvm-objcopy \
        OBJDUMP=llvm-objdump \
        STRIP=llvm-strip \
        -j"$(nproc --all)" | tee log.txt	                      
        
        
END=$(date +"%s")
DIFF=$((END - START))
echo -e '\033[01;32m' "Kernel compiled successfully in $((DIFF / 60)) minute(s) and $((DIFF % 60)) seconds" || exit