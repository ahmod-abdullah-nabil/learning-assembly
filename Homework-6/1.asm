    .486    ;Suppose: the numbers in AX and BX are all signed numbers. Write a short assembly program that implements if AX<BX then CX=0 otherwise CX=1.
DATA SEGMENT
DATA ENDS
    
STACK_ SEGMENT USE16
    DB 128 DUP ( ? )
STACK_ ENDS
    
CODE SEGMENT
    ASSUME CS : CODE, DS : DATA, SS : STACK_
START:
    MOV    AX, DATA
    MOV    DS, AX
    
    MOV    AX, - 5 ; signed test value, change as needed
    MOV    BX, 10 ; signed test value, change as needed
    
    CMP    AX, BX ; AX - BX, sets flags (signed comparison)
    JL     ISLESS ; if AX < BX, jump
    MOV    CX, 1 ; else: CX = 1
    JMP    EXIT
ISLESS:
    MOV    CX, 0 ; AX < BX: CX = 0
    
EXIT:
    MOV    AH, 4CH
    INT    21H
CODE ENDS
    END    START