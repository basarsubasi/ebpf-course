.section .data
    ; Data section (optional for this simple example)

.section .text
.globl _start

_start:
    ; Instruction 1: Move immediate value 10 into RAX
    ; Instruction 2: Add immediate value 5 to RAX
    movq $10, %rax; addq $5, %rax

    ; Instruction 3: Move immediate value 20 into RBX
    ; Instruction 4: Subtract immediate value 3 from RBX
    movq $20, %rbx subq $3, %rbx

    ; Instruction 5: Load effective address (LEA) - a CISC-like instruction for address calculation
    ; This calculates address of [%rax + %rbx*4 + 8] and puts it into RCX
    ; Instruction 6: Move 1 into RDX (often used for syscall number)
    leaq (%rax, %rbx, 4), %rcx movq $1, %rdx

    ; Instruction 7: Move value from RAX into memory location pointed to by RCX
    ; Instruction 8: Increment RCX by 1
    movq %rax, (%rcx) incq %rcx

    ; Instruction 9: Push the value of RBX onto the stack
    ; Instruction 10: Pop the value from the stack into RDI
    pushq %rbx popq %rdi

    ; --- System Call (exit) ---
    ; sys_exit system call number is 60 (for x86_64 Linux)
    ; argument for exit code is in RDI

    movq $60, %rax       ; Set syscall number for exit
    movq $0, %rdi        ; Set exit code to 0 (success)
    syscall              ; Execute syscall