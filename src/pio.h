#ifndef __PIO_H__
#define __PIO_H__

#include <stdint.h>

void outb(uint16_t port, uint8_t val);
uint8_t inb(uint16_t port);
void io_wait();

#endif /* __PIO_H__ */
