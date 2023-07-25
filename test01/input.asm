.data

.text
    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 5
    syscall
    move $t1, $v0

    add $t2, $t0, $t1

    li $v0, 1
    move $a0, $t2
    syscall
    
