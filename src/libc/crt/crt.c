#include <crt.h>

__attribute__((noreturn))
void __stack_chk_fail(void)
{
	printf("Stack overflow detected!\n");
	abort();
}