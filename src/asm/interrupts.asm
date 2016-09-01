; No idea why this is 0x100010 instead of 0x100000
; Actually, it's very probably because multiboot is
; before .text
%define KERNEL_BASE 0x100010

; IDT STUFF

cvos_interrupt_0:
; Divide by zero
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_1:
; Debug
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 1
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_2:
; NMI
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 2
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_3:
; Breakpoint
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 3
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_4:
; Overflow
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 4
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_5:
; Bound Range Exceeded
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 5
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_6:
; Invalid Opcode
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 6
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_7:
; Device Not Available
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 7
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_8:
; Double Fault
    ; Push registers
    pusha
    ; Push interrupt number
    push dword 8
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_9:
; Coprocessor Segment Overrun
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 9
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_10:
; Invalid TSS
    ; Push registers
    pusha
    ; Push interrupt number
    push dword 0x0A
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_11:
; Segment Not Present
    ; Push registers
    pusha
    ; Push interrupt number
    push dword 0x0B
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_12:
; Stack Segment Fault
    ; Push registers
    pusha
    ; Push interrupt number
    push dword 0x0C
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_13:
; General Protection Fault
    ; Push registers
    pusha
    ; Push interrupt number
    push dword 0x0D
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_14:
; Page Fault
    ; Push registers
    pusha
    ; Push interrupt number
    push dword 0x0E
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_15:
; RESERVED
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x0F
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_16:
; x87 Floating Point Exception
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x10
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_17:
; Alignment Check
    ; Push registers
    pusha
    ; Push interrupt number
    push dword 0x11
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_18:
; Machine Check
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x12
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_19:
; SIMD Floating-Point Exception
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x13
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_20:
; Virtualization Error
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x14
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_21:
; RESERVED
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x15
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_22:
; RESERVED
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x16
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_23:
; RESERVED
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x17
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_24:
; RESERVED
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x18
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_25:
; RESERVED
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x19
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_26:
; RESERVED
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x1A
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_27:
; RESERVED
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x1B
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_28:
; RESERVED
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x1C
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_29:
; RESERVED
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x1D
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_30:
; Security Exception
    ; Push registers
    pusha
    ; Push interrupt number
    push dword 0x1E
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_31:
; RESERVED
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x1F
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_32:
; IRQ0
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x20
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_33:
; IRQ1
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x21
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_34:
; IRQ2
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x22
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_35:
; IRQ3
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x23
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_36:
; IRQ4
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x24
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_37:
; IRQ5
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x25
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_38:
; IRQ6
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x26
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_39:
; IRQ7
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x27
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_40:
; IRQ8
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x28
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_41:
; IRQ9
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x29
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_42:
; IRQ10
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x2A
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_43:
; IRQ11
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x2B
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_44:
; IRQ12
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x2C
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_45:
; IRQ13
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x2D
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_46:
; IRQ14
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x2E
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_47:
; IRQ15
    ; Push registers
    pusha
    ; Push dummy error code
    push dword 0
    ; Push interrupt number
    push dword 0x2F
    ; Jump to common
    jmp cvos_interrupt_common

cvos_interrupt_common:
;.first:
;    mov [.entry], byte 0
;    jmp dword .handle
;.second:
;%assign i 1
;%rep 255
;    mov [.entry], byte i
;    jmp dword .handle
;%assign i i+1
;%endrep
;.handle:
    ; (If there are problems in the future, you might
    ; have to clear DF?)
    ; Call interrupt handler with the entry as an arg
    extern cvos_interrupt_handler
   	call dword cvos_interrupt_handler
    ; Pop registers
    add esp, 8
    ; Clear interrupt in PIC
    ;mov ax, 0x20 ; XXX: Also bad
    ;out 0x20, ax
    ; pop all registers
    popa
    ; return from interrupt
    iretd

.entry: dd 0

struc IDTEntry
    .offsetl  resw 1
    .selector resw 1
    .zero     resb 1
    .type     resb 1
    .offseth  resw 1
endstruc

cvos_idtr:
    dw (cvos_idt.end - cvos_idt) + 1 ; size
    dd cvos_idt          ; offset

cvos_idt:
istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_0 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_0 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_1 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_1 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_2 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_2 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_3 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_3 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_4 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_4 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_5 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_5 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_6 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_6 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_7 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_7 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_8 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_8 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_9 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_9 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_10 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_10 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_11 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_11 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_12 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_12 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_13 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_13 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_14 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_14 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_15 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_15 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_16 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_16 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_17 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_17 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_18 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_18 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_19 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_19 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_20 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_20 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_21 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_21 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_22 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_22 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_23 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_23 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_24 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_24 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_25 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_25 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_26 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_26 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_27 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_27 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_28 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_28 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_29 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_29 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_30 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_30 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_31 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_31 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_32 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_32 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_33 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_33 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_34 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_34 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_35 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_35 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_36 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_36 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_37 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_37 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_38 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_38 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_39 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_39 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_40 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_40 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_41 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_41 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_42 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_42 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_43 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_43 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_44 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_44 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_45 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_45 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_46 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_46 - $$) >> 16
iend

istruc IDTEntry
    at IDTEntry.offsetl,  dw (KERNEL_BASE + cvos_interrupt_47 - $$) & 0xFFFF
    at IDTEntry.selector, dw cvos_gdt.code
    at IDTEntry.zero,     db 0x00
    at IDTEntry.type,     db 0x8E
    at IDTEntry.offseth,  dw (KERNEL_BASE + cvos_interrupt_47 - $$) >> 16
iend
.end:
