.data
    temperature: .word 40
    temperature_String: .asciiz "Temperatura: "
    fahrenheit_String: .asciiz "F°"
    celsius_String: .asciiz "C°"
    newline: .asciiz "\n"
.text
    lw $t0, temperature             ## int temperatura = 40

    li $v0, 4                       ## valor para a chamada de sistema imprimir string
    la $a0, temperature_String      ## carrega o endereço da string para imprimir
    syscall                         ## executa a chamada de sistema

    li $v0, 4                       ## valor para a chamada de sistema imprimir string
    la $a0, newline                 ## carrega o endereço da string para imprimir
    syscall                         ## executa a chamada de sistema

    li $v0, 1                       ## valor para a chamada de sistema imprimir inteiro
    move $a0, $t0                   ## carrega o valor da variável para imprimir = temperatura
    syscall                         ## executa a chamada de sistema

    li $v0, 4                       ## valor para a chamada de sistema imprimir string
    la $a0, fahrenheit_String       ## carrega o endereço da string para imprimir
    syscall                         ## executa a chamada de sistema=

    li $v0, 4                       ## valor para a chamada de sistema imprimir string
    la $a0, newline                 ## carrega o endereço da string para imprimir
    syscall                         ## executa a chamada de sistema
    
to_celsius:

    sub $t0, $t0, 32                ## temperatura = temperatura - 32
    mul $t0, $t0, 5                 ## temperatura = temperatura * 5
    div $t0, $t0, 9                 ## temperatura = temperatura / 9

    li $v0, 1                       ## valor para a chamada de sistema imprimir inteiro
    move $a0, $t0                   ## carrega o valor da variável para imprimir = temperatura
    syscall                         ## executa a chamada de sistema

    li $v0, 4                       ## valor para a chamada de sistema imprimir string
    la $a0, celsius_String          ## carrega o endereço da string para imprimir
    syscall                         ## executa a chamada de sistema


exit:

    li $v0, 10                      ## valor para a chamada de sistema sair
    syscall                         ## executa a chamada de sistema
