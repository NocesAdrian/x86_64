section .data
    result db 0,10

section .text
    global _start
_start:

    mov rax, 1
    add rax, 2
    call _printAdd

    mov rax, 60
    xor rdi, rdi
    syscall

_printAdd:
    add rax, 48            ;you want display ascii character number '3' not binary 3, so rax which has 3 then + 48 = 51; 51 is the '3' in ascii
    mov [result], al       ;al which the first 8 bit of rax copied to [result]

    mov rax, 1             ;keep in minds that register dont remember things unless you stored it, so this code here resets overwrite rax
    mov rdi, 1
    mov rsi, result
    mov rdx, 2
    syscall
    ret