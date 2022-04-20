// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(INPUT)

@KBD
D=M

@IF_KEY_PRESSED
D;JNE

@R0
M=0 // RAM[0] = 0
@REFRESH
0;JMP

(IF_KEY_PRESSED)
@R0
M=-1 // RAM[0] = -1
@REFRESH
0;JMP

(REFRESH)

@8192
D=A
@n
M=D // n = 8192 (total set of pixels of a screen)

@i
M=0 // i = 0

@SCREEN
D=A
@address
M=D // address = 16384 (base address for screen)

(LOOP)
    @i
    D=M
    @n
    D=D-M

    // if i - n > 0 (i > n) go to STOP
    @STOP
    D;JGE
    
    @R0
    D=M
    @address
    A=M
    M=D // RAM[address] = RAM[0]

    @address
    M=M+1 // RAM[address] = address + 1

    @i
    M=M+1 // i = i + 1

    @LOOP
    0;JMP

(STOP)

@INPUT
0;JMP