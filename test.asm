section .data
    n dw 10        ; variável n na memória com valor 10
    sqrts times 10 dw 0   ; vetor para armazenar os quadrados perfeitos

section .text
    global _start

_start:
    ; Carrega o valor de n da memória para um registrador
    mov ax, [n]

    ; Inicializa um contador para 1
    mov bx, 1

loop:
    ; Calcula o quadrado do contador
    mov cx, bx
    imul cx, bx

    ; Armazena o quadrado no vetor
    mov word [sqrts + 2*bx - 2], cx

    ; Imprime o resultado no terminal
    mov di, bx
    call print_num
    mov dx, msg
    mov ah, 09h
    int 21h

    ; Imprime o quadrado perfeito no terminal
    mov di, cx
    call print_num
    mov dx, msg2
    mov ah, 09h
    int 21h

    ; Incrementa o contador
    inc bx

    ; Verifica se o contador é menor ou igual a n
    cmp bx, ax
    jle loop

    ; Termina o programa
    mov eax, 1
    xor ebx, ebx
    int 80h

print_num:
    ; Converte um número de 16 bits em uma string e a imprime no terminal
    push ax
    push dx

    xor ax, ax
    mov cx, 10
    div cx
    push ax
    mov ah, 2
    add al, '0'
    int 21h
    pop ax

    mov ax, dx
    mov cx, 10
    div cx
    push ax
    mov ah, 2
    add al, '0'
    int 21h
    pop ax

    mov dx, msg3
    mov ah, 09h
    int 21h

    pop dx
    pop ax
    ret

section .data
    msg db 0ah, 'O quadrado perfeito de ', 0
    msg2 db 0, ' é ', 0ah, 0
    msg3 db 0ah, 0dh, '$'
