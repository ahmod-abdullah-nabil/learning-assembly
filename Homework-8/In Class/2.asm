;Example2 . Display the 8-bit number which stores in memory unit BUF in its Hex-decimal format.
.486
DATA SEGMENT USE16
    BUF  DB 7AH
DATA ENDS
CODE SEGMENT USE16
         ASSUME CS:CODE,DS:DATA
    BEG: MOV    AX, DATA
         MOV    DS,AX
         MOV    BL,BUF
         MOV    CX,2
    AGA: ROL    BL,4               ; BL=A7H
         MOV    DL,BL
         AND    DL,0FH             ; get the 4-bit binary
         CMP    DL,10
         JB     NE
         ADD    DL,7
    NE:  ADD    DL,30H
         MOV    AH,2
         INT    21H                ;display the Hex digit
         LOOP   AGA
         MOV    AH,4CH
         INT    21H
CODE ENDS
END BEG