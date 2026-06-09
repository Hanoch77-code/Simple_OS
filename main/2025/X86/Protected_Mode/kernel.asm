[BITS 32]
[org 0x10000]

%define DATA_TEMP_START 0x100000
PRINT_32_ID equ 1

start:
    mov dword [sys_stack_pos],esp
    mov dword [fun_stack_pos],DATA_TEMP_START
    mov dword [cusor_position],0xB8000
    xor ebx,ebx
    xor eax,eax
    xor ecx,ecx
    xor edx,edx
    call fun_fill_screen_32
    ;; Print the text strings.
    mov esp,[fun_stack_pos]
    push strings
    push 1
    push PRINT_32_ID
    mov [fun_stack_pos],esp
    mov esp,[sys_stack_pos]
    call fun_print_32
    call fun_new_line
    ;mov ebx,strings
    ;call fun_print_32



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
    mov [sys_stack_pos],esp
    mov esp,[fun_stack_pos]
    pop eax
    cmp eax,PRINT_32_ID
    jne .exit_error
    pop eax
    cmp eax,1
    je ._1_print
    jmp .exit_error
    
    
    ._1_print:
    pop ebx
    mov edi, [cusor_position]
    mov ecx,ebx
    ._1_repeat:
    mov al,[ebx]
    cmp al,0
    je .exit
    mov  byte [edi], al
    mov  byte [edi+1], 0x0F
    add edi,2
    inc ebx
    add dword [cusor_position],2
    jmp ._1_repeat


    .exit_error:
    mov  byte [edi], 'H'
    mov  byte [edi+1], 0x0F
    .exit:
    mov [fun_stack_pos],esp
    mov esp,[sys_stack_pos]
ret







; data
; Strings
strings:
    db "Hanoch" , 0
print_fun_error:
    db "Error: Print Function"
hex_start:
    db "0x",0
cusor_position:
    dd 0x00000,0
fun_stack_pos:
    dd 0x00000,0
sys_stack_pos:
    dd 0x00000,0

