;
; A simple boot sector program that loops forever.
;
[bits 16]
[org 0x7c00]

    call print_newline

    mov bx, Shoebill_ascii
    call print_str

jmp $    ; jump to the current memory address (infnite loop)


print_str:
    mov ah, 0x0e    ; scrolling teletype BIOS routine


next_char:
    mov al, [bx]    ; get the character stored in bx
    cmp al, 0       ; check if it is the zero terminator
    je done         ; if its zero, end the routine/function

    int 0x10        ; call BIOS video interupt to print char
    add bx, 1       ; move to the next char in memory
    jmp next_char   ; Repeat the loop


print_newline:
    mov ah, 0x0e    ; scrolling teletype BIOS routine

    mov al, 0x0d    ; return to the first line - 0x0d = 13 which is Carriage Return (/r) 
    int 0x10        ; call BIOS video interupt to print char

    mov al, 0x0a    ; get the the newline character - 0x0a = 10
    int 0x10        ; call BIOS video interupt to print char
    ret


done:
    ret     ; (return) end the subroutine/function



; Data
Shoebill_ascii:
    db 0xc9, 0xcd, 0xcd, 0xcd, 0xcd, 0xcd, 0xcd, 0xcd, 0xcd, 0xcd, 0xcd, 0xcd, 0xcd, 0xbb, 0x0d, 0x0a
    db 0xba, "      ,_    ", 0xba, 0x0d, 0x0a
    db 0xba, "     (  a\  ", 0xba, 0x0d, 0x0a
    db 0xba, "     _)(-(\ ", 0xba, 0x0d, 0x0a
    db 0xba, "   /` /)) ` ", 0xba, 0x0d, 0x0a
    db 0xba, "  / /' /)   ", 0xba, 0x0d, 0x0a
    db 0xba, " ( //_)/    ", 0xba, 0x0d, 0x0a
    db 0xba, " |/ //      ", 0xba, 0x0d, 0x0a
    db 0xba, " '' ||      ", 0xba, 0x0d, 0x0a
    db 0xba, "    ||      ", 0xba, 0x0d, 0x0a
    db 0xba, "   `^`^     ", 0xba, 0x0d, 0x0a
    db 0xba, "  SHOEBILL  ", 0xba, 0x0d, 0x0a
    db 0xc8, 0xcd, 0xcd, 0xcd, 0xcd, 0xcd, 0xcd, 0xcd, 0xcd, 0xcd, 0xcd, 0xcd, 0xcd, 0xbc, 0x0d, 0x0a, 0
    


times 510-($-$$) db 0   ; When compiled, our program must fit into 512 bytes, with
                        ; the last two bytes being the magic number, so here, tell
                        ; our assembly compiler to pad out our program with enough
                        ; zero bytes (db 0) to bring us to the 510th bytes.

dw 0xaa55               ; Last two bytes (one word) form the magic number,
                        ; so BIOS knows we are a boot sector.