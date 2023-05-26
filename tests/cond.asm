.data

    idade: .word 17
    msg_maior: .asciiz "Maior de idade"
    msg_menor: .asciiz "Menor de idade"


.text

    lw $a0, idade
    blt $a0, 18, menor

maior:

    li $v0, 4
    la $a0, msg_maior
    syscall

    b fim

menor:

    li $v0, 4
    la $a0, msg_menor
    syscall

fim:
