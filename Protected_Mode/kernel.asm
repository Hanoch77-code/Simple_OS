[BITS 32]
[org 0x10000]

%define DATA_TEMP 0x20000

start:
    mov ebx,cusor_position
    mov dword [ebx],0xB8000
    xor ebx,ebx
    xor eax,eax
    xor ecx,ecx
    xor edx,edx
    call fun_fill_screen_32
    mov ebx,strings
    call fun_print_32
    ;call fun_new_line
    ;mov ebx,strings
    call fun_print_32



hang:
    jmp hang

fun_new_line:
    push eax
    push ebx
    push ecx
    push edx

    mov eax,[cusor_position]
    sub eax,0xB8000

    mov ecx,160
    xor edx,edx
    div ecx

    inc eax
    mul ecx
    add eax,0xB8000

    mov [cusor_position],eax
    

    pop edx
    pop ecx
    pop ebx
    pop eax
ret


fun_print_hex_32:
    push eax
    push ecx
    push edx

    mov eax,ebx
    mov ebx,hex_start
    

.repeat:
    ;Disassemble the txt to single charater
    mov ax,dx

    cmp al,0x10
    jl .integer
    add al,0x07
.integer:
    add al,0x30
    push ebx
    mov [ebx],al
.exit:
    pop edx
    pop ecx
    pop eax
ret

fun_fill_screen_32:
    push eax
    push ebx
    push ecx
    push edx


    mov edi, 0xB8000
    mov ecx, 80 * 25

.repeat:

    mov byte [edi], 0x20
    mov byte [edi+1],0x1F
    add edi, 2
    loop .repeat
.exit:
    pop edx
    pop ecx
    pop ebx
    pop eax
ret

fun_print_32:

    push eax
    push ecx
    mov edi, [cusor_position]
    mov ecx,ebx
    
.repeat:
    mov al,[ebx]
    cmp al,0
    je .exit
    mov  byte [edi], al
    mov  byte [edi+1], 0x0F
    add edi,2
    inc bx
    add dword [cusor_position],2
    jmp .repeat

.exit:
    mov ebx,ecx
    pop eax
    pop ecx
ret

; data
; Strings
strings:
    db "Hanoch" , 0
hex_start:
    db "0x",0
cusor_position:
    dd 0x00000,0
    

