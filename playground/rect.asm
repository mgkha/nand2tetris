// 16 pixels wide
// RAM[0] pixels long

@R0
D=M

@n
M=D // n = RAM[0]

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

    // if i - n > 0 go to STOP
    @STOP
    D;JGE

    @address
    A=M
    M=-1 // RAM[address] = -1 

    @32
    D=A
    @address
    M=D+M // address = address + 32

    @i
    M=M+1 // i = i + 1

    @LOOP
    0;JMP

(STOP)


@END
(END)
0;JMP