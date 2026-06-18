;display the number is decimal
;BX= 0010000B

.486
CMPDISP MACRO NN
            LOCAL LAST,NEXT
            MOV   DL,0         ;Clear DL
    LAST:   CMP   BX,NN        ;Comparison
            JB    NEXT         ;BX < NN then jump to NEXT
            INC   DL           ; increase DL by 1
            SUB   BX,NN        ;BX-NN->BX
            JMP   LAST
    NEXT:   ADD   DL,30H
            MOV   AH,2
            INT   21H          ;Dispaly
ENDM

DATA SEGMENT USE16
DATA ENDS
CODE SEGMENT USE16
         ASSUME  CS:CODE,DS:DATA
    BEG: MOV     AX,DATA
         MOV     DS,AX
         MOV     BX,00100000B
         CMPDISP 100                ; display the number of hundred
         CMPDISP 10                 ; display the number of ten
         CMPDISP 1                  ; display the number of one
         MOV     AH,4CH
         INT     21H
CODE ENDS
END BEG

