// Add two num
// RAM[0] = RAM[1] + RAM[2]
//


// D = RAM[1]
@R1
D=M

// D = D + RAM[2]
@R2
D=D+M

// RAM[0] = D
@R0
M=D

@END
(END)
0;JMP