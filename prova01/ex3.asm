.data
    vector: .word  18 33 61 52 2
    n:  .word 5
    vector_string: .asciiz "Vetor: "
    vector_ordened_String: .asciiz "Vetor ordenado: "
    comma: .asciiz ","
    newline: .asciiz "\n"
.text

main:
    la      $t0, vector         ## $t0 = &vector[]
    lw 	    $t1, n              ## $t2 = n = 5
    lw      $t2, ($t0)          ## $t2 = vector[i] - Menor Valor do Vetor
    lw      $t3, 4($t0)         ## $t3 = vector[i+1]
    li      $t4, 0              ## $t4 = 1
	move 	$t6, $t2
	li 		$t9, 0

inner_loop:
	bge     $t4, $t1, swap      ## Se $t0 >= $t1, pula para o exit
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
	mul 	$t8, $t1, -4 	  ## $t5 = $t8 * 4
	add 	$t0, $t0, $t8  	  ## $t0 = $t0 - 4
	sw      $t2, ($t0)          ## vector[i] = $t2
	add 	$t0, $t0, $t5 	  ## $t0 = $t0 + 4
	sw 		$t6, ($t0)        ## vector[i+1] = $t3

exit:

    li      $v0, 10             ## $v0 = 10
    syscall
