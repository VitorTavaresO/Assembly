.data
    vector: .word 1 2 3 4 5 
    size: .word 5
.text

    la $t0, vector
    lw $t2, size
    li $t3, 0
    mul $t4, $t2, 4
    sub $t4, $t4, 4
    div $t2, $t2, 2
    add $t5, $t0, 16

main:
    bge $t3, $t2, end
    lw $t1, ($t0)
    lw $t6, ($t5)
    sw $t6, ($t0)
    sw $t1, ($t5)
    add $t3, $t3, 1
    add $t0, $t0, 4
    sub $t5, $t5, 4
    j main

end:
    li $v0, 10
    syscall

