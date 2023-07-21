.data  
    number1: .word 1    ## variavel number1 recebe o valor 1
    number2: .word 2    ## variavel number2 recebe o valor 2
    
.text
    lw $t0, number1     ## carrega o valor de number1 em $t0
    lw $t1, number2     ## carrega o valor de number2 em $t1

    add $t2, $t0, $t1   ## soma = number1 + number2

    li $v0, 1           ## valor para a chamada de sistema imprimir inteiro
    move $a0, $t2       ## valor a ser imprimido é movido, ou seja, variavel soma
    syscall             ## execução da chamada de sistema

exit:
    li $v0, 10          ## valor para a chamada de sistema sair
    syscall             ## execução da chamada de sistema
