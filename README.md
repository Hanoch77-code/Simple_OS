<img width="700" height="100" alt="Simple_OS" src="https://github.com/user-attachments/assets/4afa49f7-95dc-4b1a-8440-1207f27c946f" />
# Simple_OS https://img.shields.io/github/last-commit/Hanoch77-code/Simple_OS
This is a simple OS that is am creating by referring the books and Youtube videos.
## Introduction
- Writing a simple Operating System from Scratch -- by Nick Blundell
- This book is the starting point of this repo and I have made a simple boot sector and also included testing exercises for improving the understanding of the OS working and how a CPU understands instruction.

## Boot Sector
- It is the program from the hardrive which is loaded into the CPU via BIOS to initiate the Boot process of the OS.
- It is only 512 bytes and ends with a magic bytes 55AA with in binary 0101010110101010.
- So when the BIOS notices that this file ends with the magic number then it again reads the file and exectutes the instructions in the file
- The first Version just boots and tells Hello.

## Tools Used
- Linux OS to write CODE it is easier than windows.
- Netwide Assembler (NASM) to compile the Assembly code
- Qemu to emulate the CPU to run the OS.
