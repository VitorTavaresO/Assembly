.data
    vector: .word  18 51 61 2 33
    n:  .word 5
    vector_string: .asciiz "Vetor: "
    vector_ordened_String: .asciiz "Vetor ordenado: "
    comma: .asciiz ","
    newline: .asciiz "\n"
.text

main:
    la      $t0, vector         ## $t0 = &vector[]
    lw 	    $t1, n              ## $t2 = n = 5
	add 	$t7, $t1, -1 	  ## $t7 = $t1 - 1 = 4
	li 		$t9, 1

outer_loop:	
	bgt     $t9, $t1, exit      ## Se $t9 >= $t1, pula para o exit
	lw      $t2, ($t0)          ## $t2 = vector[i] - Menor Valor do Vetor
	move 	$t6, $t2
	li 		$t4, 0
	
inner_loop:
	bgt     $t4, $t1, swap    ## Se $t4 > $t7, pula para o swap
	lw      $t3, 4($t0)         ## $t3 = vector[i+1]
	bgt     $t2, $t3, define_index     ## Se $t2 > $t3, pula para o define_index
	add 	$t0, $t0, 4 	  ## $t0 = $t0 + 4
	add 	$t4, $t4, 1 	  ## $t4 = $t4 + 1
	j       inner_loop

define_index:
	move 	$t2, $t3 	  ## $t2 = $t3
	add 	$t0, $t0, 4 	  ## $t0 = $t0 + 4
	add 	$t4, $t4, 1 	  ## $t4 = $t4 + 1
	mul     $t5, $t4, 4         ## $t5 = $t4 * 4
	j 		inner_loop

swap:
	mul 	$t8, $t4, 4 	  ## $t8 = $t1 * 4 = -20
	sub 	$t0, $t0, $t8  	  ## $t0 = $t0 - $t8
	sw      $t2, ($t0)       ## vector[i] = $t2
	add 	$t0, $t0, $t5 	## $t0 = $t0 + $t5
	sw 		$t6, ($t0)        ## vector[i+1] = $t3
	sub 	$t0, $t0, $t5 	## $t0 = $t0 - $t5

end_outer_loop:
	add 	$t0, $t0, 4 	  ## $t0 = $t0 + 4
	add 	$t9, $t9, 1 	  ## $t9 = $t9 + 1

	li 		$v0, 1
	move 	$a0, $t2
	syscall
	j 		outer_loop

exit:

    li      $v0, 10             ## $v0 = 10
    syscall