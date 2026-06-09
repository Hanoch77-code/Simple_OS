print_string:
    mov ah,0x0e
    .repeat:
    mov al,[bx]
    cmp al,0
    je .print_end
    int 0x10
    add bx,1
    jmp .repeat
    .print_end:
ret

print_hex:
        xor cx,cx
        mov dx,bx
        mov bx,hex
        add bx,5
        mov ch,4
    .repeat:
        mov ax,dx
        and ax,0x000F
        inc cl
        cmp ax,9
        jle .skip
        add ax,0x7
    .skip:
        add ax,0x30
        mov [bx],al
        dec bx

        shr dx,4

        dec ch
        jnz .repeat
    

        mov bx,hex
        call print_string

        mov cx,4
        mov bx,hex
        add bx,2    
        .clean:
        mov byte [bx],'0'
        inc bx
        loop .clean
ret

