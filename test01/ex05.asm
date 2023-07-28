## EX 05 - Escreva um programa em assembly que retorne a média de todos os números contidos dentro de um vetor na memória principal de tamanho n.
.data

    vector: .word 27 58 93 14 76 41 85 3 67 9
    vectorSize: .word 10
    vectorAverage: .word 0

.text

    la $t0, vector
    lw $t2, vectorSize
    li $t3, 0
    
main:
    lw      $t1, ($t0)
    bgt		$t2, $t3, sum
    j		average

sum:
    add     $t4, $t1, $t4
    add     $t0, $t0, 4
    add     $t3, $t3, 1
    j       main

average:
    div     $t4, $t4, $t2
    sw      $t4, vectorAverage
   
exit:
    li      $v0, 10
    syscall