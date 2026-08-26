;
; A simple boot sector that domenstrates addressing
;
mov ah, 0x0e    ; scrolling teletype BIOS routine

; 1st attempt
mov al, message
int 0x10                ; Does this print out the output?

; 2nd attempt
mov al, [message]
int 0x10                ; Does this print out the output?

; 3rd attempt
mov bx, message ; bx = offset of the message (30 bytes/0x1e)
add bx, 0x7c00  ; bx = 0x7c00 + 0x1e = 0x7c1e (Physical address)
mov al, [bx]    ; access the content of bx, [bx] means
                ; store the contents of an address
int 0x10                ; Does this print out the output?

; 4th attempt
mov al, [0x7c1e]
int 0x10                ; Does this print out the output?


jmp $   ; creates an infinite loop by jumping to the current instruction's
        ; address (the location of the jmp instruction itself)

; Data
message: db "X"


times 510-($-$$) db 0   ; pad out the 510 bytes with 0
dw 0xaa55               ; add magic number at the last two bytes