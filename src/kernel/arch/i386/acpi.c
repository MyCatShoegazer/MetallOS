#include <kernel/acpi.h>
#include <kernel/tty.h>
#include <stdio.h>
#include <string.h>

int load_rsdp(unsigned char *rsdp_ptr)
{
    for (int offset = RSDP_BEGIN; offset <= RSDP_END; offset <<= 1)
    {
        if (memcmp((char *)offset, RSDP_SIGNATURE, strlen(RSDP_SIGNATURE)) == 0)
        {
            printf("Found ACPI RSDP...\n");
            int rev = ((unsigned char *)offset)[15];
            switch (rev)
            {
            case 0:
                printf("ACPI revision is 1.0...\n");
                break;
            case 2:
                printf("ACPI revision is 2.0 and above...\n");
                break;
            default:
                printf("Unknown ACPI revision...\n");
                break;
            }

            rsdp_ptr = (unsigned char *)offset;
            return rev;
        }
    }

    return -1;
}