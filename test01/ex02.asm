.data
    number: .word 5
    factorial_String: .asciiz "Fatorial de "
    new_line: .asciiz "\n"
    result_String: .asciiz "Resultado: "

.text
    lw $t0, number

    li $v0, 4
    la $a0, factorial_String
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, new_line
    syscall

    li $t1, 1
    li $t2, 2

factorial:
    bge $t0, $t2, loop
    j exit


loop:
    mul $t1, $t2, $t1
    add $t2, $t2, 1
    j factorial

exit:
    li $v0, 4
    la $a0, result_String
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall
    