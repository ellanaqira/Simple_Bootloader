
;                 Answer of Question 3 from book
; "Writing a Simple Operating System From Scratch" by Nick Blundell


; Question 3

; It’s always useful to plan your conditional code in terms of a higher level language, then
; replace it with the assembly instructions. Have a go at converting this pseudo assembly
; code into full assembly code, using cmp and appropriate jump instructions. Test it with
; different values of bx. Fully comment your code, in your own words.


; Pseudo Assembly Code :


; mov bx , 30

; if ( bx <= 4) {
;     mov al , ’A’
; } else if ( bx < 40) {
;     mov al , ’B’
; } else {
;     mov al , ’C’
; }

; mov ah , 0x0e      ; int =10/ ah =0 x0e -> BIOS tele - type output
; int 0x10           ; print the character in al

; jmp $

; ; Padding and magic number.
; times 510 -( $ - $$ ) db 0
; dw 0 xaa55

; ============================================================================================


; Answer


[org 0x7c00]
[bits 16]

mov ah, 0x0e        ; scrolling teletype BIOS


mov bx, 30          ; Store the value into bx

cmp bx, 4           ; compare the value stored inside of bx with 4
jle print_a         ; jump to print_a function if less or equal to 4

cmp bx, 40          ; compare the value stored inside of bx with 40
jl print_b          ; jump to print_b function if less than 40

mov al, 'C'         ; if the two previous conditions are not met, print "C"
int 0x10            ; video interupt to print character
jmp done            ; jump to done


; function to print "A"
print_a:
    mov al, 'A'
    int 0x10
    jmp done

; function to print "B"
print_b:
    mov al, 'B'
    int 0x10
    jmp done

; function to end and back to main routine
done:
    ret


jmp $   ; jump forever

; padding and magic BIOS number
times 510-($-$$) db 0
dw 0xaa55
