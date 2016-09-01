/* We start at kernel_entry */
ENTRY(kernel_entry)

SECTIONS
{
    /* Make a variable for our kernel base */
    kernel_base = 1M;
    . = kernel_base;

    /* First we have our text section */
    .text : {
        __text_start = .;
        /* Multiboot has to be near the beginning */
        KEEP(*(.multiboot*))
        __test_other_start = .;
        *(.text*)
        __text_end = .;
    }

    /* RO data */
    .rodata : {
        __rodata_start = .;
        *(.rodata*)
        __rodata_end = .;
    }

    /* Data */
    .data : {
        __data_start = .;
        *(.data*)
        __data_end = .;
    }

    /* Zero'd data */
    .bss : {
        __bss_start = .;
        *(.bss*)
        __bss_end = .;
    }

    kernel_end = ALIGN(0x1000);
}
