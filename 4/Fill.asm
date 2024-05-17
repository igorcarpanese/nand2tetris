// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(START)
    // i = 0
    @0
    D=A
    @i
    M=D

    @KBD
    D=M
    @BLACK
    D;JGT

    @WHITE
    0;JMP

// Fill screen with -1 (from SCREEN to SCREEN + 8192)
(BLACK)
    // If keyboard state change, restart the program.
    @KBD
    D=M
    @START
    D;JEQ

    // if 256 - i = 0 jump to END
    @i
    D=M
    @8192
    D=A-D
    @END
    D;JEQ

    // RAM[SCREEN + i] = -1
    @SCREEN
    D=A
    @i
    D=D+M
    A=D
    M=-1

    // i += 1
    @i
    M=M+1

    @BLACK
    0;JMP

// Fill screen with 0 (from SCREEN to SCREEN + 8192)
(WHITE)
    // If keyboard state change, restart the program.
    @KBD
    D=M
    @START
    D;JGT

    // if 256 - i = 0 jump to END
    @i
    D=M
    @8192
    D=A-D
    @END
    D;JEQ

    // RAM[SCREEN + i] = 0
    @SCREEN
    D=A
    @i
    D=D+M
    A=D
    M=0

    // i += 1
    @i
    M=M+1

    @WHITE
    0;JMP

(END)
    @START
    0;JMP