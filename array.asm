.data 

    array: .word 0 0 0 0 0

.text

    la $t1, array
    li $t2, 1
    mul $t2, $t2, $t2
    sw $t2, ($t1)

    li $v0, 4
    la $a0, array
    syscall