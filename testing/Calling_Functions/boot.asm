;
; This is a simple boot sector program which loops.
;

; We are defining a Offset i.e, it tells us the start address of the program(boot sector) the bios loads.
[org 0x7c00] ;Comment and uncomment to check the output change and analysis of the output.

; This is what the cpu runs this portion is important and can be edited.

; This program tries to print a secret code which is named the_secret which contains 'X' by using different methods and addresses to verify its location.

mov ah,0x0e ; Teletype mode setting

mov bx,the_secret ; Sending data to the function before calling function using a common register bx.

call my_func ; Calling the function with label which generally send the address of the label.

jmp $ ; after running the OS end within a loop.

my_func: ; The actual function defination using label
pusha
mov al,[bx] ; the data is transferred to function using a common register bx.
int 0x10
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
popa
ret ; Ending the function.

the_secret:
 db "X"

; This portion only Edit the file till the File size is 512 bytes and last 2 bytes being the magic number, i.e aa55
times 510-($-$$) db 0 ; Padding all the extra space with the 0's

dw 0xaa55 ; putting 55aa at last but this works in little endian format so the aa55.
