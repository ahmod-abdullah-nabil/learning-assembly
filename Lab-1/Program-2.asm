.486
DATA SEGMENT USE16
    N1   DB 37
    N2   DB 24
    SUM  DB 'THE SUM IS ', '$'
DATA ENDS
CODE SEGMENT USE16
           ASSUME CS:CODE, DS:DATA
    BEG:   MOV    AX,DATA
           MOV    DS,AX
           MOV    BH,N1
           MOV    BL,N2
           ADD    BH,BL
           MOV    AH,9
           MOV    DX,OFFSET SUM
           INT    21H
           CALL   CHANG
           MOV    AH,2
           MOV    DL,'H'
           INT    21H
           MOV    AH,4CH
           INT    21H
CHANG PROC
           MOV    AL,BH
           MOV    BL,AL
           SHR    AL,4
           CALL   OUTHEX
           MOV    AL,BL
           AND    AL,0FH
           CALL   OUTHEX
           RET
CHANG ENDP
OUTHEX PROC
           CMP    AL,9
           JBE    DIG
           ADD    AL,7
    DIG:   ADD    AL,'0'
           MOV    DL,AL
           MOV    AH,2
           INT    21H
           RET
OUTHEX ENDP
CODE ENDS
        END     BEG