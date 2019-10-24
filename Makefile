all: clean kernel output.bin

clean: clean_kernel
	rm -rf out

clean_kernel:
	rm -rf kernel.h kernel-raw.c kernel.make

kernel: clean_kernel
	wget https://raw.githubusercontent.com/liamos-operating-system/liamos/master/src/kernel.h
	wget https://raw.githubusercontent.com/liamos-operating-system/liamos/master/src/raw/kernel-raw.c

output.bin: hello.bin
	mv hello.bin output.bin

%.bin: src/%.c
	clang -fasm-blocks -masm=intel -Wl,--oformat=binary,-Ttext,0x1000,-Trodata,0x0000,-Tdata,0x0A00,-Tbss,0x0A00 -nostdlib -nostartfiles -nodefaultlibs -m16 -Os -o $@ $<