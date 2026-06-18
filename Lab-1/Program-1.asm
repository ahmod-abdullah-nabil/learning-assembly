.486
DATA SEGMENT USE16
    N1   DB 37
    N2   DB 24
    SUM  DB 'THE SUM IS ', '$'
DATA ENDS
CODE SEGMENT USE16
          ASSUME CS:CODE, DS:DATA
    BEG:  MOV    AX,DATA
          MOV    DS,AX
          MOV    BH,N1
          MOV    BL,N2
          ADD    BH,BL
          MOV    AH,9
          MOV    DX,OFFSET SUM
          INT    21H
          CALL   CHANG
          MOV    AH,2
          MOV    DL,'B'
          INT    21H
          MOV    AH,4CH
          INT    21H
CHANG PROC
          MOV    CX,8
    LAST: MOV    DL,'0'
          ROL    BH,1
          JNC    NEXT
          MOV    DL,'1'
    NEXT: MOV    AH,2
          INT    21H
          LOOP   LAST
          RET
CHANG ENDP
CODE ENDS
        END     BEG