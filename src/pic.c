#include "pic.h"

#include "pio.h"

#define PIC_MASTER_COMMAND_PORT 0x0020
#define PIC_MASTER_DATA_PORT 0x0021
#define PIC_SLAVE_COMMAND_PORT 0x00A0
#define PIC_SLAVE_DATA_PORT 0x00A1

#define ICW1_ICW4 0x01       /* ICW4 (not) needed */
#define ICW1_SINGLE 0x02     /* Single (cascade) mode */
#define ICW1_INTERVAL4 0x04  /* Call address interval 4 (8) */
#define ICW1_LEVEL 0x08      /* Level triggered (edge) mode */
#define ICW1_INIT 0x10       /* Initialization - required! */

#define ICW4_8086 0x01       /* 8086/88 (MCS-80/85) mode */
#define ICW4_AUTO 0x02       /* Auto (normal) EOI */
#define ICW4_BUF_SLAVE 0x08  /* Buffered mode/slave */
#define ICW4_BUF_MASTER 0x0C /* Buffered mode/master */
#define ICW4_SFNM 0x10       /* Special fully nested (not) */

void pic_remap(uint8_t master_base, uint8_t slave_base)
{
    uint8_t master_mask = inb(PIC_MASTER_DATA_PORT);
    uint8_t slave_mask = inb(PIC_SLAVE_DATA_PORT);

    outb(PIC_MASTER_COMMAND_PORT, ICW1_INIT | ICW1_ICW4);
    outb(PIC_SLAVE_COMMAND_PORT, ICW1_INIT | ICW1_ICW4);

    outb(PIC_MASTER_DATA_PORT, master_base);
    outb(PIC_SLAVE_DATA_PORT, slave_base);

    outb(PIC_MASTER_DATA_PORT, 0x04);
    outb(PIC_SLAVE_DATA_PORT, 0x02);

    outb(PIC_MASTER_DATA_PORT, ICW4_8086);
    outb(PIC_SLAVE_DATA_PORT, ICW4_8086);

    outb(PIC_MASTER_DATA_PORT, master_mask);
    outb(PIC_SLAVE_DATA_PORT, slave_mask);
}

void pic_mask_interrupts(uint8_t master_mask, uint8_t slave_mask)
{
    outb(PIC_MASTER_DATA_PORT, master_mask);
    outb(PIC_SLAVE_DATA_PORT, slave_mask);
}

void pic_acknowledge_master_irq()
{
    outb(PIC_MASTER_COMMAND_PORT, 0x20);
}

void pic_acknowledge_slave_irq()
{
    outb(PIC_SLAVE_COMMAND_PORT, 0x20);
}
