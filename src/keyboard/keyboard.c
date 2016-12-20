#include "keyboard.h"

#include "../structures/queue.h"
#include "../pio.h"
#include "../vga.h"

#define SCANCODE_LEFT_SHIFT 0x2A
#define SCANCODE_RIGHT_SHIFT 0x36

int shift;
int ctrl;
int alt;

struct key
{
    char normal;
    char shift;
};

static struct key keymap[] =
{
#include "keymap.c"
};
#define KEYMAP_SIZE (sizeof(keymap) / sizeof(struct key))

static struct queue kb_q;

int keyboard_get_ch(int *ch)
{
    return dequeue(&kb_q, ch);
}

void keyboard_int()
{
    int ch;

    uint8_t scancode = inb(0x60);
    int pressed = (scancode & 0x80) == 0;
    scancode &= 0x7f;

    if(scancode >= KEYMAP_SIZE)
    {
        return;
    }

    if(scancode == SCANCODE_LEFT_SHIFT || scancode == SCANCODE_RIGHT_SHIFT)
    {
        shift = pressed;
    }

    if(shift)
    {
        ch = keymap[scancode].shift;
    }
    if(!shift)
    {
        ch = keymap[scancode].normal;
    }

    if(ch != 0 && pressed)
    {
        vga_text_print_char(ch);
        enqueue(&kb_q, ch);
    }
}
