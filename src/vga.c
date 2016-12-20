#include "vga.h"

#include <stdint.h>
#include <stdarg.h>

#define VGA_TEXT_WIDTH 80
#define VGA_TEXT_HEIGHT 25
#define VGA_TEXT_BUFFER ((uint16_t*)0xB8000)

static uint16_t *vga_text_cursor_ptr = (uint16_t*) 0xB8000;

void vga_text_clear()
{
    for(int i = 0; i < VGA_TEXT_WIDTH * VGA_TEXT_HEIGHT; i++)
    {
        VGA_TEXT_BUFFER[i] = 0x0720;
    }
}

void vga_text_set_cursor(int x, int y)
{
    /* TODO: Checks on X and Y */
    vga_text_cursor_ptr = VGA_TEXT_BUFFER + 80 * y + x;
}

void vga_text_print_char(int ch)
{
    /* TODO: Add color stuff */
    if(ch == '\n')
    {
        /* XXX: Ew */
        while((int) vga_text_cursor_ptr % 160 != 64)
        {
            vga_text_cursor_ptr++;
        }
    }
    else
    {
        *vga_text_cursor_ptr = 0x0700 | (uint16_t) ch;
        vga_text_cursor_ptr++;
    }

    /* TODO: Test this */
    if(vga_text_cursor_ptr >= VGA_TEXT_BUFFER + VGA_TEXT_WIDTH * VGA_TEXT_HEIGHT * sizeof(uint16_t))
    {
        vga_text_cursor_ptr = VGA_TEXT_BUFFER;
    }
}

void vga_text_print_decimal(int d)
{
    if(d >= 10)
    {
        vga_text_print_decimal(d / 10);
    }
    vga_text_print_char('0' + (d % 10));
}

void vga_text_print_string(const char *str)
{
    const char *p = str;

    while(*p)
    {
        vga_text_print_char(*p);
        p++;
    }
}

void vga_text_print_hex(int d)
{
    static char hex_table[0x10] = {
        '0', '1', '2', '3', '4', '5', '6', '7',
        '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'
    };
    if(d >= 0x10)
    {
        vga_text_print_hex(d / 0x10);
    }
    vga_text_print_char(hex_table[d % 0x10]);
}

void vga_text_printf(const char* format, ...)
{
    va_list params;
    va_start(params, format);

    while(*format != 0)
    {
        if(*format != '%')
        {
            vga_text_print_char(*format);
            format++;
        }
        else
        {
            format++;
            switch(*format)
            {
                case 'c':
                    vga_text_print_char(va_arg(params, int));
                    break;
                case 'd':
                    vga_text_print_decimal(va_arg(params, int));
                    break;
                case 's':
                    vga_text_print_string(va_arg(params, const char*));
                    break;
                case 'x':
                    vga_text_print_hex(va_arg(params, int));
                    break;
                case '%':
                    vga_text_print_char('%');
                    break;
            }
            format++;
        }
    }
}
