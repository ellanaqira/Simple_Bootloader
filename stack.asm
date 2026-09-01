; Assembly program to demonstrate stack

[org 0x7c00]

mov ah, 0x0e        ; scrolling teletypr BIOS routine

mov bp, 0x8000      ; set the base of stack little above where BIOS
mov sp, bp          ; loads our boot sector - so it wont overwrite it

push 'A'
push 'B'
push 'C'


mov al, [0x8000]
int 0x10

mov al, [0x7ffe]
int 0x10

mov al, [0x7ffc]
int 0x10

mov al, [0x7ffa]
int 0x10

jmp $

times 510-($-$$) db 0

dw 0xaa55