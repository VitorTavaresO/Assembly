.data
    input_str: .asciiz "Enter a number: "
    input_str2: .asciiz "Enter another number: "
    output_str: .asciiz "The sum is: "

.text
    li $v0, 4
    la $a0, input_str
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $v0, 4
    la $a0, input_str2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    add $t2, $t0, $t1

    li $v0, 4
    la $a0, output_str
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

