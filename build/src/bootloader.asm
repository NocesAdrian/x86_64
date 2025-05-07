[org 0x7C00]

start:
    xor ax, ax
    mov ds, ax
    mov es, ax

    mov si, welcome
    call _print

    mov ah, 0x02
    mov al, 1
    mov ch, 0
    mov cl, 2
    mov dh, 0
    mov dl, 0x00
    mov bx, 0x0500
    mov ax, 0x0000
    mov es, ax
    int 0x13
    jc _error
    jmp 0x0000:0x0500

_error:
    mov si, error
    call _print
    jmp $
    
_print:
.load:
    lodsb
    cmp al, 0
    je .done
    mov ah, 0x0E
    int 0x10
    jmp .load
.done:
    ret

welcome db "welcome", 0
error db 0xA, 0xD, "failed to load", 0

times 510 - ($ - $$) db 0
dw 0xAA55