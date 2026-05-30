
all:
	nasm -f bin boot.asm -o boot.bin
	nasm -f bin kernel.asm -o kernal.bin
	truncate -s 2048 kernel.bin
	cat boot.bin kernal.bin > boot_image.bin
	qemu-system-i386 -drive format=raw,file=boot_image.bin
