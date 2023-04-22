rt0.s :
	gcc -m16 -fno-pic -fno-asynchronous-unwind-tables -fcf-protection=none rt0.c -S

rt0.o : rt0.s
	as --32 rt0.s -o rt0.o

bootloader.s :
	cc -m16 -fno-pic -fno-asynchronous-unwind-tables -fcf-protection=none bootloader.c -S

bootloader.o : bootloader.s
	as --32 bootloader.s -o bootloader.o

boot.bin : bootloader.o  rt0.o 
	ld -melf_i386 -T boot.ld --orphan-handling=discard bootloader.o -o boot.bin

clean : 
	rm *.o *.s *.bin

run : boot.bin   
	qemu-system-i386 -drive format=raw,file=boot.bin -net none

dump :
	objdump -M intel -b binary -m i8086 -D boot.bin
