#include "idt.h"

#include <stdint.h>

/* 0x10 cpu interrupts and 0x20 PIC interrupts */
#define IDT_NUM_INTERRUPTS 0x30

struct __attribute__((__packed__)) idtr
{
    uint16_t limit;
    uint32_t base;
};

struct __attribute__((__packed__)) idt_entry
{
    uint16_t base_l;
    uint16_t segment;
    uint8_t zero;
    uint8_t type_attr;
    uint16_t base_h;
};

extern void _cvos_interrupt_0x00();
extern void _cvos_interrupt_0x01();
extern void _cvos_interrupt_0x02();
extern void _cvos_interrupt_0x03();
extern void _cvos_interrupt_0x04();
extern void _cvos_interrupt_0x05();
extern void _cvos_interrupt_0x06();
extern void _cvos_interrupt_0x07();
extern void _cvos_interrupt_0x08();
extern void _cvos_interrupt_0x09();
extern void _cvos_interrupt_0x0a();
extern void _cvos_interrupt_0x0b();
extern void _cvos_interrupt_0x0c();
extern void _cvos_interrupt_0x0d();
extern void _cvos_interrupt_0x0e();
extern void _cvos_interrupt_0x0f();
extern void _cvos_interrupt_0x10();
extern void _cvos_interrupt_0x11();
extern void _cvos_interrupt_0x12();
extern void _cvos_interrupt_0x13();
extern void _cvos_interrupt_0x14();
extern void _cvos_interrupt_0x15();
extern void _cvos_interrupt_0x16();
extern void _cvos_interrupt_0x17();
extern void _cvos_interrupt_0x18();
extern void _cvos_interrupt_0x19();
extern void _cvos_interrupt_0x1a();
extern void _cvos_interrupt_0x1b();
extern void _cvos_interrupt_0x1c();
extern void _cvos_interrupt_0x1d();
extern void _cvos_interrupt_0x1e();
extern void _cvos_interrupt_0x1f();
extern void _cvos_interrupt_0x20();
extern void _cvos_interrupt_0x21();
extern void _cvos_interrupt_0x22();
extern void _cvos_interrupt_0x23();
extern void _cvos_interrupt_0x24();
extern void _cvos_interrupt_0x25();
extern void _cvos_interrupt_0x26();
extern void _cvos_interrupt_0x27();
extern void _cvos_interrupt_0x28();
extern void _cvos_interrupt_0x29();
extern void _cvos_interrupt_0x2a();
extern void _cvos_interrupt_0x2b();
extern void _cvos_interrupt_0x2c();
extern void _cvos_interrupt_0x2d();
extern void _cvos_interrupt_0x2e();
extern void _cvos_interrupt_0x2f();

/* global idtr */
static struct idtr g_idtr;
static struct idt_entry idt_table[IDT_NUM_INTERRUPTS];

void idt_init()
{
    g_idtr.limit = sizeof(idt_table) - 1;
    g_idtr.base = (uint32_t) idt_table;

    idt_table[0].base_l = (uint32_t)_cvos_interrupt_0x00 & 0xFFFF;
    idt_table[0].segment = 0x0008; /* Code segment */
    idt_table[0].zero = 0x00;
    idt_table[0].type_attr = 0x8E;
    idt_table[0].base_h = (uint32_t)_cvos_interrupt_0x00 >> 0x10;

    idt_table[1].base_l = (uint32_t)_cvos_interrupt_0x01 & 0xFFFF;
    idt_table[1].segment = 0x0008; /* Code segment */
    idt_table[1].zero = 0x00;
    idt_table[1].type_attr = 0x8E;
    idt_table[1].base_h = (uint32_t)_cvos_interrupt_0x01 >> 0x10;

    idt_table[2].base_l = (uint32_t)_cvos_interrupt_0x02 & 0xFFFF;
    idt_table[2].segment = 0x0008; /* Code segment */
    idt_table[2].zero = 0x00;
    idt_table[2].type_attr = 0x8E;
    idt_table[2].base_h = (uint32_t)_cvos_interrupt_0x02 >> 0x10;

    idt_table[3].base_l = (uint32_t)_cvos_interrupt_0x03 & 0xFFFF;
    idt_table[3].segment = 0x0008; /* Code segment */
    idt_table[3].zero = 0x00;
    idt_table[3].type_attr = 0x8E;
    idt_table[3].base_h = (uint32_t)_cvos_interrupt_0x03 >> 0x10;

    idt_table[4].base_l = (uint32_t)_cvos_interrupt_0x04 & 0xFFFF;
    idt_table[4].segment = 0x0008; /* Code segment */
    idt_table[4].zero = 0x00;
    idt_table[4].type_attr = 0x8E;
    idt_table[4].base_h = (uint32_t)_cvos_interrupt_0x04 >> 0x10;

    idt_table[5].base_l = (uint32_t)_cvos_interrupt_0x05 & 0xFFFF;
    idt_table[5].segment = 0x0008; /* Code segment */
    idt_table[5].zero = 0x00;
    idt_table[5].type_attr = 0x8E;
    idt_table[5].base_h = (uint32_t)_cvos_interrupt_0x05 >> 0x10;

    idt_table[6].base_l = (uint32_t)_cvos_interrupt_0x06 & 0xFFFF;
    idt_table[6].segment = 0x0008; /* Code segment */
    idt_table[6].zero = 0x00;
    idt_table[6].type_attr = 0x8E;
    idt_table[6].base_h = (uint32_t)_cvos_interrupt_0x06 >> 0x10;

    idt_table[7].base_l = (uint32_t)_cvos_interrupt_0x07 & 0xFFFF;
    idt_table[7].segment = 0x0008; /* Code segment */
    idt_table[7].zero = 0x00;
    idt_table[7].type_attr = 0x8E;
    idt_table[7].base_h = (uint32_t)_cvos_interrupt_0x07 >> 0x10;

    idt_table[8].base_l = (uint32_t)_cvos_interrupt_0x08 & 0xFFFF;
    idt_table[8].segment = 0x0008; /* Code segment */
    idt_table[8].zero = 0x00;
    idt_table[8].type_attr = 0x8E;
    idt_table[8].base_h = (uint32_t)_cvos_interrupt_0x08 >> 0x10;

    idt_table[9].base_l = (uint32_t)_cvos_interrupt_0x09 & 0xFFFF;
    idt_table[9].segment = 0x0008; /* Code segment */
    idt_table[9].zero = 0x00;
    idt_table[9].type_attr = 0x8E;
    idt_table[9].base_h = (uint32_t)_cvos_interrupt_0x09 >> 0x10;

    idt_table[10].base_l = (uint32_t)_cvos_interrupt_0x0a & 0xFFFF;
    idt_table[10].segment = 0x0008; /* Code segment */
    idt_table[10].zero = 0x00;
    idt_table[10].type_attr = 0x8E;
    idt_table[10].base_h = (uint32_t)_cvos_interrupt_0x0a >> 0x10;

    idt_table[11].base_l = (uint32_t)_cvos_interrupt_0x0b & 0xFFFF;
    idt_table[11].segment = 0x0008; /* Code segment */
    idt_table[11].zero = 0x00;
    idt_table[11].type_attr = 0x8E;
    idt_table[11].base_h = (uint32_t)_cvos_interrupt_0x0b >> 0x10;

    idt_table[12].base_l = (uint32_t)_cvos_interrupt_0x0c & 0xFFFF;
    idt_table[12].segment = 0x0008; /* Code segment */
    idt_table[12].zero = 0x00;
    idt_table[12].type_attr = 0x8E;
    idt_table[12].base_h = (uint32_t)_cvos_interrupt_0x0c >> 0x10;

    idt_table[13].base_l = (uint32_t)_cvos_interrupt_0x0d & 0xFFFF;
    idt_table[13].segment = 0x0008; /* Code segment */
    idt_table[13].zero = 0x00;
    idt_table[13].type_attr = 0x8E;
    idt_table[13].base_h = (uint32_t)_cvos_interrupt_0x0d >> 0x10;

    idt_table[14].base_l = (uint32_t)_cvos_interrupt_0x0e & 0xFFFF;
    idt_table[14].segment = 0x0008; /* Code segment */
    idt_table[14].zero = 0x00;
    idt_table[14].type_attr = 0x8E;
    idt_table[14].base_h = (uint32_t)_cvos_interrupt_0x0e >> 0x10;

    idt_table[15].base_l = (uint32_t)_cvos_interrupt_0x0f & 0xFFFF;
    idt_table[15].segment = 0x0008; /* Code segment */
    idt_table[15].zero = 0x00;
    idt_table[15].type_attr = 0x8E;
    idt_table[15].base_h = (uint32_t)_cvos_interrupt_0x0f >> 0x10;

    idt_table[16].base_l = (uint32_t)_cvos_interrupt_0x10 & 0xFFFF;
    idt_table[16].segment = 0x0008; /* Code segment */
    idt_table[16].zero = 0x00;
    idt_table[16].type_attr = 0x8E;
    idt_table[16].base_h = (uint32_t)_cvos_interrupt_0x10 >> 0x10;

    idt_table[17].base_l = (uint32_t)_cvos_interrupt_0x11 & 0xFFFF;
    idt_table[17].segment = 0x0008; /* Code segment */
    idt_table[17].zero = 0x00;
    idt_table[17].type_attr = 0x8E;
    idt_table[17].base_h = (uint32_t)_cvos_interrupt_0x11 >> 0x10;

    idt_table[18].base_l = (uint32_t)_cvos_interrupt_0x12 & 0xFFFF;
    idt_table[18].segment = 0x0008; /* Code segment */
    idt_table[18].zero = 0x00;
    idt_table[18].type_attr = 0x8E;
    idt_table[18].base_h = (uint32_t)_cvos_interrupt_0x12 >> 0x10;

    idt_table[19].base_l = (uint32_t)_cvos_interrupt_0x13 & 0xFFFF;
    idt_table[19].segment = 0x0008; /* Code segment */
    idt_table[19].zero = 0x00;
    idt_table[19].type_attr = 0x8E;
    idt_table[19].base_h = (uint32_t)_cvos_interrupt_0x13 >> 0x10;

    idt_table[20].base_l = (uint32_t)_cvos_interrupt_0x14 & 0xFFFF;
    idt_table[20].segment = 0x0008; /* Code segment */
    idt_table[20].zero = 0x00;
    idt_table[20].type_attr = 0x8E;
    idt_table[20].base_h = (uint32_t)_cvos_interrupt_0x14 >> 0x10;

    idt_table[21].base_l = (uint32_t)_cvos_interrupt_0x15 & 0xFFFF;
    idt_table[21].segment = 0x0008; /* Code segment */
    idt_table[21].zero = 0x00;
    idt_table[21].type_attr = 0x8E;
    idt_table[21].base_h = (uint32_t)_cvos_interrupt_0x15 >> 0x10;

    idt_table[22].base_l = (uint32_t)_cvos_interrupt_0x16 & 0xFFFF;
    idt_table[22].segment = 0x0008; /* Code segment */
    idt_table[22].zero = 0x00;
    idt_table[22].type_attr = 0x8E;
    idt_table[22].base_h = (uint32_t)_cvos_interrupt_0x16 >> 0x10;

    idt_table[23].base_l = (uint32_t)_cvos_interrupt_0x17 & 0xFFFF;
    idt_table[23].segment = 0x0008; /* Code segment */
    idt_table[23].zero = 0x00;
    idt_table[23].type_attr = 0x8E;
    idt_table[23].base_h = (uint32_t)_cvos_interrupt_0x17 >> 0x10;

    idt_table[24].base_l = (uint32_t)_cvos_interrupt_0x18 & 0xFFFF;
    idt_table[24].segment = 0x0008; /* Code segment */
    idt_table[24].zero = 0x00;
    idt_table[24].type_attr = 0x8E;
    idt_table[24].base_h = (uint32_t)_cvos_interrupt_0x18 >> 0x10;

    idt_table[25].base_l = (uint32_t)_cvos_interrupt_0x19 & 0xFFFF;
    idt_table[25].segment = 0x0008; /* Code segment */
    idt_table[25].zero = 0x00;
    idt_table[25].type_attr = 0x8E;
    idt_table[25].base_h = (uint32_t)_cvos_interrupt_0x19 >> 0x10;

    idt_table[26].base_l = (uint32_t)_cvos_interrupt_0x1a & 0xFFFF;
    idt_table[26].segment = 0x0008; /* Code segment */
    idt_table[26].zero = 0x00;
    idt_table[26].type_attr = 0x8E;
    idt_table[26].base_h = (uint32_t)_cvos_interrupt_0x1a >> 0x10;

    idt_table[27].base_l = (uint32_t)_cvos_interrupt_0x1b & 0xFFFF;
    idt_table[27].segment = 0x0008; /* Code segment */
    idt_table[27].zero = 0x00;
    idt_table[27].type_attr = 0x8E;
    idt_table[27].base_h = (uint32_t)_cvos_interrupt_0x1b >> 0x10;

    idt_table[28].base_l = (uint32_t)_cvos_interrupt_0x1c & 0xFFFF;
    idt_table[28].segment = 0x0008; /* Code segment */
    idt_table[28].zero = 0x00;
    idt_table[28].type_attr = 0x8E;
    idt_table[28].base_h = (uint32_t)_cvos_interrupt_0x1c >> 0x10;

    idt_table[29].base_l = (uint32_t)_cvos_interrupt_0x1d & 0xFFFF;
    idt_table[29].segment = 0x0008; /* Code segment */
    idt_table[29].zero = 0x00;
    idt_table[29].type_attr = 0x8E;
    idt_table[29].base_h = (uint32_t)_cvos_interrupt_0x1d >> 0x10;

    idt_table[30].base_l = (uint32_t)_cvos_interrupt_0x1e & 0xFFFF;
    idt_table[30].segment = 0x0008; /* Code segment */
    idt_table[30].zero = 0x00;
    idt_table[30].type_attr = 0x8E;
    idt_table[30].base_h = (uint32_t)_cvos_interrupt_0x1e >> 0x10;

    idt_table[31].base_l = (uint32_t)_cvos_interrupt_0x1f & 0xFFFF;
    idt_table[31].segment = 0x0008; /* Code segment */
    idt_table[31].zero = 0x00;
    idt_table[31].type_attr = 0x8E;
    idt_table[31].base_h = (uint32_t)_cvos_interrupt_0x1f >> 0x10;

    idt_table[32].base_l = (uint32_t)_cvos_interrupt_0x20 & 0xFFFF;
    idt_table[32].segment = 0x0008; /* Code segment */
    idt_table[32].zero = 0x00;
    idt_table[32].type_attr = 0x8E;
    idt_table[32].base_h = (uint32_t)_cvos_interrupt_0x20 >> 0x10;

    idt_table[33].base_l = (uint32_t)_cvos_interrupt_0x21 & 0xFFFF;
    idt_table[33].segment = 0x0008; /* Code segment */
    idt_table[33].zero = 0x00;
    idt_table[33].type_attr = 0x8E;
    idt_table[33].base_h = (uint32_t)_cvos_interrupt_0x21 >> 0x10;

    idt_table[34].base_l = (uint32_t)_cvos_interrupt_0x22 & 0xFFFF;
    idt_table[34].segment = 0x0008; /* Code segment */
    idt_table[34].zero = 0x00;
    idt_table[34].type_attr = 0x8E;
    idt_table[34].base_h = (uint32_t)_cvos_interrupt_0x22 >> 0x10;

    idt_table[35].base_l = (uint32_t)_cvos_interrupt_0x23 & 0xFFFF;
    idt_table[35].segment = 0x0008; /* Code segment */
    idt_table[35].zero = 0x00;
    idt_table[35].type_attr = 0x8E;
    idt_table[35].base_h = (uint32_t)_cvos_interrupt_0x23 >> 0x10;

    idt_table[36].base_l = (uint32_t)_cvos_interrupt_0x24 & 0xFFFF;
    idt_table[36].segment = 0x0008; /* Code segment */
    idt_table[36].zero = 0x00;
    idt_table[36].type_attr = 0x8E;
    idt_table[36].base_h = (uint32_t)_cvos_interrupt_0x24 >> 0x10;

    idt_table[37].base_l = (uint32_t)_cvos_interrupt_0x25 & 0xFFFF;
    idt_table[37].segment = 0x0008; /* Code segment */
    idt_table[37].zero = 0x00;
    idt_table[37].type_attr = 0x8E;
    idt_table[37].base_h = (uint32_t)_cvos_interrupt_0x25 >> 0x10;

    idt_table[38].base_l = (uint32_t)_cvos_interrupt_0x26 & 0xFFFF;
    idt_table[38].segment = 0x0008; /* Code segment */
    idt_table[38].zero = 0x00;
    idt_table[38].type_attr = 0x8E;
    idt_table[38].base_h = (uint32_t)_cvos_interrupt_0x26 >> 0x10;

    idt_table[39].base_l = (uint32_t)_cvos_interrupt_0x27 & 0xFFFF;
    idt_table[39].segment = 0x0008; /* Code segment */
    idt_table[39].zero = 0x00;
    idt_table[39].type_attr = 0x8E;
    idt_table[39].base_h = (uint32_t)_cvos_interrupt_0x27 >> 0x10;

    idt_table[40].base_l = (uint32_t)_cvos_interrupt_0x28 & 0xFFFF;
    idt_table[40].segment = 0x0008; /* Code segment */
    idt_table[40].zero = 0x00;
    idt_table[40].type_attr = 0x8E;
    idt_table[40].base_h = (uint32_t)_cvos_interrupt_0x28 >> 0x10;

    idt_table[41].base_l = (uint32_t)_cvos_interrupt_0x29 & 0xFFFF;
    idt_table[41].segment = 0x0008; /* Code segment */
    idt_table[41].zero = 0x00;
    idt_table[41].type_attr = 0x8E;
    idt_table[41].base_h = (uint32_t)_cvos_interrupt_0x29 >> 0x10;

    idt_table[42].base_l = (uint32_t)_cvos_interrupt_0x2a & 0xFFFF;
    idt_table[42].segment = 0x0008; /* Code segment */
    idt_table[42].zero = 0x00;
    idt_table[42].type_attr = 0x8E;
    idt_table[42].base_h = (uint32_t)_cvos_interrupt_0x2a >> 0x10;

    idt_table[43].base_l = (uint32_t)_cvos_interrupt_0x2b & 0xFFFF;
    idt_table[43].segment = 0x0008; /* Code segment */
    idt_table[43].zero = 0x00;
    idt_table[43].type_attr = 0x8E;
    idt_table[43].base_h = (uint32_t)_cvos_interrupt_0x2b >> 0x10;

    idt_table[44].base_l = (uint32_t)_cvos_interrupt_0x2c & 0xFFFF;
    idt_table[44].segment = 0x0008; /* Code segment */
    idt_table[44].zero = 0x00;
    idt_table[44].type_attr = 0x8E;
    idt_table[44].base_h = (uint32_t)_cvos_interrupt_0x2c >> 0x10;

    idt_table[45].base_l = (uint32_t)_cvos_interrupt_0x2d & 0xFFFF;
    idt_table[45].segment = 0x0008; /* Code segment */
    idt_table[45].zero = 0x00;
    idt_table[45].type_attr = 0x8E;
    idt_table[45].base_h = (uint32_t)_cvos_interrupt_0x2d >> 0x10;

    idt_table[46].base_l = (uint32_t)_cvos_interrupt_0x2e & 0xFFFF;
    idt_table[46].segment = 0x0008; /* Code segment */
    idt_table[46].zero = 0x00;
    idt_table[46].type_attr = 0x8E;
    idt_table[46].base_h = (uint32_t)_cvos_interrupt_0x2e >> 0x10;

    idt_table[47].base_l = (uint32_t)_cvos_interrupt_0x2f & 0xFFFF;
    idt_table[47].segment = 0x0008; /* Code segment */
    idt_table[47].zero = 0x00;
    idt_table[47].type_attr = 0x8E;
    idt_table[47].base_h = (uint32_t)_cvos_interrupt_0x2f >> 0x10;

    asm("lidt %0": : "m"(g_idtr));
}
