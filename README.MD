## Structure
```nasm
[STRUCTURE]
section .data,          Data section, variables, strings, constant, int
section .bss,           Uninitializeed Data section, if need space but no value
section .text,          code section, Where the code executes

[EXAMPLE]
section .data
    message db "Hello, World!", 0x0A
    msg_len equ $ - message

section .bss
    counter resd 1         ; Reserve 1 DWORD (4 bytes) for a counter

section .text
    global _start
_start:
    ; Zero out and use the counter (which is in .bss)
    mov eax, [counter]   ; This will be zero (since it's in the bss section)
    inc eax              ; Increase the counter
    mov [counter], eax   ; Store the result back to counter
    
    ; Print the message
    mov rax, 1           ; syscall number for 'write'
    mov rdi, 1           ; file descriptor for stdout
    mov rsi, message     ; pointer to the message
    mov rdx, msg_len     ; length of the message
    syscall              ; make the system call

    ; Exit the program
    mov rax, 60          ; syscall number for 'exit'
    xor rdi, rdi         ; exit code 0
    syscall              ; make the system call
```

## Compile
```bash
// compile to object
nasm -f elf64 hello.asm -o hello.o
// compile object to binaries
ld hello.o -o hello
```

## Run
```bash
./hello
```

## Registers
Registers only store values temporarily, so you might want to save it to memory, registers also get overwrites if it is used again. 
```bash
mov rax, 48			;stores binary 48 temporarily
mov [address], rax		;stores it to a memory address
mov rax, 1			;complete overwrites the register rax
```
