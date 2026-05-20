This Version prints Hello, World! using a print function.
- The print function is defined in the file print_fun.asm
- The print utlises the Address of the store Data in the memory using the label(HELLO_MSG)
- The label only points to the first letter Address so we loop through the address and 1 everytime to point to next address
- And print the values present in each function using [] to get data into al and then using int 0x10 to print on the screen
