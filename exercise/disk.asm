; A simple boot sector program that demonstrate segment offsetting.
; Segment offsetting in a boot sector program means adjusting a memory
; address by combining a segment register and an offset value to point
; to the exact physical memory location you want to use.
; (i.e. 0x7c0 * 16 + offset)
;      \_________/
;           |
;         0x7c00

[bits 16]

mov ah, 0x0e ; scrolling teletype BIOS routine

; ; 1st method
; mov al, [the_secret] 
; int 0x10

; 2nd method
mov bx, 0x7c0
mov ds, bx              ; ds (Data Register), 16-bit register to point to the memory
                        ; area where program data is stored
mov al, [the_secret]
int 0x10

; ; 3rd method
; mov al, [es:the_secret]
; int 0x10

; ; 4th method
; mov bx, 0x7c0
; mov es, bx              ; es (Extra Segment), 16-bit register used to point to an
;                         ; additional chunk of memory for data access
; mov al, [es:the_secret] 
; int 0x10


jmp $

the_secret:
    db "X"


times 510-($-$$) db 0
dw 0xaa55