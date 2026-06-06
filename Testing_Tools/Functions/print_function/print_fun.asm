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
    mov ax,0x0e0D
    int 0x10
    mov ax,0x0e0A
    int 0x10
ret

hex_table db "0123456789ABCDEF"


print_hex_v2:
        
        xor cx,cx
        mov dx,bx
        mov bx,hex
        add bx,5
        mov ch,4
    .repeat:
        mov si,hex_table
        mov ax,dx
        and ax,0x000F
        ;add si,ax
        ;mov  al,[si]

        push bx
        mov bx,hex_table
        xlat
        pop bx

        mov [bx],al
        dec bx

        rol dx,4

        dec ch
        jnz .repeat

        mov bx,hex
        call print_string

ret

print_hex_v3:
    mov ah,0x0e
    mov al,'0'
    int 0x10
    mov al,'x'
    int 0x10
    ; Printing Without buffer
    xor cx,cx
    mov cx,4
    mov dx,bx
    mov bx ,hex_table
    .repeat:
    ror dx,4
    mov ax,dx
    and ax,0x000F
    
    xlat
    ;mov al,[bx+ax]
    mov ah,0x0e
    int 0x10
    
    
    loop .repeat
     
    mov ax,0x0e0D
    int 0x10
    mov ax,0x0e0A
    int 0x10
    

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

