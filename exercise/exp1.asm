
; A simple boot sector program demonstrating the modification of
; a character's ASCII value can produce a different character.

[org 0x7c00]
[bits 16]

mov ah, 0x0e

mov al, 'A' + 2
int 0x10

jmp $

times 510-($-$$) db 0
dw 0xaa55