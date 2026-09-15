print_str:
    mov ah, 0x0e    ; scrolling teletype BIOS routine


next_char:
    mov al, [bx]    ; get the character stored in bx
    cmp al, 0       ; check if it is the zero terminator
    je done         ; if its zero, end the routine/function

    int 0x10        ; call BIOS video interupt to print char
    add bx, 1       ; move to the next char in memory
    jmp next_char   ; Repeat the loop

done:
    ret             ; (return) end the subroutine/function