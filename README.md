# Random-Halfword PPC ASM

Version 0.2

The source file "source.s" contains PowerPC Broadway (Wii) Assembly code that can generate a random Halfword (16-bit) output. The function is built to be executed as a subroutine. You call the function with the proper arg (r3) and once the function is done, it returns the result in r3.

This is my attempt of writing the Middle Square Theorem (using the Weyl sequence to prevent convergence). I had to 'downsize' though since my Seed is 32 bits instead of 64. Thus, halfword output is used for the random output instead of a word.

The seed is using the lower 32 bits of the TB (Time Base). Ofc, including the upper 32 bits is not a good idea.

Rules:

The r3 arg is the amount of times that the generator does a 'cycle'. You want this number to be at least 4. The number is treated logically. If the user sets the r3 arg to 0, the subroutine will auto adjust the value to 4. There are no error return values. The subroutine always works.

Register Notes:

LR, CTR, r0, & r3 thru r5 are all used.

How to Compile & Run:

Use PyiiASMH or WiiRDGUI to compile it as a Wii cheat code. Apply any memory address you want the code to hook to, and apply the code to Dolphin.

Change Log / History

v0.1 Nov 8, 2019 - Initial Release

v0.2 Feb 13, 2020 - Auto adjusts r3 arg of Null to 4, thus the subroutine will always run successfully.
