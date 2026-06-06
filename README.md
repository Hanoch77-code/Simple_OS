<img width="700" height="100" alt="Simple_OS" src="https://github.com/user-attachments/assets/4afa49f7-95dc-4b1a-8440-1207f27c946f" />


# Simple_OS ![GitHub last commit](https://img.shields.io/github/last-commit/Hanoch77-code/Simple_OS)
This is a simple OS that I am creating by [referring books and Youtube videos](#references).
## Introduction
- Operating System (OS) is a fascinating work of art. It is just like any other program that runs on a hardware but OS is like a framework or platform where any program can use the resources provided by the master(OS). So OS is like a Master Control(i was referncing TRON).
- SO making a simple bootable disk which only does a basic printing fell different at first but the actual painful thing is management of resources of the Hardware and Managing the Data.
- When you achieve this You are in the creation the OS, i meant a part of it.

## Ideology
- So, in my opnion an <b>ideal OS</b> is like a <b>GOOD VIRUS</b> which takes control of everything and uses every single resource to achieve a result. So I want my OS to do the same.
- It needs to <b>take control of everything </b> and I don't want any hardware isssues or software errors.
- If a system cannot handle your OS it is a failed OS. <b><u>Adapting and Updating is the Key for everything.</u></b>
- So the name <b><u><i>SIMPLE OS</i></u></b>. It <b>works and looks simple </b> on a brand new pc and on a old mobile.
- But uses all <b> the resources to maximum potential</b> by adapting to the hardware.

## Boot Sector / Boot Loader
- It is the program from the hardrive which is loaded into the CPU via BIOS to initiate the Boot process of the OS.
- It is only 512 bytes and ends with a magic bytes 55AA with in binary 0101010110101010.
- So when the BIOS notices that this file ends with the magic number then it again reads the file and exectutes the instructions in the file
- The [first version](boot/V0.2/boot.asm) just boots and tells Hello.
- The [version 2](Protected_Mode/boot.asm) acts like a bootloader it pull the kernel code and shift to higher bit level like from 16 bit to 32 bit protected mode.

## Tools Used
- Linux OS to write CODE it is easier than windows.
- Netwide Assembler (NASM) to compile the Assembly code
- Qemu to emulate the CPU to run the OS.


## References
- <b>Writing a simple Operating System from Scratch --<i>by Nick Blundell:</i></b>\
 This book is the starting point of this repo and I have made a simple boot sector and also included testing exercises for improving the understanding of the OS working and how a CPU understands instruction.
