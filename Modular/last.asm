    .486 ; Please write a complete assembly program. There is a 8-bit signed number in data segment memory unit BUF . IF  5<the number<=24, then move O to AL otherwise move -1 to AL. 
    
DATA SEGMENT USE16
    BUF DB  ?              
DATA ENDS
    
CODE SEGMENT USE16
    ASSUME CS : CODE, DS : DATA
    
BEG:
    MOV    AX, DATA
    MOV    DS, AX
    
    MOV    AL, [ BUF ]
    CMP    AL, 5
    JLE    ELSE1 ; 
    CMP    AL, 24
    JG     ELSE1 ; 
    MOV    AL, 0
    JMP    DONE
    
ELSE1:
    MOV    AL, - 1 ; = FFH
    
DONE:
    MOV    AH, 4CH
    INT    21H ; return to DOS

CODE ENDS
    END    BEG