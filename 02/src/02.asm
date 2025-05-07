[org 0x0500]

start:
    mov si, loaded
    call _print

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

loaded db 0xA, 0xD,"sector 2 at adress 0x0500 loaded",0