.486
STACK_ SEGMENT STACK 'STACK' USE16
           DB 128 DUP (?)
STACK_ ENDS

CODE SEGMENT USE16
            ASSUME CS:CODE, SS:STACK_

    BEG:
            MOV    AX, STACK_
            MOV    SS, AX
            MOV    SP, 128

            MOV    AX, 0
            MOV    CX, 200
            MOV    BX, 1

    LSTART:
            ADD    AX, BX
            INC    BX
            LOOP   LSTART
    ; AX = 20100

            MOV    AH, 4CH
            INT    21H

CODE ENDS
END BEG