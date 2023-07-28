.data
    vector: .word 32 48 25 94 35 
    size: .word 5
    vectorCelsius: .word 0 0 0 0 0
.text

    la $t0, vector
    la $s0, vectorCelsius
    lw $t2, size
    li $t3, 0

main:
    bge $t3, $t2, end

    lw $t1, ($t0)

    sub $t1, $t1, 32
    mul $t1, $t1, 5
    div $t1, $t1, 9

    sw $t1, ($s0)

    add $t0, $t0, 4
    add $s0, $s0, 4
    add $t3, $t3, 1
    j main

end:
    li $v0, 10
    syscall

