// swap two num
// RAM[0] and RAM[1]


// temp = RAM[0]
@R0
D=M
@temp
M=D

// RAM[0] = RAM[1]
@R1
D=M
@R0
M=D 

// RAM[1] = temp
@temp
D=M
@R1
M=D

@END
(END)
0;JMP