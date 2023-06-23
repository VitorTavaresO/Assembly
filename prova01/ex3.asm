.data
    vector: .word 7 9 8 5 4 0 6 3 2 1
    n: .word 10
	string_vector: .asciiz "Vetor Original:"
    string_vector2: .asciiz "Vetor Ordenado:"
	comma: .asciiz ","
    newline: .asciiz "\n"

.text
main:
    la $t0, vector				## $t0 = &vector
	lw $t1, n					## $t1 = n = 10 (Tamanho do vetor)
    li $t2, 0					## $t0 = 0 (Contador de todos os laços)
	la $t8, vector				## $t8 = &vector (Endereço do vetor para o primeiro print)

	li      $v0, 4              ## Imprime string
    la      $a0, string_vector  ## $a0 = &string_vector = "Vetor Original:"
    syscall

print_vector:
    bge     $t2, $t1, exit_print_vector ## Se $t2 >= $t1, pula para o exit_print_vector

    lw      $t5, ($t8) 	        ## $t5 = vetor[$t8]
	
    li      $v0, 1              ## Imprime inteiro
    move    $a0, $t5            ## $a0 = $t5 (Valor a ser imprimido)
    syscall

    li      $v0, 4              ## Imprime string
    la      $a0, comma          ## $a0 = &comma = ","
    syscall

    add     $t2, $t2, 1         ## Incrementa o contador do laço
    add     $t8, $t8, 4         ## $t8 = $t8 + 4 (Move para o próximo elemento do vetor)
    j       print_vector        ## Volta para o início do laço

exit_print_vector:
	li      $v0, 4              ## Imprime string
    la      $a0, newline        ## $a0 = &newline = "\n" (Quebra de linha)
    syscall

	li      $v0, 4              ## Imprime string
    la      $a0, string_vector2 ## $a0 = &comma
    syscall

	sub 	$t2, $t2, $t1       ## $t2 = 0 (Reinicia o contador dos laços)

outer_loop:
    bge $t2, $t1, end_outer_loop ## Se $t2 >= $t1, pula para o end_outer_loop
    la $t3, ($t0)				 ## $t3 = &vector[$t0]
    add $t4, $t2, 0				 ## $t4 = $t2 (Contador do laço)
    lw $t5, ($t0)				 ## $t5 = vetor[$t0]

inner_loop:
    bge $t4, $t1, swap			## Se $t4 >= $t1, pula para o swap
    lw $t6, ($t3)				## $t6 = vetor[$t3]
    add $t4, $t4, 1				## $t4 = $t4 + 1 (Incrementa o contador do laço interno)
    blt $t6, $t5, smaller		## Se $t6 < $t5, pula para o smaller

    add $t3, $t3, 4				## $t3 = $t3 + 4 (Move para o próximo elemento do vetor)
    j inner_loop 				## Volta para o início do laço interno

smaller:
    add $t5, $t6, 0				## $t5 = $t6 (Valor a ser trocado)
    la $t7, ($t3)				## $t7 = &vector[$t3]
    add $t3, $t3, 4				## $t3 = $t3 + 4 (Move para o próximo elemento do vetor)
    j inner_loop				## Volta para o início do laço interno
    
swap:
    la $s0, ($t0)				## $s0 = &vector[$t0]
    lw $s1, ($s0)				## $s1 = vetor[$t0]

    beq $s1, $t5, end_inner_loop	## Se $s1 == $t5, pula para o end_inner_loop

    sw $t5, ($t0)				## vetor[$t0] = $t5
    sw $s1, ($t7)				## vetor[$t7] = $s1

end_inner_loop:
    add $t0, $t0, 4				## $t0 = $t0 + 4 (Move para o próximo elemento do vetor)
    add $t2, $t2, 1				## $t2 = $t2 + 1 (incrementa o contador do laço externo)
    j outer_loop
    
end_outer_loop:
    la $s0, vector				## $s0 = &vector
    li $t3, 1					## $t3 = 1 (Contador do laço)

	sub 	$t2, $t2, $t1
   
print_ordened_vector:
    bge     $t2, $t1, exit ## Se $t2 >= $t1, pula para o exit

    lw      $t5, ($s0) 	        ## $t5 = vetor[$s0]
	
    li      $v0, 1              ## Imprime inteiro
    move    $a0, $t5            ## $a0 = $t5 (Valor a ser imprimido)
    syscall

    li      $v0, 4             ## Imprime string
    la      $a0, comma         ## $a0 = &comma = ","
    syscall

    add     $t2, $t2, 1         ## $t2 = $t2 + 1 (incrementa o contador do laço do print)
    add     $s0, $s0, 4         ## $s0 = $s0 + 4 (Move para o próximo elemento do vetor)
    j       print_ordened_vector       ## Volta para o início do laço do print

   
exit:
    li $v0, 10  # syscall para sair do programa
	syscall
