.data
    vector: .word 7 9 8 5 4 0 6 3 2 1
    n: .word 10
	string_vector: .asciiz "Vetor Original:"
    string_vector2: .asciiz "Vetor Ordenado:"
	comma: .asciiz ","
    newline: .asciiz "\n"

.text
main:
    la $t0, vector				## &vector[] 
	lw $t1, n					## vectorSize = n = 15 (Tamanho do vetor)
    li $t2, 0					## i = 0 (Contador do laço externo)
    li $t4, 0					## j = 0 (Contador do laço interno)

	li      $v0, 4              ## Imprime string
    la      $a0, string_vector  ## $a0 = &string_vector = "Vetor Original:"
    syscall

print_vector:
    bge     $t2, $t1, exit_print_vector ## Se i >= vectorSize, pula para o exit_print_vector

    lw      $t5, ($t0) 	        ## out = vetor[i]
	
    li      $v0, 1              ## Imprime inteiro
    move    $a0, $t5            ## out (Valor a ser imprimido)
    syscall

    li      $v0, 4              ## Imprime string
    la      $a0, comma          ## &comma = ","
    syscall

    add     $t2, $t2, 1         ## Incrementa o contador do laço
    add     $t0, $t0, 4         ## vector[i+4] (Move para o próximo elemento do vetor)
    j       print_vector        ## Volta para o início do laço

exit_print_vector:
	li      $v0, 4              ## Imprime string
    la      $a0, newline        ## &newline = "\n" (Quebra de linha)
    syscall

	li      $v0, 4              ## Imprime string
    la      $a0, string_vector2 ## &string_vector2 = "Vetor Ordenado:"
    syscall

	sub 	$t2, $t2, $t1       ## i = i - vectorSize (Zera o contador do laço externo)
    la $t0, vector				## &vector[]

outer_loop:
    bge $t2, $t1, end_outer_loop ## Se i >= vectorSize, pula para o end_outer_loop
    la $t3, ($t0)				 ## smallerAdress = &vector[i]
    add $t4, $t2, 0				 ## j = i (Contador do laço interno)
    lw $t5, ($t0)				 ## smaller = vector[i]

inner_loop:
    bge $t4, $t1, swap			## Se j >= vectorSize, pula para o swap
    lw $t6, ($t3)				## outValue = vetor[j]
    add $t4, $t4, 1				## j++ (Incrementa o contador do laço interno)
    blt $t6, $t5, smaller		## Se outValue < smaller, pula para o smaller

    add $t3, $t3, 4				## vector[i+4] (Move para o próximo elemento do vetor)
    j inner_loop 				## Volta para o início do laço interno

smaller:
    move $t5, $t6				## smaller = outValue (Valor a ser trocado)
    la $t7, ($t3)				## aux = smallerAdress
    add $t3, $t3, 4				## (Move para o próximo elemento do vetor)
    j inner_loop				## Volta para o início do laço interno
    
swap:
    la $s0, ($t0)				## resultAdress = &vector[j]
    lw $s1, ($t0)				## resultValue = vetor[j]

    beq $s1, $t5, end_inner_loop	## Se resultValue == smaller, pula para o end_inner_loop

    sw $t5, ($t0)				## vetor[i] = smaller
    sw $s1, ($t7)				## vetor[aux] = resultValue

end_inner_loop:
    add $t0, $t0, 4				## (Move para o próximo elemento do vetor)
    add $t2, $t2, 1				## (incrementa o contador do laço externo)
    j outer_loop
    
end_outer_loop:
    la $s0, vector				## &vector[i]

	sub 	$t2, $t2, $t1       ## i = i - vectorSize (Zera o contador do laço externo)
   
print_ordened_vector:
    bge     $t2, $t1, exit      ## Se i >= vectorSize, pula para o exit

    lw      $t5, ($s0) 	        ## out = vetor[i]
	
    li      $v0, 1              ## Imprime inteiro
    move    $a0, $t5            ## out (Valor a ser imprimido)
    syscall

    li      $v0, 4              ## Imprime string
    la      $a0, comma          ## &comma = ","
    syscall

    add     $t2, $t2, 1         ## (Incrementa o contador do laço do print)
    add     $s0, $s0, 4         ## (Move para o próximo elemento do vetor)
    j       print_ordened_vector       ## Volta para o início do laço do print

   
exit:
    li $v0, 10  # syscall para sair do programa
	syscall
