[org 0x7c00]

mov ah, 0x0e

mov bx, str1 + 2
mov al, [bx]
int 0x10

mov bx, str1 + 1
mov al, [bx]
int 0x10

mov bx, str1
mov al, [bx]
int 0x10

mov bx, str1 + 4
mov al, [bx]
int 0x10

mov bx, str1 + 5
mov al, [bx]
int 0x10

mov bx, str1 + 3
mov al, [bx]
int 0x10

jmp $


str1:
    db "listen"

times 510-($-$$) db 0

dw 0xaa55