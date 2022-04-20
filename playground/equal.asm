// if RAM[0] === 34
//   RAM[1] = 65
// else
//   RAM[1] = 97

// D = RAM[0]
@R0
D=M

// D = D - 34
@34
D=D-A

@IS_EQUAL_TO
D;JEQ

// RAM[1] = 97
@97
D=A
@R1
M=D

@END
0;JMP

(IS_EQUAL_TO)
// RAM[1] = 65
@65
D=A
@R1
M=D

@END
(END)
0;JMP
