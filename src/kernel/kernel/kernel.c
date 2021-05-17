#include <stdio.h>
#include <string.h>

#include <kernel/tty.h>
#include <kernel/acpi.h>
#include <stdlib.h>

void __attribute__((noinline)) kernel_main(void)
{
	terminal_initialize();
	unsigned char *rsdp_ptr;
	load_rsdp(rsdp_ptr);
	printf("Kernel loaded...\n");
}
