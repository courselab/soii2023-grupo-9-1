## Boot, say hello, and halt (AT&T assembly)
    .code16

	.global _start

_start:	

    movb  $0x0e, %ah    #Set mode to tty
    
    movb  $'O', %al    #O
    int   $0x10
    movb  $'l', %al    #l
    int   $0x10
    movb  $'a', %al    #a
    int   $0x10
    movb  $' ', %al    #
    int   $0x10
    movb  $'M', %al    #M
    int   $0x10
    movb  $'u', %al    #u
    int   $0x10
    movb  $'n', %al    #n
    int   $0x10
    movb  $'d', %al    #d
    int   $0x10
    movb  $'o', %al    #O
    int   $0x10
    movb  $'!', %al    #!
    int   $0x10

halt:
    hlt
    jmp halt

    .fill 510 - (. - _start), 1, 0   # Pad with zeros
    .word 0xaa55                        #Boot Signature

        
 
	


