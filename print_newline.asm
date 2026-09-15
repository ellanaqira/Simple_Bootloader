print_newline:
    mov ah, 0x0e    ; scrolling teletype BIOS routine

    mov al, 0x0d    ; return to the first line - 0x0d = 13 which is Carriage Return (/r) 
    int 0x10        ; call BIOS video interupt to print char

    mov al, 0x0a    ; get the the newline character - 0x0a = 10
    int 0x10        ; call BIOS video interupt to print char
    ret
