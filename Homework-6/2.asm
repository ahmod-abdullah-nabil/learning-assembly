    .486; Write a short assembly program that executes the NOP instruction for 20 times.
    
DATA SEGMENT USE16
DATA ENDS
    
STACK_ SEGMENT STACK_ 'STACK' USE16
    DB 128 DUP ( ? )
STACK_ ENDS
    
CODE SEGMENT USE16
    ASSUME CS : CODE DS : DATA, SS : STACK_
BEG:
    MOV    AX, DATA
    MOV    DS, AX
    
    MOV    CX, 20 ; loop counter = 20
LABEL1:
    NOP     ; no operation
    LOOP   LABEL1 ; CX = CX-1, repeat until CX=0
    
EXIT:
    MOV    AH, 4CH
    INT    21H
CODE ENDS
    END    BEG