; Code Figure 3.6 from "Writing a Simple Operating System From Scratch" by Nick Blundell.
; This code is to manipulate the stack


mov ah, 0x0e            ; BIOS Scorolling teletype routines

mov bp, 0x8000
mov sp, bp

push 'A'
push 'B'
push 'C'

pop bx
mov al, bl
int 0x10

pop bx
mov al, bl
int 0x10

mov al, [0x7ffe]        ; to prove that our stack grows downwards from bp (0x8000), 0x8000 -0x2 = 0x7ffe
                        ; and to prove that pop, popped out the value from the bottom of the stack 
int 0x10

jmp $

times 510-($-$$) db 0
dw 0xaa55