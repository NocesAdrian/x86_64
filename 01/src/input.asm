section .data
    text1 db "what is your name? ", 0x0A
    text2 db "Hello, "

section .bss
   name resb 25

section .text
    global _start
_start:

    call _printText1
    call _getName
    call _printText2
    call _printName

    mov rax, 60
    xor rdi,rdi
    syscall

_printText1:
    mov rax, 1          ; syscall for write
    mov rdi, 1          ; fileDescriptor for standard output
    mov rsi, text1      ; pointer to the text1
    mov rdx, 20         ; text length       ; length of the text is 19      ;19 byte
    syscall             ; make the system call
    ret                 ; return

_printText2:
    mov rax, 1
    mov rdi, 1
    mov rsi, text2
    mov rdx, 7
    syscall
    ret

_getName:
    mov rax, 0          ; syscall for read      ; means the system will read an input from user
    mov rdi, 0          ; fileDescriptor for standard input
    mov rsi, name       ; pointer to Reserved byte name with 20 byte reserved
    mov rdx, 25         ; length of text        ; 1 character = 1 byte      ;"hello" = 5 byte
    syscall             ; make the system call
    ret                 ; return

_printName:
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 25
    syscall
    ret
