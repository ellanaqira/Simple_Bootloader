;
; A simple boot sector program that loops forever.
;

[bits 16]
[org 0x7c00]

    call print_newline              ; call print_newline function from print_newline.asm

    mov bx, Nautilus_ascii_art
    call print_str                  ; call print_str function from print_str.asm

jmp $    ; jump to the current memory address (infnite loop)


; import file that contains function
%include "print_str.asm"
%include "print_newline.asm"


; Data
Nautilus_ascii_art:
    db "     ___           ", 0x0d, 0x0a
    db "   /' _ `\         ", 0x0d, 0x0a
    db "  | ,' `, |~-.,    ", 0x0d, 0x0a
    db "  | | `-' |0=-;_-' ", 0x0d, 0x0a
    db "   \ `--'`\<=-_.-. ", 0x0d, 0x0a
    db "    `~---~'`-.-.   ", 0x0d, 0x0a
    db "                   ", 0x0d, 0x0a
    db 0


times 510-($-$$) db 0   ; When compiled, our program must fit into 512 bytes, with
                        ; the last two bytes being the magic number, so here, tell
                        ; our assembly compiler to pad out our program with enough
                        ; zero bytes (db 0) to bring us to the 510th bytes.

dw 0xaa55               ; Last two bytes (one word) form the magic number,
                        ; so BIOS knows we are a boot sector.