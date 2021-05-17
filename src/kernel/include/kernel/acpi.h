#ifndef _KERNEL_ACPI_H
#define _KERNEL_ACPI_H 1

#include <stdlib.h>
#include <stdint.h>

#define RSDP_BEGIN 0x000E0000
#define RSDP_END 0x000FFFFF
#define RSDP_SIGNATURE "RSD PTR "

struct RSDPDescriptor
{
    char Signature[8];
    uint8_t Checksum;
    char OEMID[6];
    uint8_t Revision;
    uint32_t RsdtAddress;
} __attribute__((packed));

struct RSDPDescriptor20
{
    struct RSDPDescriptor firstPart;
    uint32_t Length;
    uint64_t XsdtAddress;
    uint8_t ExtendedChecksum;
    uint8_t reserved[3];
} __attribute__((packed));

__attribute__((noinline)) int load_rsdp(unsigned char *rsdp_ptr);

#endif