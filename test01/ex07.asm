## EX 07 - Dado um vetor na memória com n elementos, elabore um código assembly que identifique o maior valor do vetor, onde n deverá ser especificado na memória. Imprimir o resultado usando chamadas de sistema.
.data
    vector: .word 19 54 95 96 2 61 70 33 18 52 15 39 62 48 50
    n:  .word 15
    vector_string: .asciiz "Vetor: "
    bigger_number_string: .asciiz "Maior numero: "
    comma: .asciiz ","
    newline: .asciiz "\n"

.text

main:
    la      $t0, vector         ## &vector[]   
    lw 	    $t1, n              ## vectorSize = n = 15 (Tamanho do vetor)
    li      $t2, 0              ## i = 0 (Contador do laço do print)
    li      $t4, 0              ## j = 0 (Contador do laço do loop_vector)
    la      $s0, vector         ## result = &vector[]

    li      $v0, 4              ## Imprime string
    la      $a0, vector_string  ## vector_string = "Vetor: "
    syscall

print_vector:
    bge     $t2, $t1, loop_vector ## Se i >= vectorSize, pula para o loop_vector

    lw      $t3, ($t0)          ## out = vector[i]

    li      $v0, 1              ## Imprime inteiro
    move    $a0, $t3            ## out (Valor a ser imprimido)
    syscall

    li      $v0, 4              ## Imprime string
    la      $a0, comma          ## comma = ","
    syscall

    add     $t2, $t2, 1         ## Incrementa o contador do laço
    add     $t0, $t0, 4         ## &vector[i+4] (Move para o próximo elemento do vetor)
    j       print_vector        ## Volta para o início do laço

loop_vector:
    bge     $t4, $t1, exit      ## Se j >= vectorSize, pula para o exit
    lw      $t3, ($s0)          ## out = vector[i]

    slt     $t6, $t3, $t5       ## test = out < bigger
    beq     $t6, $zero, set_bigger_number ## Se test == 0, pula para o set_bigger_number

    add     $t4, $t4, 1         ## Incrementa o contador do laço
    add     $s0, $s0, 4         ## vector[i+4](Move para o próximo elemento do vetor)
    j       loop_vector         ## Volta para o início do laço


set_bigger_number:
    move    $t5, $t3            ## bigger = out (Maior número)

    add     $t4, $t4, 1         ## Incrementa o contador do laço
    add     $s0, $s0, 4         ## vector[i+4](Move para o próximo elemento do vetor)
    j       loop_vector         ## Volta para o início do laço

 exit:
    li      $v0, 4              ## Imprime string
    la      $a0, newline        ## &newline = "\n" (Pular uma linha)
    syscall

    li      $v0, 4              ## Imprime string
    la      $a0, bigger_number_string  ##  &bigger_number_string = "Maior numero: "
    syscall

    li      $v0, 1              ## Imprime inteiro
    move    $a0, $t5            ## bigger (Valor a ser imprimido)
    syscall

    li      $v0, 10             ## Termina o programa
    syscall