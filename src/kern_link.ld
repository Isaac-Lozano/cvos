HIGHER_HALF_ADDR = 0xc0000000;

/* We start at kernel_entry */
ENTRY(kernel_entry)

SECTIONS
{
    /* Make a variable for our kernel base */
    /* This will be at 0xc0000000 + 1M for
     * our higher half kernel
     */
    kernel_base = HIGHER_HALF_ADDR + 1M;
    . = kernel_base;

    /* First we have our text section */
    /* Loaded at 1M, but virtual address above */
    /* Will be page aligned to ease paging */
    .text ALIGN(4K): AT(ADDR(.text) - HIGHER_HALF_ADDR) {
        __text_start = .;
        /* Multiboot has to be near the beginning */
        KEEP(*(.multiboot*))
        __test_other_start = .;
        *(.text*)
        __text_end = .;
    }

    /* RO data */
    .rodata ALIGN(4K): AT(ADDR(.rodata) - HIGHER_HALF_ADDR) {
        __rodata_start = .;
        *(.rodata*)
        __rodata_end = .;
    }

    /* Data */
    .data ALIGN(4K): AT(ADDR(.data) - HIGHER_HALF_ADDR) {
        __data_start = .;
        *(.data*)
        __data_end = .;
    }

    /* Zero'd data */
    .bss ALIGN(4K): AT(ADDR(.bss) - HIGHER_HALF_ADDR) {
        __bss_start = .;
        *(.bss*)
        __bss_end = .;
    }

    whereami = .;
    kernel_end = ALIGN(0x1000);
}
