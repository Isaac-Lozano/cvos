TARGET = i686
#TARGET = i686-unknown-linux-gnu

SRC = src
BUILD = bin/$(TARGET)
ISODIR = isodir

COBJECTS = $(addprefix $(SRC)/,kernel.o vga.o pic.o pio.o idt.o pfa.o mmu.o keyboard/keyboard.o structures/queue.o)
ASMOBJECTS = $(addprefix $(SRC)/asm/,entry.o)

GCC = i686-elf-gcc 
AS = nasm

.PHONY: all clean

all: cvos.iso

clean:
	rm -rf $(BUILD)/* cvos.iso $(ISODIR)/boot/cvos.bin $(SRC)/*.o $(SRC)/asm/*.o $(SRC)/keyboard/*.o $(SRC)/structures/*.o

%.o: %.c
	$(GCC) -std=gnu99 -ggdb -ffreestanding -Wall -Wextra -o $@ -c $<

$(ASMOBJECTS): %.o: %.asm
	$(AS) -f elf32 -i $(SRC)/asm/ -o $@ $<

$(BUILD)/cvos.bin:  $(SRC)/kern_link.ld $(COBJECTS) $(ASMOBJECTS)
	$(GCC) -T $(SRC)/kern_link.ld -ffreestanding -O2 -nostdlib -o $@ $(COBJECTS) $(ASMOBJECTS) -lgcc

cvos.iso: $(BUILD)/cvos.bin $(ISODIR)/boot/grub/grub.cfg
	cp $(BUILD)/cvos.bin $(ISODIR)/boot/
	grub-mkrescue -o cvos.iso $(ISODIR)
