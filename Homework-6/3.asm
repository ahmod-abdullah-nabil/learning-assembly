    .486 ;Please write a program to calculate the total sum of and save the result in BL .
DATA SEGMENT
DATA ENDS
    
STACK SEGMENT STACK
    DB 256 DUP ( ? )
STACK ENDS
    
CODE SEGMENT
    ASSUME CS : CODE, DS : DATA, SS : STACK
START:
    MOV    AX, DATA
    MOV    DS, AX
    
    MOV    BL, 0 ; BL = running sum
    MOV    CX, 10 ; loop counter = 10
    
LL:
    ADD    BL, CL ; BL = BL + CL: 10+9+...+1
    LOOP   LL ; CX = CX-1, repeat until CX=0
    
EXIT:
    MOV    AH, 4CH
    INT    21H
CODE ENDS
    END    START