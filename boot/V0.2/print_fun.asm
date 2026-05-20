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
