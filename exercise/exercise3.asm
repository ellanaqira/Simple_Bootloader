; Write a simple Bootsector code that prints a 'Hello World!'' message

[bits 16]
[org 0x7c00]

    mov bx, message
    call print_str

jmp $

print_str:
    mov ah, 0x0e        ; Scrolling Teletype BIOS Routines

next_char:
    mov al, [bx]
    cmp al, 0           ; check if the last caracter is Null terminator
    je done             ; je (Jump if Equals), jump to done if the character is Null terminator

    ; if character not equals to Null Terminator
    int 0x10            ; print interupt
    add bx, 1           ; add 1 to bx so it can move to the next character
    jmp next_char

done:
    ret                 ; End the routines

; Data
message:
    db "Hello World!", 0

times 510-($-$$) db 0
dw 0xaa55