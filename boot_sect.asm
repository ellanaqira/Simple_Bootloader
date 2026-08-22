;
; A simple boot sector program that loops forever.
;
mov ah, 0x0e

mov al, ' '
int 0x10
mov al, '['
int 0x10
mov al, 'N'
int 0x10
mov al, 'a'
int 0x10
mov al, 'u'
int 0x10
mov al, 't'
int 0x10
mov al, 'y'
int 0x10
mov al, 'l'
int 0x10
mov al, 'O'
int 0x10
mov al, 'S'
int 0x10
mov al, ']'
int 0x10

jmp $

times 510-($-$$) db 0   ; When compiled, our program must fit into 512 bytes, with
                        ; the last two bytes being the magic number, so here, tell
                        ; our assembly compiler to pad out our program with enough
                        ; zero bytes (db 0) to bring us to the 510th bytes.

dw 0xaa55               ; Last two bytes (one word) form the magic number,
                        ; so BIOS knows we are a boot sector.