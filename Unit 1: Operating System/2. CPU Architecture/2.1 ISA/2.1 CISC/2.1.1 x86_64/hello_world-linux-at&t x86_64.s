.section .data
    .LC0:                           ; Label for the string (often .L for local)
        .string "Hello, World!\n"   ; String definition, .string automatically null-terminates and adds newline

.section .text
    .globl _start                   ; Make _start visible to the linker

_start:
    ; syscall for write (sys_write)
    ; rax = 1 (sys_write)
    ; rdi = 1 (stdout)
    ; rsi = address of string
    ; rdx = length of string (calculated at runtime using RIP-relative addressing)

    movq $1, %rax                   ; sys_write syscall number
    movq $1, %rdi                   ; file descriptor (stdout)

    ; Calculate the address of the string using RIP-relative addressing
    ; This is a common way to refer to data in PIC on x86-64 AT&T
    leaq .LC0(%rip), %rsi           ; Load Effective Address of .LC0 relative to RIP into rsi


    movq $14, %rdx                  ; Length of the string (excluding null, as sys_write doesn't write it)
                                    ; If we used .asciz, it would be 14 (13 chars + 1 newline)

    syscall                         ; execute syscall

    ; syscall for exit (sys_exit)
    ; rax = 60 (sys_exit)
    ; rdi = exit code
    movq $60, %rax                  ; sys_exit syscall number
    movq $0, %rdi                   ; exit code 0 (success)
    syscall                         ; execute syscall