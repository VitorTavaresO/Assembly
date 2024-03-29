## EX 04 - Escreva um programa em assembly que some todos os números contidos em um vetor de tamanho n e armazene novamente na memória principal.
.data

    vector: .word 27 58 93 14 76 41 85 3 67 9
    vectorSize: .word 10
    vectorSum: .word 0

.text

    la $t0, vector
    lw $t2, vectorSize
    li $t3, 0
    
main:
    lw      $t1, ($t0)
    bgt		$t2, $t3, sum
    sw      $t4, vectorSum
    j		exit

sum:
    add     $t4, $t1, $t4
    add     $t0, $t0, 4
    add     $t3, $t3, 1
    j       main
   
exit:
    li      $v0, 10
    syscall