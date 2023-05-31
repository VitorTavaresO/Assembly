.data
    vector: .word 19 54 95 96 2 61 70 33 18 52 15 39 62 48 50
    n:  .word 15
    vector_String: .asciiz "Vetor: "
    bigger_number_String: .asciiz "Maior numero: "
    comma: .asciiz ","
    newline: .asciiz "\n"

.text

main:
    la      $t0, vector          ## $t0 = &vector[]
    lw 	    $t1, n               ## $t2 = n = 15
    li      $t2, 0               ## $t2 = 0

    li      $v0, 4               ## Imprime string
    la      $a0, vector_String   ## $a0 = &vector_String
    syscall

    li      $t4, 0              ## $t4 = 0
    li      $t5, 0              ## $t5 = 0
    la      $t7, vector         ## $t7 = &vector[]

print_vector:
    bge     $t2, $t1, loop_vector ## Se $t2 >= $t1, pula para o loop_vector

    lw      $t3, ($t0)          ## $t3 = vector[$t0]

    li      $v0, 1              ## Imprime inteiro
    move    $a0, $t3            ## $a0 = $t3
    syscall

    li      $v0, 4              ## Imprime string
    la      $a0, comma          ## $a0 = &comma
    syscall

    add     $t2, $t2, 1         ## Incrementa o contador do laço
    add     $t0, $t0, 4         ## $t1 = $t1 + 4 (Move para o próximo elemento do vetor)
    j       print_vector        ## Volta para o início do laço

loop_vector:
    bge     $t4, $t1, exit      ## Se $t4 >= $t1, pula para o exit
    lw      $t3, ($t7)          ## $t3 = vector[$t0]

    slt     $t6, $t3, $t5       ## $t6 = $t3 < $t5
    beq     $t6, $zero, set_bigger_number ## Se $t6 == 0, pula para o set_bigger_number

    add     $t4, $t4, 1         ## Incrementa o contador do laço
    add     $t7, $t7, 4         ## $t1 = $t1 + 4 (Move para o próximo elemento do vetor)
    j       loop_vector         ## Volta para o início do laço


set_bigger_number:
    move    $t5, $t3            ## $t5 = $t3

    add     $t4, $t4, 1         ## Incrementa o contador do laço
    add     $t7, $t7, 4         ## $t1 = $t1 + 4 (Move para o próximo elemento do vetor)
    j       loop_vector         ## Volta para o início do laço

 exit:
    li      $v0, 4              ## Imprime string
    la      $a0, newline        ## $a0 = &newline
    syscall

    li      $v0, 4              ## Imprime string
    la      $a0, bigger_number_String        ## $a0 = &newline
    syscall

    li      $v0, 1              ## Imprime inteiro
    move    $a0, $t5            ## $a0 = $t5
    syscall

    li      $v0, 10             ## Termina o programa
    syscall
