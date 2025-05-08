[org 0x0500]
[bits 16]

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

loaded: db 0xD, 0xA,"sector 2 at adress 0x0600 loaded",0


times 512 - ($ - $$) db 0  ; Fill remaining space to 510 bytes