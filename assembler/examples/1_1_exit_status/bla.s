#PURPOSE: Simple program that exits and returns a
# status code back to the Linux kernel

#VARIABLES:
# %rax holds the system call number
# %rdi holds the return status
#
.section .text

.globl _start
_start:

mov  $60,   %rax # syscall EXIT
mov  $123,  %rdi # return STATUS VALUE
syscall

