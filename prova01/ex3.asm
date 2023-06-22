.data
    vector: .word 7 9 8 5 4 0 6 3 2 1
    n: .word 10
	string_vector: .asciiz "Vetor Original:"
    string_vector2: .asciiz "Vetor Ordenado:"
	comma: .asciiz ","
    newline: .asciiz "\n"

.text
main:
    la $t0, vector
	lw $t1, n
    li $t2, 0
		la $t8, vector

	li      $v0, 4              ## Imprime string
    la      $a0, string_vector        ## $a0 = &comma
    syscall

print_vector:
    bge     $t2, $t1, exit_print_vector ## Se $t5 >= $t3, pula para o loop_vector

    lw      $t5, ($t8) 	        ## $t5 = vetor[$t3]
	
    li      $v0, 1              ## Imprime inteiro
    move    $a0, $t5            ## $a0 = $t2
    syscall

    li      $v0, 4              ## Imprime string
    la      $a0, comma         ## $a0 = &comma
    syscall

    add     $t2, $t2, 1         ## Incrementa o contador do laço
    add     $t8, $t8, 4         ## $t3 = $t3 + 4 (Move para o próximo elemento do vetor)
    j       print_vector       ## Volta para o início do laço

exit_print_vector:
	li      $v0, 4              ## Imprime string
    la      $a0, newline        ## $a0 = &comma
    syscall

	li      $v0, 4              ## Imprime string
    la      $a0, string_vector2        ## $a0 = &comma
    syscall

	sub 	$t2, $t2, $t1

outer_loop:
    bge $t2, $t1, end_outer_loop
    la $t3, ($t0)
    add $t4, $t2, 0
    lw $t5, ($t0)

inner_loop:
    bge $t4, $t1, swap
    lw $t6, ($t3)
    add $t4, $t4, 1
    blt $t6, $t5, smaller

    add $t3, $t3, 4
    j inner_loop 

smaller:
    add $t5, $t6, 0
    la $t7, ($t3)
    add $t3, $t3, 4
    j inner_loop
    
swap:
    la $s0, ($t0)
    lw $s1, ($s0)

    beq $s1, $t5, end_inner_loop

    sw $t5, ($t0)
    sw $s1, ($t7)

end_inner_loop:
    add $t0, $t0, 4
    add $t2, $t2, 1
    j outer_loop
    
end_outer_loop:
    la $s0, vector
    li $t3, 1
    lw $t5, n

	sub 	$t2, $t2, $t1
   
print_ordened_vector:
    bge     $t2, $t1, exit ## Se $t5 >= $t3, pula para o loop_vector

    lw      $t5, ($s0) 	        ## $t5 = vetor[$t3]
	
    li      $v0, 1              ## Imprime inteiro
    move    $a0, $t5            ## $a0 = $t2
    syscall

    li      $v0, 4              ## Imprime string
    la      $a0, comma         ## $a0 = &comma
    syscall

    add     $t2, $t2, 1         ## Incrementa o contador do laço
    add     $s0, $s0, 4         ## $t3 = $t3 + 4 (Move para o próximo elemento do vetor)
    j       print_ordened_vector       ## Volta para o início do laço

   
exit:
    li $v0, 10  # syscall para sair do programa
	syscall