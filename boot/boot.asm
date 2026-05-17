;
; This is a simple boot sector program which loops.
;

; We are defining a Offset i.e, it tells us the start address of the program(boot sector) the bios loads.
[org 0x7c00]

; This is what the cpu runs this portion is important and can be edited.

mov ah,0x0e

mov al,'H'
int 0x10
mov al,'e'
int 0x10
mov al,'l'
int 0x10
mov al,'l'
int 0x10
mov al,'o'
int 0x10

jmp $


; This portion only Edit the file till the File size is 512 bytes and last 2 bytes being the magic number, i.e aa55
times 510-($-$$) db 0 ; Padding all the extra space with the 0's

dw 0xaa55 ; putting 55aa at last but this works in little endian format so the aa55.
