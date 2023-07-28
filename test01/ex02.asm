## EX 02 - Escreva um programa em assembly que calcule o fatorial de um número inteiro fornecido na memória principal e exiba o resultado na tela.
.data
    number: .word 5
    factorial_String: .asciiz "Fatorial de "
    new_line: .asciiz "\n"
    result_String: .asciiz "Resultado: "

.text
    lw $t0, number              ## variável number que vai ser fatorada 

    li $v0, 4                   ## valor para a chamada de sistema imprimir string
    la $a0, factorial_String    ## carrega o endereço da string para imprimir
    syscall                     ## executa a chamada de sistema

    li $v0, 1                   ## valor para a chamada de sistema imprimir inteiro
    move $a0, $t0               ## carraga o valor da variável number para imprimir
    syscall                     ## executa a chamada de sistema

    li $v0, 4                   ## valor para a chamada de sistema imprimir string
    la $a0, new_line            ## carrega o endereço da string para imprimir
    syscall                     ## executa a chamada de sistema

    li $t1, 1                   ## int result = 1
    li $t2, 2                   ## int i = 2

factorial:
    bge $t0, $t2, loop          ## if (number >= i) vai para loop
    j exit                      ## else vai para exit


loop:
    mul $t1, $t2, $t1           ## result = i * result
    add $t2, $t2, 1             ## i++
    j factorial                 ## volta para factorial

exit:

    li $v0, 4                   ## valor para a chamada de sistema imprimir string
    la $a0, result_String       ## carrega o endereço da string para imprimir
    syscall                     ## executa a chamada de sistema

    li $v0, 1                   ## valor para a chamada de sistema imprimir inteiro
    move $a0, $t1               ## carraga o valor da variável result para imprimir
    syscall                     ## executa a chamada de sistema

    li $v0, 10                  ## valor para a chamada de sistema sair
    syscall                     ## executa a chamada de sistema
    