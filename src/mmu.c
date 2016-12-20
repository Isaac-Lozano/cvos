#include "mmu.h"

#include "pfa.h"

#include <stdint.h>

#define MMU_PD_PRESENT   0x00000001
#define MMU_PD_READWRITE 0x00000002
#define MMU_PD_USER      0x00000004

#define MMU_MAXRAM 0x100000000
#define MMU_PAGESIZE 0x1000
#define MMU_PAGES (MMU_MAXRAM / MMU_PAGESIZE)

typedef uint32_t mmu_pd_entry;
typedef uint32_t mmu_pt_entry;

static mmu_pd_entry *pd_table;

void mmu_init()
{
    mmu_pt_entry *pt;
    pd_table = pfa_allocate_page();

    for(int i = 0; i < MMU_PAGES; i++)
    {
        pd_table[i] = MMU_PD_READWRITE;
    }

    pt = pfa_allocate_page();
    for(int i = 0; i < MMU_PAGES; i++)
    {
        pt[i] = (i * MMU_PAGESIZE) | 3;
    }

    pd_table[0] = (uint32_t)pt | 3;

    asm("mov %0, %%cr3\n\
         mov %%cr0, %%eax\n\
         or $0x80000000, %%eax\n\
         mov %%eax, %%cr0"
         :: "r"(pd_table)
         : "eax");
}
