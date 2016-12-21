; Multiboot constants
MBALIGN  equ 1 << 0           ; 0'th bit represents "Load modules on page boundaries"
MEMINFO  equ 1 << 1           ; 1'st bit represents "Provide a memory map"
FLAGS    equ MBALIGN | MEMINFO  ; Multiboot flag
MAGIC    equ 0x1BADB002       ; Multiboot magic number
CHECKSUM equ -(MAGIC + FLAGS) ; Multiboot checksum

; Multiboot header
section .multiboot
align 4
    dd MAGIC
    dd FLAGS
    dd CHECKSUM

; boot stack
section .bootstrap_stack, nobits
; Make stack 4k
align 4
stack_bottom:
resb 0x1000
stack_top:

; kernel stack for interrupts
section .ring0_stack, nobits
; Make stack 4k
align 4
ring0_stack_bottom:
resb 0x1000
ring0_stack_top:

section .data
MMU_PRESENT equ 1 << 0
MMU_RW      equ 1 << 1

KERNEL_VIRTUAL_BASE equ 0xc0000000
KERNEL_VIRTUAL_PAGE_NUM equ KERNEL_VIRTUAL_BASE >> 22

; XXX: This assumes that our kernel is < 3M in size
; Also we're using '+' instead of '|' because we can't use
; '|' on non-scalar values. bleh.
align 0x1000
kernel_page_directory:
dd (kernel_page_table - KERNEL_VIRTUAL_BASE) + (MMU_PRESENT | MMU_RW)
times (KERNEL_VIRTUAL_PAGE_NUM - 1) dd 0
dd (kernel_page_table - KERNEL_VIRTUAL_BASE) + (MMU_PRESENT | MMU_RW)
times (0x400 - KERNEL_VIRTUAL_PAGE_NUM - 1) dd 0

align 0x1000
kernel_page_table:
%assign i 0
%rep 0x400
    dd (i << 12) | MMU_PRESENT | MMU_RW
%assign i i+1
%endrep


; Entry code. Gets called by the multiboot bootloader
section .text

; higher-half address
HIGHER_HALF_ADDR equ 0xc0000000

global kernel_entry
kernel_entry equ (_kernel_entry - HIGHER_HALF_ADDR)
_kernel_entry:
    ; Clear interrupts till
    ; we have the IDT set up
    cli

    ; load mmu
    mov ecx, (kernel_page_directory - KERNEL_VIRTUAL_BASE)
    mov cr3, ecx
    mov ecx, cr0
    or ecx, 0x80000000
    mov cr0, ecx

    ; jump to higher half
    lea ecx, [.higher_half]
    jmp ecx

.higher_half:
    ; Load gdt
    lgdt [cvos_gdtr]

    ; Reload our segments
    mov cx, cvos_gdt.data
    mov ds, cx
    mov es, cx
    mov fs, cx
    mov gs, cx
    mov ss, cx

    ; Set up TSS
    ; Doesn't seem to be needed?
    mov cx, cvos_gdt.tss
    ltr cx

    ; Init stack
    mov esp, stack_top

    ; Load CS
    jmp cvos_gdt.code:.call_kernel

.call_kernel:
    ; TODO: remap multiboot structure
    ; Call kernel code
    extern cvos_kernel
    push ebx
    push eax
    call cvos_kernel

    ; HANG
    cli

.hang:
    hlt
    jmp .hang


; GDT STUFF

struc GDTEntry
    .limitl        resw 1
    .basel         resw 1
    .basem         resb 1
    .access        resb 1
    .flags__limith resb 1
    .baseh         resb 1
endstruc

cvos_gdtr:
    dw cvos_gdt.size + 1 ; size
    dd cvos_gdt          ; offset

cvos_gdt:
.null equ $ - cvos_gdt
    dq 0
.code equ $ - cvos_gdt
    istruc GDTEntry
        at GDTEntry.limitl,        dw 0xFFFF
        at GDTEntry.basel,         dw 0x0000
        at GDTEntry.basem,         db 0x00
        at GDTEntry.access,        db 0x9A
        at GDTEntry.flags__limith, db 0xCF
        at GDTEntry.baseh,         db 0x00
    iend
.data equ $ - cvos_gdt
    istruc GDTEntry
        at GDTEntry.limitl,        dw 0xFFFF
        at GDTEntry.basel,         dw 0x0000
        at GDTEntry.basem,         db 0x00
        at GDTEntry.access,        db 0x92
        at GDTEntry.flags__limith, db 0xCF
        at GDTEntry.baseh,         db 0x00
    iend
.tss equ $ - cvos_gdt
    istruc GDTEntry
        at GDTEntry.limitl,        dw (tss.end - tss) & 0xFFFF
        at GDTEntry.basel,         dw (tss-$$+0x7C00) & 0xFFFF
        at GDTEntry.basem,         db ((tss-$$+0x7C00) >> 16) & 0xFF
        at GDTEntry.access,        db 0x89
        at GDTEntry.flags__limith, db ((tss.end - tss) >> 16) & 0xF
        at GDTEntry.baseh,         db ((tss-$$+0x7C00) >> 24) & 0xFF
    iend
.size equ $ - cvos_gdt

; Bluh, TSS stuff.
; Again, from Redox
struc TSS
    .prev_tss resd 1    ;The previous TSS - if we used hardware task switching this would form a linked list.
    .esp0 resd 1        ;The stack pointer to load when we change to kernel mode.
    .ss0 resd 1         ;The stack segment to load when we change to kernel mode.
    .esp1 resd 1        ;everything below here is unused now..
    .ss1 resd 1
    .esp2 resd 1
    .ss2 resd 1
    .cr3 resd 1
    .eip resd 1
    .eflags resd 1
    .eax resd 1
    .ecx resd 1
    .edx resd 1
    .ebx resd 1
    .esp resd 1
    .ebp resd 1
    .esi resd 1
    .edi resd 1
    .es resd 1
    .cs resd 1
    .ss resd 1
    .ds resd 1
    .fs resd 1
    .gs resd 1
    .ldt resd 1
    .trap resw 1
    .iomap_base resw 1
endstruc

tss:
    istruc TSS
        at TSS.esp0, dd ring0_stack_top
        at TSS.ss0, dd cvos_gdt.code
    iend
.end:

%include "int.asm"
