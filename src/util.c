#include "util.h"

size_t rvos_strlen(char *p)
{
    size_t len = 0;
    while(*p != '\0')
    {
        len++;
        p++;
    }
    return len;
}

void rvos_memset(void *dst, char val, size_t size)
{
    char *chdst = (char *)dst;
    while(size)
    {
        *chdst++ = val;
        size--;
    }
}
