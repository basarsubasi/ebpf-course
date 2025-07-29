section .data
    hello_msg db "Hello, World!", 0xA  ; String and a newline character
    msg_len equ $ - hello_msg          ; Length of the string

section .text
    global _start                      ; Entry point for the linker

_start:
    ; syscall for write (sys_write)
    ; rax = 1 (sys_write)
    ; rdi = 1 (stdout)
    ; rsi = address of string
    ; rdx = length of string
    mov rax, 1                         ; syscall number for sys_write
    mov rdi, 1                         ; file descriptor (stdout)
    mov rsi, hello_msg                 ; address of the string
    mov rdx, msg_len                   ; length of the string
    syscall                            ; execute syscall

    ; syscall for exit (sys_exit)
    ; rax = 60 (sys_exit)
    ; rdi = exit code
    mov rax, 60                        ; syscall number for sys_exit
    mov rdi, 0                         ; exit code 0 (success)
    syscall                            ; execute syscall