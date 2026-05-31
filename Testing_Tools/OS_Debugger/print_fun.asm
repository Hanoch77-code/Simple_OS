; IMP bx is used as data tranfer register in this OS
; Please push the bx data to stack before moving to another function and then send it.
print_string:

repeat:
mov al,[bx]
cmp al,0
je print_end
int 0x10
add bx,1
jmp repeat
print_end:

ret

print_hex:
mov cx,dx
mov bx,HEX_OUT
add bx,2
push ax
mov ax,3
p_h_r:
shr cx,ax
and cx,0xF
call convert_hex_ascii
mov [bx],cx
inc bx
mov cx,dx
dec ax
jnz p_h_r
pop ax
mov bx,HEX_OUT
call print_string
ret

convert_hex_ascii:
cmp cx,9
jle skip_convert_hex_ascii
add cx,0x7
skip_convert_hex_ascii:
add cx,0x30
ret
