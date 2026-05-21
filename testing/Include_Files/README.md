# How to include files which contain code in asm.
- simply use the following syntax
#        %include "<filename>.asm"
- this should be done after infinte jmp loop (jmp $) and before the data labels.
- This whole thing is illustrated in the boot.asm with external file file.asm.

