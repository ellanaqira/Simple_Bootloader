
; I practiced writing a simple boot sector program using assembly x86
; language without searching online or see my books.

[bits 16]
[org 0x7c00]

mov ah, 0x0e

mov al, 'X'
int 0x10

jmp $


times 510-($-$$) db 0
dw 0xaa55
