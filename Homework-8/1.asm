.486
DATA SEGMENT USE16
    BUF  DB 10
DATA ENDS

STACK_ SEGMENT STACK 'STACK' USE16
           DB 128 DUP (?)
STACK_ ENDS

CODE SEGMENT USE16
              ASSUME CS:CODE, DS:DATA, SS:STACK_

    BEG:
              MOV    AX, DATA
              MOV    DS, AX
              MOV    AX, STACK_
              MOV    SS, AX
              MOV    SP, 128

              MOV    AL, BUF

              CMP    AL, 5
              JLE    SET_NEG1
              CMP    AL, 24
              JG     SET_NEG1

              MOV    AL, 0
              JMP    EXIT

    SET_NEG1:
              MOV    AL, 0FFH                       ; -1

    EXIT:
              MOV    AH, 4CH
              INT    21H

CODE ENDS
END BEG