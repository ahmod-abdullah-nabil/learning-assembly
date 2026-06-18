;write a the bcd code of 89 to AL

.486
DATA SEGMENT USE16
DATA ENDS
CODE SEGMENT USE16
         ASSUME CS:CODE,DS:DATA
    BEG: MOV    AX, DATA
         MOV    DS,AX
         MOV    AL,89
         AAM
         SHL    AH,4             ; pack tens into high nibble
         OR     AL,AH            ; AL = 89h (packed BCD)
         MOV    AH,4CH
         INT    21H
CODE ENDS
END BEG