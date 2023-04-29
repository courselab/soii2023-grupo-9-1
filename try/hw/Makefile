##  Makefile.m4 - Makefile template.
##    
##  Copyright (c) 2021 - Monaco F. J. <monaco@usp.br>
##
##  This file is part of SYSeg. 
##
##  SYSeg is free software: you can redistribute it and/or modify
##  it under the terms of the GNU General Public License as published by
##  the Free Software Foundation, either version 3 of the License, or
##  (at your option) any later version.
##
##  SYSeg is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU General Public License for more details.
##
##  You should have received a copy of the GNU General Public License
##  along with .  If not, see <http://www.gnu.org/licenses/>.
##
##  ------------------------------------------------------------------
##
##  Note: this is a source file used to produce either a documentation, item,
##        item, script or another source file by m4 macro processor. If you've
##	   come across a file named, say foo.m4, while looking for one of the
##	   aforementioned items, changes are you've been looking for file foo,
##	   instead. If you can't find foo, perhaps it is because you've missed
## 	   missed the build steps described in the file README, found in the
##	   top source directory of this project.
##        
##

##
## Relevent files for this exercise.
##

all: # hw-hex hw-s hw-c
	@echo "Edit this rule"

#############################################################

hw-hex.bin : hw.hex
	xxd -r -p hw.hex > hw-hex.bin

hw-hex.bin/run : hw-hex.bin
	qemu-system-i386 -drive format=raw,file=hw-hex.bin -net none

#############################################################

hw-s.o : hw.S
	as --32 hw.S -o hw-s.o

hw-s.bin : hw-s.o
	ld -melf_i386 --oformat=binary -Ttext=0x7c00 hw-s.o -o hw-s.bin

hw-s.bin/run : hw-s.bin
	qemu-system-i386 -drive format=raw,file=hw-s.bin -net none

hw-s.bin/dump : hw-s.bin/dump
	objdump -M intel -b binary -m i8086 -D hw-s.bin

#############################################################
rt0.s :
	gcc -m16 -fno-pic -fno-asynchronous-unwind-tables -fcf-protection=none rt0.c -S

rt0.o : rt0.s
	as --32 rt0.s -o rt0.o

hw-c.s :
	cc -m16 -fno-pic -fno-asynchronous-unwind-tables -fcf-protection=none hw.c -S -o hw-c.s

hw-c.o : hw-c.s
	as --32 hw-c.s -o hw-c.o

hw-c.bin : hw-c.o  rt0.o 
	ld -melf_i386 -T boot.ld --orphan-handling=discard hw-c.o -o hw-c.bin

hw-c.bin/run : hw-c.bin
	qemu-system-i386 -drive format=raw,file=hw-c.bin -net none

hw-c.bin/dump : hw-c.bin/dump
	objdump -M intel -b binary -m i8086 -D hw-c.bin

#############################################################

.PHONY: clean

clean:
	rm -rf *.bin *.o *.s
