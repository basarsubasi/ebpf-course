// xdp_drop.c
#include <linux/bpf.h>

#define SEC(NAME) __attribute__((section(NAME), used))

// This XDP program will drop every packet it sees:
SEC("xdp")
int xdp_drop_prog(struct xdp_md *ctx)
{
    return XDP_DROP;
}

// SPDX license tag section; required by the loader:
char _license[] SEC("license") = "GPL";
