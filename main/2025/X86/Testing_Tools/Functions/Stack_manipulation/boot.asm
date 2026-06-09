;
; This is a simple boot sector program which loops.
;

; We are defining a Offset i.e, it tells us the start address of the program(boot sector) the bios loads.
[org 0x7c00] 
; This is what the cpu runs this portion is important and can be edited.

mov ah,0x0e ; Teletype mode.

mov bp,0x8000
mov sp,bp

push 'A'
push 'B'
push 'C'

; This shows how the address is stored in the Stack, it decreases from the base value of in this case 8000 and decrements.

mov al,[0x7ffe] ; In here it decrements to the address of 0x7ffe, and we can see it stored at first or top it stored A.
int 0x10

mov al,[0x7ffc]  ; In here it decrements to the address of 0x7ffc, and we can see it stored at next below the top address 'B'and note there is 2-byte 
		 ; difference because this is a 16-bit stack pointer.
int 0x10

mov al,[0x7ffa]	 ; In here it decrements to the address of 0x7ffa, and we can see it stored at next below the address 'C'.
int 0x10

pop bx           ; pop actually works in the reverse order and increases the address it points to and we can observe a reverse display of the ABC CBA
mov al,bl	 ; We require lower byte i.e 8 bits from the B register so BL.	
int 0x10

pop bx
mov al,bl
int 0x10

pop bx
mov al,bl
int 0x10

jmp $

; This portion only Edit the file till the File size is 512 bytes and last 2 bytes being the magic number, i.e aa55
times 510-($-$$) db 0 ; Padding all the extra space with the 0's

dw 0xaa55 ; putting 55aa at last but this works in little endian format so the aa55.
