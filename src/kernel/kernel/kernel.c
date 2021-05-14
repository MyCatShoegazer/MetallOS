#include <stdio.h>
#include <string.h>

#include <kernel/tty.h>

void __attribute__ ((noinline)) smash(const char* str) {
	char buffer[16];
	memcpy(buffer, str, strlen(str));
}

void __attribute__ ((noinline)) kernel_main(void) {
	terminal_initialize();
	printf("Kernel loaded...\n");
}
