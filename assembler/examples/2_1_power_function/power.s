
# calculates 2^3 + 5^2 == 8+25 == 33
.section .data

.section .text
.globl _start

_start:
    pushq $3                  # push second argument
    pushq $2                  # push first argument
    call  power               # call the function
    addq  $16, %rsp           # restore stack pointer back

    pushq %rax                # save the first answer on stack
    
    # second call ... same stuff
    pushq $2
    pushq $5
    call  power
    addq  $16, %rsp
    
    popq  %rdi                # pop first result to %rdi
    
    addq  %rax, %rdi          # add them to %rdi
    movq  $60, %rax           # exit (%rdi is returned)
    syscall


#PURPOSE:  This function is used to compute
#          the value of a number raised to
#          a power.
#
#INPUT:    First argument - the base number
#          Second argument - the power to
#                            raise it to
#
#OUTPUT:   Will give the result as a return value
#
#NOTES:    The power must be 1 or greater
#
#VARIABLES:
#          %rbx - holds the base number
#          %rcx - holds the power
#
#          -8(%rbp) - holds the current result
#
#          %rax is used for temporary storage
#
.type power, @function
power:
    pushq %rbp           #save old base pointer
    movq  %rsp, %rbp     #make stack pointer the base pointer
    subq  $8, %rsp       #get room for our local storage
    movq  16(%rbp), %rbx #put first argument in %rbx
    movq  24(%rbp), %rcx #put second argument in %rcx
    movq  %rbx, -8(%rbp) #store current result
    
power_loop_start:
    cmpq  $1, %rcx       #if the power is 1, we are done
    je    end_power
    movq  -8(%rbp), %rax #move the current result into %rax
    imulq %rbx, %rax     #multiply the current result by
                         #the base number
    movq  %rax, -8(%rbp) #store the current result
    decq  %rcx           #decrease the power
    jmp   power_loop_start #run for the next power

end_power:
    movq -8(%rbp), %rax  #return value goes in %rax
    movq %rbp, %rsp      #restore the stack pointer
    popq %rbp            #restore the base pointer
    ret
