all: kernel output.bin

clean_kernel:
	rm -rf kernel.h kernel-raw.c kernel.make

kernel: clean_kernel
	wget https://raw.githubusercontent.com/liamos-operating-system/liamos/master/src/kernel.h
	wget https://raw.githubusercontent.com/liamos-operating-system/liamos/master/src/raw/kernel-raw.c
	wget -O kernel.make https://raw.githubusercontent.com/liamos-operating-system/liamos/master/Makefile

output.bin: src/hello.c
	cp src/hello.c src/output.c
	${MAKE} -f kernel.make output.bin
	rm src/output.c