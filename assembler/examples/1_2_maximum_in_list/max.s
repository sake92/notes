#PURPOSE:  Finds the maximum number in a
#          list of data items.
#

#VARIABLES: The registers have the following uses:
#
# $rdi - Holds the index of the data item being examined
# %rbx - Largest data item found
# %rax - Current data item
#
# The following memory locations are used:
#
# data_items - contains the item data.  A 0 is used
#              to terminate the data
#
.section .data
data_items:                       #These are the data items
    .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0
    
.section .text
.globl _start

_start:
    movq $0, %rdi                   # move 0 into the index register
    movl data_items(,%rdi,4), %eax  # load the first byte of data
    movl %eax, %ebx                 # since this is the first item, %rax is
                                    # the biggest
start_loop:                         # start loop
    cmpl $0, %eax             # check to see if we’ve hit the end
    je loop_exit
    incq %rdi                 # load next value
    movl data_items(,%rdi,4), %eax
    cmpl %ebx, %eax           # compare values
    jle start_loop            # jump to loop beginning if the new
                                # one isn’t bigger
    movl %eax, %ebx           # move the value as the largest
    jmp start_loop            # jump to loop beginning
    
loop_exit:
    # %rax is the status code for the exit system call
    # move maximum number to %rdi
    movq $60, %rax             #1 is the exit() syscall
    movl %ebx, %edi            #exit code as first argument
    syscall





