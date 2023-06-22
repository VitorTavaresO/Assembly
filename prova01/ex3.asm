.data
    vector: .word 7 6 3 2 1 9 8 5 4 0
    n: .word 10
    newline: .asciiz "\n"
	string_vector: .asciiz "Vetor Original:\n"
    string_vector2: .asciiz "Vetor Ordenado:\n"

.text
main:
    la $t0, vector
    lw $t2, ($t0)
    li $t3, 0
    lw $t5, n
	li $t8, 0
	la $s0, vector

outer_loop:
    bge $t3, $t5, end_outer_loop
    la $t1, ($t0)
    add $t4, $t3, $zero
    lw $t2, ($t0)

inner_loop:
    bge $t4, $t5, swap
    lw $t6, ($t1)
    add $t4, $t4, 1
    blt $t6, $t2, smaller

    add $t1, $t1, 4
    j inner_loop 

smaller:
    add $t2, $t6, $zero
    la $t7, ($t1)
    add $t1, $t1, 4
    j inner_loop
    
swap:
    la $s0, ($t0)
    lw $s1, ($s0)

    beq $s1, $t2, equal

    sw $t2, ($t0)
    sw $s1, ($t7)

equal:
    add $t0, $t0, 4
    add $t3, $t3, 1
    j outer_loop
    
end_outer_loop:
    la $s0, vector
    li $t1, 1
    lw $t2, n
   
print:
    bge     $t8, $t5, exit ## Se $t2 >= $t1, pula para o loop_vector

    lw      $t2, ($s0) 	        ## $t2 = vetor[$t1]
	
    li      $v0, 1              ## Imprime inteiro
    move    $a0, $t2            ## $a0 = $t3
    syscall

    li      $v0, 4              ## Imprime string
    la      $a0, newline          ## $a0 = &comma
    syscall

    add     $t8, $t8, 1         ## Incrementa o contador do laço
    add     $s0, $s0, 4         ## $t1 = $t1 + 4 (Move para o próximo elemento do vetor)
    j       print       ## Volta para o início do laço

   
exit:
    li $v0, 10  # syscall para sair do programa
	syscall