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

void idt_set_entry(uint32_t idx, uint32_t base, uint16_t segment, uint8_t type_attr)
{
    idt_table[idx].base_l = base & 0xFFFF;
    idt_table[idx].segment = segment;
    idt_table[idx].zero = 0x00;
    idt_table[idx].type_attr = type_attr;
    idt_table[idx].base_h = base >> 0x10;
}

void idt_init()
{
    g_idtr.limit = sizeof(idt_table) - 1;
    g_idtr.base = (uint32_t) idt_table;

    idt_set_entry(0x00, (uint32_t)_cvos_interrupt_0x00, 0x0008, 0x8E);
    idt_set_entry(0x01, (uint32_t)_cvos_interrupt_0x01, 0x0008, 0x8E);
    idt_set_entry(0x02, (uint32_t)_cvos_interrupt_0x02, 0x0008, 0x8E);
    idt_set_entry(0x03, (uint32_t)_cvos_interrupt_0x03, 0x0008, 0x8E);
    idt_set_entry(0x04, (uint32_t)_cvos_interrupt_0x04, 0x0008, 0x8E);
    idt_set_entry(0x05, (uint32_t)_cvos_interrupt_0x05, 0x0008, 0x8E);
    idt_set_entry(0x06, (uint32_t)_cvos_interrupt_0x06, 0x0008, 0x8E);
    idt_set_entry(0x07, (uint32_t)_cvos_interrupt_0x07, 0x0008, 0x8E);
    idt_set_entry(0x08, (uint32_t)_cvos_interrupt_0x08, 0x0008, 0x8E);
    idt_set_entry(0x09, (uint32_t)_cvos_interrupt_0x09, 0x0008, 0x8E);
    idt_set_entry(0x0a, (uint32_t)_cvos_interrupt_0x0a, 0x0008, 0x8E);
    idt_set_entry(0x0b, (uint32_t)_cvos_interrupt_0x0b, 0x0008, 0x8E);
    idt_set_entry(0x0c, (uint32_t)_cvos_interrupt_0x0c, 0x0008, 0x8E);
    idt_set_entry(0x0d, (uint32_t)_cvos_interrupt_0x0d, 0x0008, 0x8E);
    idt_set_entry(0x0e, (uint32_t)_cvos_interrupt_0x0e, 0x0008, 0x8E);
    idt_set_entry(0x0f, (uint32_t)_cvos_interrupt_0x0f, 0x0008, 0x8E);
    idt_set_entry(0x10, (uint32_t)_cvos_interrupt_0x10, 0x0008, 0x8E);
    idt_set_entry(0x11, (uint32_t)_cvos_interrupt_0x11, 0x0008, 0x8E);
    idt_set_entry(0x12, (uint32_t)_cvos_interrupt_0x12, 0x0008, 0x8E);
    idt_set_entry(0x13, (uint32_t)_cvos_interrupt_0x13, 0x0008, 0x8E);
    idt_set_entry(0x14, (uint32_t)_cvos_interrupt_0x14, 0x0008, 0x8E);
    idt_set_entry(0x15, (uint32_t)_cvos_interrupt_0x15, 0x0008, 0x8E);
    idt_set_entry(0x16, (uint32_t)_cvos_interrupt_0x16, 0x0008, 0x8E);
    idt_set_entry(0x17, (uint32_t)_cvos_interrupt_0x17, 0x0008, 0x8E);
    idt_set_entry(0x18, (uint32_t)_cvos_interrupt_0x18, 0x0008, 0x8E);
    idt_set_entry(0x19, (uint32_t)_cvos_interrupt_0x19, 0x0008, 0x8E);
    idt_set_entry(0x1a, (uint32_t)_cvos_interrupt_0x1a, 0x0008, 0x8E);
    idt_set_entry(0x1b, (uint32_t)_cvos_interrupt_0x1b, 0x0008, 0x8E);
    idt_set_entry(0x1c, (uint32_t)_cvos_interrupt_0x1c, 0x0008, 0x8E);
    idt_set_entry(0x1d, (uint32_t)_cvos_interrupt_0x1d, 0x0008, 0x8E);
    idt_set_entry(0x1e, (uint32_t)_cvos_interrupt_0x1e, 0x0008, 0x8E);
    idt_set_entry(0x1f, (uint32_t)_cvos_interrupt_0x1f, 0x0008, 0x8E);
    idt_set_entry(0x20, (uint32_t)_cvos_interrupt_0x20, 0x0008, 0x8E);
    idt_set_entry(0x21, (uint32_t)_cvos_interrupt_0x21, 0x0008, 0x8E);
    idt_set_entry(0x22, (uint32_t)_cvos_interrupt_0x22, 0x0008, 0x8E);
    idt_set_entry(0x23, (uint32_t)_cvos_interrupt_0x23, 0x0008, 0x8E);
    idt_set_entry(0x24, (uint32_t)_cvos_interrupt_0x24, 0x0008, 0x8E);
    idt_set_entry(0x25, (uint32_t)_cvos_interrupt_0x25, 0x0008, 0x8E);
    idt_set_entry(0x26, (uint32_t)_cvos_interrupt_0x26, 0x0008, 0x8E);
    idt_set_entry(0x27, (uint32_t)_cvos_interrupt_0x27, 0x0008, 0x8E);
    idt_set_entry(0x28, (uint32_t)_cvos_interrupt_0x28, 0x0008, 0x8E);
    idt_set_entry(0x29, (uint32_t)_cvos_interrupt_0x29, 0x0008, 0x8E);
    idt_set_entry(0x2a, (uint32_t)_cvos_interrupt_0x2a, 0x0008, 0x8E);
    idt_set_entry(0x2b, (uint32_t)_cvos_interrupt_0x2b, 0x0008, 0x8E);
    idt_set_entry(0x2c, (uint32_t)_cvos_interrupt_0x2c, 0x0008, 0x8E);
    idt_set_entry(0x2d, (uint32_t)_cvos_interrupt_0x2d, 0x0008, 0x8E);
    idt_set_entry(0x2e, (uint32_t)_cvos_interrupt_0x2e, 0x0008, 0x8E);
    idt_set_entry(0x2f, (uint32_t)_cvos_interrupt_0x2f, 0x0008, 0x8E);

    asm("lidt %0": : "m"(g_idtr));
}
