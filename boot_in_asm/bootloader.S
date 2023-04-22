## Boot, say hello, and halt (AT&T assembly)
## 4f 6c 61 20  6d 75 6e 64  6f 21

    .code16

	.global _start

_start:	

    movb  $0x0e, %ah    #Set mode to tty
    
    movb  $0x4f, %al    #O
    int   $0x10
    movb  $0x6c, %al    #l
    int   $0x10
    movb  $0x61, %al    #a
    int   $0x10
    movb  $0x20, %al    #
    int   $0x10
    movb  $0x6d, %al    #M
    int   $0x10
    movb  $0x75, %al    #u
    int   $0x10
    movb  $0x6e, %al    #n
    int   $0x10
    movb  $0x64, %al    #d
    int   $0x10
    movb  $0x6f, %al    #O
    int   $0x10
    movb  $0x21, %al    #!
    int   $0x10

halt:
    hlt
    jmp halt

    .fill 510 - (. - _start), 1, 0   # Pad with zeros
    .word 0xaa55                        #Boot Signature

        
 
	


