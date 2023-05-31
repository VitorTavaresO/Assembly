.data
    vector: .word 0 0 0 0 0 0 0 0 0
    n:  .word 9
    hyphen: .asciiz "-"
    newline: .asciiz "\n"

.text

main:
    la      $t1, vector ## $t1 = &vector[]
    lw 	    $t2, n     ## $t2 = n = 9
    li      $t3, 1    ## $t3 = 1 (Valor inicial dos quadrados perfeitos)

loop:
    bge     $t0, $t2, exit ## Se $t0 >= $t2, pula para o exit

    mul     $t4, $t3, $t3 ## $t4 = $t3 * $t3
    sw      $t4, ($t1)   ## vector[$t1] = $t4
    add     $t1, $t1, 4 ## $t1 = $t1 + 4 (Move para o próximo elemento do vetor)

    li      $v0, 1      ## Imprime valor inteiro
    move    $a0, $t3    ## $a0 = $t3
    syscall

    li      $v0, 4     ## Imprime string
    la      $a0, hyphen ## $a0 = hyphen = "-"
    syscall

    li      $v0, 1     ## Imprime valor inteiro
    move    $a0, $t4  ## $a0 = $t4
    syscall

    li      $v0, 4   ## Imprime string
    la      $a0, newline ## $a0 = newline = "\n" (Pular uma linha)
    syscall

    add     $t0, $t0, 1 ## Incrementa o contador do laço
    add     $t3, $t3, 1 ## Incrementa o valor do vetor
    j       loop       ## Volta para o início do laço

 exit:
    li      $v0, 10    ## Termina o programa
    syscall
