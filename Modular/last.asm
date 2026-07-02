    .486 ; Please write a complete assembly program. There is a 8-bit signed number in data segment memory unit BUF . IF  5<the number<=24, then move O to AL otherwise move -1 to AL. 
    
DATA SEGMENT USE16
DATA ENDS
    
STACK SEGMENT STACK
    DB 256 DUP ( ? )
STACK ENDS
    
CODE SEGMENT USE16
    ASSUME CS : CODE, DS : DATA, SS : STACK
    
BEG:
    MOV    AX, DATA
    MOV    DS, AX
    
    MOV    AL, BUF
    CMP    AL, 5
    JLE    ELSE
    CMP    AL, 24
    JG     ELSE
    MOV    AL, 0
ELSE:
    
    MOV    AL, - 1
    
    
    
EXIT:
    
    MOV    AH, 4CH
    INT    21H
CODE ENDS
    END    BEGS