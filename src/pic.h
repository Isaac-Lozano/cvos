#ifndef __PIC_H__
#define __PIC_H__

#include <stdint.h>

void pic_remap(uint8_t master_base, uint8_t slave_base);
void pic_mask_interrupts(uint8_t master_mask, uint8_t slave_mask);
void pic_acknowledge_master_irq();
void pic_acknowledge_slave_irq();

#endif /* __PIC_H__ */
