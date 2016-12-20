#include "pfa.h"

#include "vga.h"

#include <stdint.h>

#define PFA_MAXRAM 0x100000000
#define PFA_PAGESIZE 0x1000

#define ADDR_TO_PAGE(x) ((x) & ~0xFFFF)
#define ADDR_TO_NUM(x) ((x) / PFA_PAGESIZE)
#define PAGE_TO_NUM(x) ((x) / PFA_PAGESIZE)
#define NUM_TO_PAGE(x) ((void*)((x) * PFA_PAGESIZE))

extern int kernel_end;

uint8_t page_bitmap[PFA_MAXRAM / PFA_PAGESIZE / 8];

uint32_t pfa_init(multiboot_info_t *multiboot)
{
    uint32_t ramsize=0;
    memory_map_t *mem;

    if(!(multiboot->flags & 0x40))
    {
        return 0;
    }

    for(mem = (memory_map_t*)multiboot->mmap_addr;
        mem < (memory_map_t*)((int)multiboot->mmap_addr + multiboot->mmap_length);
        mem = (memory_map_t*)((int)mem + mem->size + sizeof(mem->size)))
    {
        if(mem->base_addr == 0x100000 && mem->type == 1)
        {
            ramsize = (int)mem->length;
        }
    }

    for(int i = 0; i < (PAGE_TO_NUM((int)&kernel_end) / 8) + 1; i++)
    {
        page_bitmap[i] = 0xFF;
    }

    for(int i = ADDR_TO_NUM(ramsize + 0x100000) / 8; i < ADDR_TO_NUM(PFA_MAXRAM) / 8; i++)
    {
        page_bitmap[i] = 0xFF;
    }

    return ramsize;
}

void *pfa_allocate_page()
{
    for(int i = 0; i < ADDR_TO_NUM(PFA_MAXRAM) / 8; i++)
    {
        if(page_bitmap[i] != 0xFF)
        {
            for(int bit = 0; bit < 8; bit++)
            {
                if(!(page_bitmap[i] & (1 << bit)))
                {
                    page_bitmap[i] |= 1 << bit;
                    return NUM_TO_PAGE(i * 8 + bit);
                }
            }
        }
    }

    return 0;
}

void pfa_free_page(void *addr)
{
    int page_num = ADDR_TO_NUM((int)addr);
    page_bitmap[page_num / 8] &= ~(1 << (page_num % 8));
}
