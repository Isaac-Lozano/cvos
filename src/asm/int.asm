extern cvos_interrupt_handler

%macro error_code_int 1
global _cvos_interrupt_%1
_cvos_interrupt_%1:
    pushad
    push ds
    push es
    push fs
    push gs

    push dword %1
    jmp cvos_interrupt_common
%endmacro

%macro no_error_code_int 1
global _cvos_interrupt_%1
_cvos_interrupt_%1:
    pushad
    push ds
    push es
    push fs
    push gs

    push dword 0x00
    push dword %1
    jmp cvos_interrupt_common
%endmacro

cvos_interrupt_common:
   	call dword cvos_interrupt_handler
    add esp, 8

    pop gs
    pop fs
    pop es
    pop ds
    popad

    iret

no_error_code_int 0x00
no_error_code_int 0x01
no_error_code_int 0x02
no_error_code_int 0x03
no_error_code_int 0x04
no_error_code_int 0x05
no_error_code_int 0x06
no_error_code_int 0x07
error_code_int 0x08
no_error_code_int 0x09
error_code_int 0x0a
error_code_int 0x0b
error_code_int 0x0c
error_code_int 0x0d
error_code_int 0x0e
no_error_code_int 0x0f
no_error_code_int 0x10
error_code_int 0x11
no_error_code_int 0x12
no_error_code_int 0x13
no_error_code_int 0x14
no_error_code_int 0x15
no_error_code_int 0x16
no_error_code_int 0x17
no_error_code_int 0x18
no_error_code_int 0x19
no_error_code_int 0x1a
no_error_code_int 0x1b
no_error_code_int 0x1c
no_error_code_int 0x1d
error_code_int 0x1e
no_error_code_int 0x1f
no_error_code_int 0x20
no_error_code_int 0x21
no_error_code_int 0x22
no_error_code_int 0x23
no_error_code_int 0x24
no_error_code_int 0x25
no_error_code_int 0x26
no_error_code_int 0x27
no_error_code_int 0x28
no_error_code_int 0x29
no_error_code_int 0x2a
no_error_code_int 0x2b
no_error_code_int 0x2c
no_error_code_int 0x2d
no_error_code_int 0x2e
no_error_code_int 0x2f
