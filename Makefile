all: kernel hello.bin

clean_kernel:
	rm -rf kernel.h kernel-raw.c kernel.make

kernel: clean_kernel
	wget https://raw.githubusercontent.com/liamos-operating-system/liamos/master/src/kernel.h
	wget https://raw.githubusercontent.com/liamos-operating-system/liamos/master/src/raw/kernel-raw.c
	wget -O kernel.make https://raw.githubusercontent.com/liamos-operating-system/liamos/master/Makefile

hello.bin: src/hello.c
	${MAKE} -f kernel.make hello.o