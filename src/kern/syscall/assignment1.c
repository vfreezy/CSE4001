#include <types.h>
#include <lib.h>
#include <syscall.h>

int sys_hello(void)
{
	return kprintf("Hello World!\n");
}

int sys_printc(const char X)
{
	return kprintf("%c",X);
}
