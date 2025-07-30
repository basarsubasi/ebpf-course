.global _start

.text

_start:
    # --- Fork System Call ---
    # sys_fork (x86-64 syscall number 57)
    # int fork(void);
    # Arguments: none
    # Return: PID of child (parent), 0 (child), or -1 (error)

    mov $57, %rax       # Set RAX to the syscall number for fork (57)
    syscall             # Execute the system call

    # --- Check return value of fork ---
    cmp $0, %rax        # Compare RAX with 0 (0 means child process)
    je child_process    # If RAX == 0, jump to child_process
    test %rax, %rax     # Test RAX (if negative, it's an error)
    js fork_error       # If sign flag set (negative), jump to fork_error

    # --- Parent Process Code ---
    # sys_write (x86-64 syscall number 1)
    # ssize_t write(int fd, const void *buf, size_t count);
    # fd (rdi), buf (rsi), count (rdx)
    mov $1, %rax        # Set RAX to the syscall number for write (1)
    mov $1, %rdi        # Set RDI to 1 (stdout file descriptor)
    lea parent_msg(%rip), %rsi # Set RSI to address of parent message
    mov $parent_msg_len, %rdx # Set RDX to length of parent message
    syscall             # Execute the system call

    # sys_exit (x86-64 syscall number 60)
    # void exit(int status);
    # status (rdi)
    mov $60, %rax       # Set RAX to the syscall number for exit (60)
    mov $0, %rdi        # Set RDI to 0 (exit status success)
    syscall             # Execute the system call

fork_error:
    # --- Error Handling (e.g., if fork failed) ---
    # sys_write
    mov $1, %rax        # Set RAX to the syscall number for write (1)
    mov $2, %rdi        # Set RDI to 2 (stderr file descriptor)
    lea error_msg(%rip), %rsi # Set RSI to address of error message
    mov $error_msg_len, %rdx # Set RDX to length of error message
    syscall             # Execute the system call

    # sys_exit
    mov $60, %rax       # Set RAX to the syscall number for exit (60)
    mov $1, %rdi        # Set RDI to 1 (exit status failure)
    syscall             # Execute the system call

child_process:
    # --- Child Process Code ---
    # sys_write
    mov $1, %rax        # Set RAX to the syscall number for write (1)
    mov $1, %rdi        # Set RDI to 1 (stdout file descriptor)
    lea child_msg(%rip), %rsi # Set RSI to address of child message
    mov $child_msg_len, %rdx # Set RDX to length of child message
    syscall             # Execute the system call

    # sys_exit
    mov $60, %rax       # Set RAX to the syscall number for exit (60)
    mov $10, %rdi       # Set RDI to 10 (arbitrary child exit status)
    syscall             # Execute the system call

.data
parent_msg: .asciz "Parent process ran!\n"
.equ parent_msg_len, . - parent_msg

child_msg:  .asciz "Child process ran!\n"
.equ child_msg_len, . - child_msg

error_msg:  .asciz "Fork failed!\n"
.equ error_msg_len, . - error_msg