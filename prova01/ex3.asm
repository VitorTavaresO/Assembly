.data
    vector: .word 61 33 18 2 52
    n:  .word 5
    vector_string: .asciiz "Vetor: "
    vector_ordened_String: .asciiz "Vetor ordenado: "
    comma: .asciiz ","
    newline: .asciiz "\n"
.text

main:
    la      $t0, vector         ## $t0 = &vector[]
    lw 	    $t1, n              ## $t2 = n = 15
    lw      $t2, ($t0)          ## $t2 = vector[i]
    lw      $t3, 4($t0)         ## $t3 = vector[i+1]
    li      $t4, 0              ## $t4 = 1

swap:
    sw      $t3, ($t0)          ## vector[i] = vector[i+1]
    sw      $t2, 4($t0)         ## vector[i+1] = vector[i]
    lw 	    $t2, ($t0)          ## $t2 = vector[i]
    lw      $t3, 4($t0)         ## $t3 = vector[i+1]
    add     $t0, $t0, 4         ## $t0 = $t0 + 4
    add     $t4, $t4, 1         ## $t4 = $t4 + 1
    j       loop
    
loop:
    bge     $t4, $t1, exit      ## Se $t0 >= $t2, pula para o exit
    bgt     $t2, $t3, swap      ## if (vector[i] > vector[i+1])
    add     $t0, $t0, 4         ## $t0 = $t0 + 4
    add     $t4, $t4, 1         ## $t4 = $t4 + 1
    j       loop

exit:

    li      $v0, 1              ## Imprime inteiro
    move    $a0, $t2            ## $a0 = $t2
    syscall

    li      $v0, 1              ## Imprime inteiro
    move    $a0, $t3            ## $a0 = $t5
    syscall

    li      $v0, 10             ## $v0 = 10
    syscall


