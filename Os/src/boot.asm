[ORG 0x7C00]
BITS 16

start: 
    mov si, welcome
    call _print

    jmp main

main:
    mov ah, 0x02
    mov al, 1
    mov ch, 0
    mov cl, 2
    mov dh, 0
    mov dl, 0x80
    mov bx, 0x8000
    mov es, bx
    xor bx, bx

    int 0x13
    jc _error

    jmp 0x8000:0000

_error:
    mov si, error
    call _print

_print:
    lodsb
    cmp al, 0
    je .done
    mov ah, 0x0E
    int 0x10
    jmp _print
.done:
    ret

welcome: db "Welcome", 0
error: db 0xD, 0xA, "error", 0

TIMES 510 - ($ - $$) db 0
dw 0xAA55