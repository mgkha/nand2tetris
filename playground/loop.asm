// RAM[0] = 1 + 2 + 3 + ... + n
// n = RAM[1]
//

// pseudo code

// n = R1
// i = 1
// sum = 0

// LOOP:
//     if i > n (if i - n > 0) goto STOP
//     sum = sum + i
//     i = i + 1
//     goto LOOP

// STOP:
//     R0 = sum

@R1
D=M
@n
M=D // n = R1

@i
M=1 // i = 1

@sum
M=0 // sum = 0

(LOOP)
    @i
    D=M
    @n
    D=D-M

    // if i - n > 0 go to STOP
    @STOP
    D;JGT

    @sum
    D=M
    @i
    D=D+M
    @sum
    M=D  // sum = sum + i

    @i
    M=M+1 // i = i + 1

    @LOOP
    0;JMP

(STOP)
    @sum
    D=M
    @R0
    M=D
    
@END
(END)
0;JMP