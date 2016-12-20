#ifndef __PFA_H__
#define __PFA_H__

#include "multiboot.h"

uint32_t pfa_init(multiboot_info_t *multiboot);
void *pfa_allocate_page();
void pfa_free_page(void *addr);

#endif /* __PFA_H__ */
