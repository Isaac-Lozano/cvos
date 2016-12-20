#ifndef __VGA_H__
#define __VGA_H__

void vga_text_clear();
void vga_text_set_cursor(int x, int y);
void vga_text_print_char(int ch);
void vga_text_print_decimal(int d);
void vga_text_print_string(const char *str);
void vga_text_print_hex(int d);
void vga_text_printf(const char* format, ...);

#endif /* __VGA_H__ */
