[ORG 0x8000]

start:
    mov si, load
    call _print
    jmp $

_print:
    lodsb
    cmp al, 0
    je .done
    mov ah, 0x0E
    int 0x10
    jmp _print
.done:
    ret

load: db 0xD, 0xA, "Loaded",0