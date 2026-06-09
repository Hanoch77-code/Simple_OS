my_func: ; The actual function defination using label
pusha
mov al,[bx] ; the data is transferred to function using a common register bx.
int 0x10
mov al,'H'
int 0x10
mov al,'e'
int 0x10
mov al,'l'
int 0x10
mov al,'l'
int 0x10
mov al,'o'
int 0x10
popa
ret 
