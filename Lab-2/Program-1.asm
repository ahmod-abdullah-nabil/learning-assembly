.486

CMPDISP MACRO NN
            LOCAL LAST, NEXT
            MOV   DL, 0
    LAST:   CMP   BL, NN
            JB    NEXT
            INC   DL
            SUB   BL, NN
            JMP   LAST
    NEXT:   ADD   DL, 30H
            MOV   AH, 2
            INT   21H
ENDM

DATA SEGMENT USE16
    BUF     DB  'HELLO ABCDEFBBCCDDEE'
    BUF_LEN EQU ($ - BUF)
    COUNT   DB  0
DATA ENDS

CODE SEGMENT USE16
               ASSUME  CS:CODE, DS:DATA

    BEG:       MOV     AX, DATA
               MOV     DS, AX

               LEA     SI, BUF
               MOV     CX, BUF_LEN
               XOR     BL, BL

    SCAN:      MOV     AL, [SI]
               CMP     AL, 42H
               JB      NEXT_CHAR
               CMP     AL, 45H
               JA      NEXT_CHAR
               INC     BL

    NEXT_CHAR: INC     SI
               LOOP    SCAN

               MOV     COUNT, BL

               CMPDISP 10
               CMPDISP 1

               MOV     AH, 4CH
               INT     21H

CODE ENDS
END BEG
