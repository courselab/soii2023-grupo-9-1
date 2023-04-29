OUTPUT_FORMAT(binary)
SECTIONS {
    . = 0x7C00;
    .text : {
        *(.text)
        *(.rodata)
    }
    . = 0x7C00 + 510;
    .signature : {
        BYTE(0x55)
        BYTE(0xAA)
    }
    __END_STACK__ = 0x7E00 + 0x200;
}
STARTUP(rt0.o);
