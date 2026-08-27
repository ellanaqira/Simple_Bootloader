;
; A simple boot sector program that loops forever.
;
[org 0x7c00]

    mov bx, str1    ; store the adress of str1 into bx
    call print_str  ; call print_str function

jmp $    ; jump to the current memory address (infnite loop)


print_str:
    mov ah, 0x0e    ; scrolling teletype BIOS routine


.next_char:
    mov al, [bx]    ; get the character stored in bx
    cmp al, 0       ; check if it is the zero terminator
    je .done        ; if its zero, end the routine/function

    int 0x10        ; call BIOS video interupt to print char
    add bx, 1       ; move to the next char in memory
    jmp .next_char  ; Repeat the loop


.done:
    ret     ; (return) end the subroutine/function


str1:                   ; holding the string
    db "Nautilus", 0    ; ends with null terminating


times 510-($-$$) db 0   ; When compiled, our program must fit into 512 bytes, with
                        ; the last two bytes being the magic number, so here, tell
                        ; our assembly compiler to pad out our program with enough
                        ; zero bytes (db 0) to bring us to the 510th bytes.

dw 0xaa55               ; Last two bytes (one word) form the magic number,
                        ; so BIOS knows we are a boot sector.