#include "vga.h"
#include "keyboard/keyboard.h"
#include "idt.h"
#include "mmu.h"
#include "pic.h"
#include "pio.h"
#include "pfa.h"
#include "multiboot.h"

#include <stdint.h>

void cvos_kernel(uint32_t magic, multiboot_info_t *multiboot)
{
    vga_text_clear();
    vga_text_printf("CVOS booting...\n");
    vga_text_printf("Magic number: %x\n", magic);

    if(magic != MULTIBOOT_BOOTLOADER_MAGIC)
    {
        vga_text_printf("ERROR: multiboot bootloader magic not correct. Aborting.\n");
        return;
    }

    vga_text_printf("Loading IDT...\n");
    idt_init();

    vga_text_printf("Initializing PIC...\n");
    /* remap pic interrupts to go from interrupt vectors 0x20-0x2F */
    pic_remap(0x20, 0x28);
    /* Just enable keyboard interrupts */
    /* DDDD_DDED DDDD_DDDD */
    pic_mask_interrupts(0xFC, 0xFF);

    
    vga_text_printf("Initializing MMU...\n");
    int ramsize = pfa_init(multiboot);
    vga_text_printf("RAM: 0x%x bytes available\n", ramsize);

extern int kernel_end;
    vga_text_printf("kernel_end: %x\n", (int)&kernel_end);

    mmu_init();

    asm("sti");

hltloop:
    asm("hlt");
    goto hltloop;
}

void int_pit()
{
    static int timer = 0;

    timer++;

    if(timer == 10)
    {
        timer = 0;
//        vga_text_printf("Ping. ");
    }
}

void int_kbhit()
{
    vga_text_printf("Got keycode: 0x%x\n", inb(0x60));
}

void cvos_interrupt_handler(uint32_t int_num, uint32_t err_code)
{
//    vga_text_printf("INTERRUPT: %d %d ", int_num, err_code);

    switch(int_num)
    {
        case 0x20:
            /* PIT */
            int_pit();
            break;
        case 0x21:
            /* kbhit */
            keyboard_int();
//            int_kbhit();
            break;
    }

    if(int_num >= 0x20 && int_num < 0x30)
    {
        pic_acknowledge_master_irq();
        if(int_num >= 0x28)
        {
            pic_acknowledge_slave_irq();
        }
    }
}
