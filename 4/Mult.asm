// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

// a = RAM[0]
@R0
D=M
@a
M=D

// b = RAM[1]
@R1
D=M
@b
M=D 

// RAM[2] = 0
@0
D=A
@R2
M=D

// i = 0
@0
D=A
@i
M=D

(LOOP)
    // if b - i = 0 jump to END
    @i
    D=M
    @b
    D=M-D
    @END
    D;JEQ

    // RAM[2] += a
    @a
    D=M
    @R2
    M=D+M
    
    // i += 1
    @i
    M=M+1

    @LOOP
    0;JMP

(END)
    @END
    0;JMP
