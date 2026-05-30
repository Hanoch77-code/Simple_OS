# Conditional Statements
- The conditional Statements help in running a block of code based on a particular event or condition. 
- In assembly we use mnemonics like
        ## - cmp  : This compares a two value and creates a Flag. 
        ## -- je  : jump if equal (it reads the cmp flag)
        ## -- jne : jump if not equal
        ## -- jl  : jump if less than
        ## -- jle : jump if less than or equal
        ## -- jg  : jump if greater than
        ## -- jge : jump if greater than or equal
For example:
a = 30;
if(a <= 4){
    print("A")
} else if(a < 40){
    print("B")
} else {
    print("C")
}

This is a general way we make a conditional output using a high level progamming language but when comming to assembly creating this we need the following statements.
This is done in the code please refer the boot.asm code.

