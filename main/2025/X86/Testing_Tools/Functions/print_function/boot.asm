;
; This is a simple boot sector program which loops.
;

; We are defining a Offset i.e, it tells us the start address of the program(boot sector) the bios loads.
[org 0x7c00] ;Comment and uncomment to check the output change and analysis of the output.

; This is what the cpu runs this portion is important and can be edited.

; This program tries to print a secret code which is named the_secret which contains 'X' by using different methods and addresses to verify its location.

mov bx,the_secret
call print_string
mov bx,0xFAFA
call print_hex_v3

jmp $

%include "print_fun.asm"

the_secret:
 db "Hello World!",0

hex:
db "0x0000",0

; This portion only Edit the file till the File size is 512 bytes and last 2 bytes being the magic number, i.e aa55
times 510-($-$$) db 0 ; Padding all the extra space with the 0's

dw 0xaa55 ; putting 55aa at last but this works in little endian format so the aa55.
