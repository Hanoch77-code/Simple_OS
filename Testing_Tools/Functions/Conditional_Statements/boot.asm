;
; This is a simple boot sector program which loops.
;

; We are defining a Offset i.e, it tells us the start address of the program(boot sector) the bios loads.
[org 0x7c00] 
; This is what the cpu runs this portion is important and can be edited.

mov ah,0x0e ; Teletype mode.

mov bx,30   ;Intializing variable value as 30	

cmp bx,4    ; comparing bx with 4
jle less_than_equal_4 ; if less than equal to 4 then goto the label less_than_equal_4 or else continue the flow.
cmp bx,40   ; comparing bx with 40
jl less_than_40 ;if less than 40 then goto the label less_than_40 or else continue the flow.
jmp default_h ; else if all the comparisions fail then goto label default_h (default label is already used in the assembly for something else so _h) 

; Labels
less_than_equal_4:
	mov al,'A'
	jmp end_then
less_than_40:
	mov al,'B'
	jmp end_then
default_h:
	mov al,'C'
	jmp end_then
end_then:
	int 0x10 ; show the output with the interupt.

jmp $

; This portion only Edit the file till the File size is 512 bytes and last 2 bytes being the magic number, i.e aa55
times 510-($-$$) db 0 ; Padding all the extra space with the 0's

dw 0xaa55 ; putting 55aa at last but this works in little endian format so the aa55.
