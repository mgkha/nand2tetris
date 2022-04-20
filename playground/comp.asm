// if RAM[0] > 28
//   RAM[1] = 65
// else 
//   RAM[1] = 97


// D = RAM[0]
@R0
D=M

@28
D=D-A

@IS_GREATER_THAN
D;JGT

@97
D=A
@R1
M=D
@END
0;JMP

(IS_GREATER_THAN)
@65
D=A
@R1
M=D

@END
(END)
0;JMP