;
; This is a simple boot sector program which loops.
;

; We are defining a Offset i.e, it tells us the start address of the program(boot sector) the bios loads.
[org 0x7c00] ;Comment and uncomment to check the output change and analysis of the output.

; This is what the cpu runs this portion is important and can be edited.

; This program tries to print a secret code which is named the_secret which contains 'X' by using different methods and addresses to verify its location.

mov ah,0x0e

;; First Attempt
mov al,the_secret ; This prints the Address of the Secret in the program not in the memory loaded into the RAM.
int 0x10 	  ; Even when the org is declared it doesn't work because al store address not the data in the address (no brackets).
;; Second Attempt
mov al,[the_secret] ; This prints the data in the address but the address in the program is not same which is loaded there is changes in the offset.
int 0x10	    ; So we print something in the Interrupt Vector table.Image showcasing the Memory Allocation is provided in this program folder.
		    ; This work when the org is declared because it automatically add the org address before hand.		
;; Third Attempt
mov bx,the_secret
add bx,0x7c00    ; This adds the offset of the starting of the memory in the actual loading of the program into the memory.
mov al,[bx]	 ; Bracket is used to display the data in the program memory of the.
int 0x10	 ; This doesn't work when we declare the org because it would add 0x7c00 which will out of the memory of the boot sector.(U get a blank 		; space);	
;; Fourth Attempt
mov al,[0x7c1d]  ; This is a pre-calculated address from the offest of 0x7c00.
int 0x10

jmp $

the_secret:
 db "X"

; This portion only Edit the file till the File size is 512 bytes and last 2 bytes being the magic number, i.e aa55
times 510-($-$$) db 0 ; Padding all the extra space with the 0's

dw 0xaa55 ; putting 55aa at last but this works in little endian format so the aa55.
