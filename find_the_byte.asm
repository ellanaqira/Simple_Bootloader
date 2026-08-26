;
; A simple boot sector that domenstrates addressing
;


jmp $   ; creates an infinite loop by jumping to the current instruction's
        ; address (the location of the jmp instruction itself)

times 510-($-$$) db 0   ; pad out the 510 bytes with 0
dw 0xaa55               ; add magic number at the last two bytes