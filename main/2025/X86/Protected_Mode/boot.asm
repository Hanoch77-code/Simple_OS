[BITS 16]
[ORG 0x7C00]

cli

xor ax, ax
mov ds, ax
mov es, ax
mov ss, ax
mov sp, 0x7C00

;;; Reading the display properties

mov ax,0x4F03
int 0x10

mov ax,0x4F01
mov cx,0x4118
mov di,0x9000
int 0x10





mov [boot_drive], dl  ; <--- SAVE THE BI0S DRIVE NUMBER HERE!

; --------------------------
; Enable A20
; --------------------------
in al, 0x92
or al, 2
out 0x92, al

; --------------------------
; Load kernel from disk
; --------------------------
xor ax, ax
mov ax,0x1000
mov es,ax
xor bx,bx

mov ah, 0x02
mov al, 1        
mov ch, 0
mov cl, 2
mov dh, 0
mov dl, [boot_drive]  ; <--- USE THE COPIED DRIVE NUMBER HERE!

int 0x13
jc disk_error

; --------------------------
; Load GDT
; --------------------------
lgdt [gdt_descriptor]

; --------------------------
; Enter protected mode
; --------------------------
mov eax, cr0
or eax, 1
mov cr0, eax

jmp 0x08:protected_mode

; ==================================================
; GDT
; ==================================================

gdt_start:

gdt_null:
    dq 0

gdt_code:
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 10011010b
    db 11001111b
    db 0x00

gdt_data:
    dw 0xFFFF
    dw 0x0000
    db 0x00
    db 10010010b
    db 11001111b
    db 0x00

gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start


; ==================================================
; Protected Mode
; ==================================================

[BITS 32]

protected_mode:

    mov ax, 0x10

    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax

    mov esp, 0x90000
    mov ebp, esp

    ; Jump to kernel loaded at 0x1000
    jmp 0x10000


; ==================================================
; Disk Error
; ==================================================

[BITS 16]


disk_error:
    mov ah, 0x0E
    mov al, 'E'
    int 0x10

    mov al, ah
    add al, '0'
    int 0x10

    jmp $
boot_drive db 0  
error_msg db "Disk Error!",0


times 510-($-$$) db 0
dw 0xAA55
