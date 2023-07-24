.data
    vector: .word 0 0 0 0 0 0 0 0 0
    n:  .word 9
    hyphen: .asciiz "-"
    newline: .asciiz "\n"

.text

main:
    li      $t0, 0              ## i = 0 (Contador do laço)
    la      $t1, vector         ## &vector[]
    lw 	    $t2, n              ## vectorSize = n = 9 (Tamanho do vetor)
    li      $t3, 1              ## base = 1 (Valor inicial dos quadrados perfeitos)

loop:
    bge     $t0, $t2, exit      ## Se i >= vectorSize , pula para o exit

    mul     $t4, $t3, $t3       ## result = base * base (Calcula o quadrado perfeito)
    sw      $t4, ($t1)          ## vector[i] = result (Armazena o quadrado perfeito no vetor)
    add     $t1, $t1, 4         ## &vector[i+4] (Avança o ponteiro do vetor)

    li      $v0, 1              ## Imprime valor inteiro
    move    $a0, $t3            ## base (Valor a ser imprimido)
    syscall

    li      $v0, 4              ## Imprime string
    la      $a0, hyphen         ## "-"
    syscall

    li      $v0, 1              ## Imprime valor inteiro
    move    $a0, $t4            ## result (Valor a ser imprimido)
    syscall

    li      $v0, 4              ## Imprime string
    la      $a0, newline        ## newline = "\n" (Pular uma linha)
    syscall

    add     $t0, $t0, 1         ## Incrementa o contador do laço
    add     $t3, $t3, 1         ## Incrementa o valor da
    j       loop                ## Volta para o início do laço

 exit:
    li      $v0, 10             ## Termina o programa
    syscall