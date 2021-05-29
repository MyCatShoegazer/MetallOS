#include <stdio.h>
#include <string.h>

#include <kernel/tty.h>
#include <kernel/acpi.h>
#include <stdlib.h>

void __attribute__((noinline)) kernel_main(void)
{
	terminal_initialize();

	char *rsdp_addr = NULL;
	int acpi_ver = load_rsdp(&rsdp_addr);
	//printf(rsdp_ptr);
	if (acpi_ver == 0)
	{
		struct RSDPDescriptor *rsdp_val = (struct RSDPDescriptor *)*rsdp_addr;
		printf(rsdp_val->Signature);
	}

	printf("Kernel loaded...\n");
}
