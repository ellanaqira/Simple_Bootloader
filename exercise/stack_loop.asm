[bits 16]
[org 0x7c00]

mov bx, my_str

store_char:
    mov al, [bx]
    cmp al, 0
    je done

    mov ah, 0
    push ax

    add bx, 1
    jmp store_char

done:
    jmp $

my_str:
    db "Ellan", 0

times 510-($-$$) db 0
dw 0xaa55
