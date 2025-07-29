#include <unistd.h>
#include <sys/syscall.h>
#include <fcntl.h>
#include <stdio.h>

int main() {
    char buffer[100];
    long fd = syscall(SYS_open, "hello_world.txt", O_RDWR);
    long n = syscall(SYS_read, fd, buffer, 100);
    buffer[n] = '\0';
    printf("%s", buffer);
    syscall(SYS_close, fd);
    return 0;
}
