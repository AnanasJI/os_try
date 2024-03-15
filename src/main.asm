org 0x7C00
bits 16

start:
    jmp main

;
; Prints a string to screen
; Params:
; - ds/si points to string
;
puts:
    ; save registers we will modify to the stack
    push si
    push ax

.loop:
    lodsb ; loads next character into al
    or al, al ; verify if next character is null

main:

    ; setup data segment
    mov ax, 0 ; can't write to ds/es directly
    mov ds, ax
    mov es, ax

    ; setup stack
    mov ss, ax
    mov sp, 0x7C00 ; stack grows downward from where we are loaded in memory

    hlt

.halt:
    jmp .halt

times 510-($-$$) db 0
dw 0AA55h
