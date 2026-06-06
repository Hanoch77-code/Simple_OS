[BITS 16]
[org 0x7c00]

mov ax,cs
mov ds,ax
mov es,ax
mov ax,0x8000
mov ss,ax
mov sp,ss

start:
    mov al,0x03
    mov ah,0
    int 0x10

_mouser:
    mov ah,0x02
    mov dl,bl
    mov dh,cl
    int 0x10
    mov ah,0x00
    int 0x16

    cmp al,0x08
    je _backspace
    cmp al,0x09
    jge _print
    cmp al,0x7
    jae _print
    jmp _mouser

_backspace:
    sub bl,0x1
    jmp _backspace2

_backspace2:
    mov ah,0x0e
    mov al,0x20
    int 0x10
    jmp _mouser

_down:
    add cl, 0x1
    jmp _mouser

_up:
    sub cl,0x1
    jmp _mouser

_left:
    sub bl,0x1
    jmp _mouser

_right:
    add bl,0x1
    jmp _mouser

_print:
    mov ah,0x0e
    cmp al,0x0D
    je _down
    int 0x10
    jmp _right
ret