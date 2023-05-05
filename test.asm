section .data
    n dw 10
    sqrts times 10 dw 0

section .text
    global _start

_start:
    mov ax, [n]
    
    mov bx, 1

loop:
    mov cx, bx
    imul cx, bx

    mov word [sqrts + 2*bx - 2], cx

    mov di, bx
    call print_num
    mov dx, msg
    mov ah, 09h
    int 21h

    mov di, cx
    call print_num
    mov dx, msg2
    mov ah, 09h
    int 21h

    inc bx

    cmp bx, ax
    jle loop

    mov eax, 1
    xor ebx, ebx
    int 80h

print_num:
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
