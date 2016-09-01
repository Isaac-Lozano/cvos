TARGET = i686
#TARGET = i686-unknown-linux-gnu

SRC = src
BUILD = bin/$(TARGET)
ISODIR = isodir

COBJECTS = $(addprefix $(SRC)/,kernel.o)
ASMOBJECTS = $(addprefix $(SRC)/asm/,entry.o)

GCC = i686-elf-gcc 
AS = nasm

.PHONY: all clean

all: cvos.iso

clean:
	rm -rf $(BUILD)/* cvos.iso $(ISODIR)/boot/grub/grub.cfg $(SRC)/*.o $(SRC)/asm/*.o

%.o: %.c
	$(GCC) -std=gnu99 -ffreestanding -O2 -Wall -Wextra -o $@ -c $<

$(ASMOBJECTS): %.o: %.asm
	$(AS) -f elf32 -i $(SRC)/asm/ -o $@ $<

$(BUILD)/cvos.bin:  $(SRC)/kern_link.ld $(COBJECTS) $(ASMOBJECTS)
	$(GCC) -T $(SRC)/kern_link.ld -ffreestanding -O2 -nostdlib -o $@ $(COBJECTS) $(ASMOBJECTS) -lgcc

cvos.iso: $(BUILD)/cvos.bin $(ISODIR)/boot/grub/grub.cfg
	cp $(BUILD)/cvos.bin $(ISODIR)/boot/
	grub-mkrescue -o cvos.iso $(ISODIR)
