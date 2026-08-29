[org 0x7c00]

mov ah, 0x0e

mov bx, str1
mov al, [bx]
int 0x10


jmp $


str1:
    db "Xo"

times 510-($-$$) db 0

dw 0xaa55