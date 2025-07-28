# corrected code
.section .data
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10  # 10 integers

.section .text
.globl _start
_start:
    li   t0, 0            # i = 0
    li   t1, 10           # limit = 10
    li   t3, 0            # sum = 0
    la   t4, array        # t4 = base address of array

loop:
    bge  t0, t1, done     # if i >= 10, break
    slli t5, t0, 2        # offset = i * 4
    add  t6, t4, t5       # address = array + offset
    lw   t2, 0(t6)        # t2 = array[i]
    add  t3, t3, t2       # sum += array[i]
    addi t0, t0, 1        # i++
    j    loop             # jump back to loop

done:
    mv   a0, t3           # return sum in a0
    li   a7, 93           # syscall number for exit
    ecall
