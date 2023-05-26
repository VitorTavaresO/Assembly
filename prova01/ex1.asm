.data
    vector: .word 0 0 0 0 0 0 0 0 0
    n:  .word 9 
    hyphen: .asciiz "-" 
    newline: .asciiz "\n"

.text

main:
    la      $t1, vector
    lw 	    $t2, n
    li      $t3, 1
loop:
    bge     $t0, $t2, exit

    mul     $t4, $t3, $t3
    sw      $t4, ($t1)
    add     $t1, $t1, 4 

    li      $v0, 1      
    move    $a0, $t3
    syscall

    li      $v0, 4
    la      $a0, hyphen
    syscall

    li      $v0, 1      
    move    $a0, $t4
    syscall

    li      $v0, 4
    la      $a0, newline
    syscall

    add     $t0, $t0, 1
    add     $t3, $t3, 1
    j       loop

 exit:
    li      $v0, 10
    syscall
