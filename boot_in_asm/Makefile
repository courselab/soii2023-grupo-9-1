bootloader.o : bootloader.S
	as --32 bootloader.S -o bootloader.o

boot.bin : bootloader.o 
	ld -melf_i386 --oformat=binary -Ttext=0x7c00 bootloader.o -o boot.bin

clean : 
	rm *.o *.s *.bin

run : boot.bin   
	qemu-system-i386 -drive format=raw,file=boot.bin -net none

dump :
	objdump -M intel -b binary -m i8086 -D boot.bin
