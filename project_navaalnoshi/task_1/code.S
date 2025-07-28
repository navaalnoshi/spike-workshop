.section .data
arr: .word 1, 2, 3, 4, 5     # Integer array

.section .text
.globl _start
_start:
    jal x1, main             # Jump to main
    li a7, 93                # Exit syscall
    ecall

.globl sum
sum:
    addi sp, sp, -16         # Stack space
    sw x1, 12(sp)            # Save return address
    sw s3, 8(sp)             # Save s3 (sum)
    sw s4, 4(sp)             # Save s4 (index)
    sw s5, 0(sp)             # Save s5 (base)

    mv s3, zero              # s3 = sum = 0
    mv s4, zero              # s4 = index = 0
    mv s5, a0                # s5 = base address of array

loop_start:
    blt a1, s4, loop_end     # if n <= i, exit

    slli t0, s4, 2           # byte offset = i * 4
    add t1, s5, t0           # address = base + offset
    lw t2, 0(t1)             # t2 = arr[i]
    add s3, s3, t2           # sum += arr[i]
    addi s4, s4, 1           # i++

    j loop_start

loop_end:
    mv a0, s3                # return sum in a0

    # Restore
    lw x1, 12(sp)
    lw s3, 8(sp)
    lw s4, 4(sp)
    lw s5, 0(sp)
    addi sp, sp, 16
    jr x1

.globl main
main:
    addi sp, sp, -8
    sw x1, 4(sp)

    la a0, arr
    li a1, 5
    jal x1, sum

    lw x1, 4(sp)
    addi sp, sp, 8
    jr x1
