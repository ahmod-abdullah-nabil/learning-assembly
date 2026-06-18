.486
DATA SEGMENT USE16
    BUF  DW 1A2BH
DATA ENDS
CODE SEGMENT USE16
            ASSUME CS:CODE,DS:DATA
    BEG:    MOV    AX, DATA
            MOV    DS,AX
            MOV    BX,BUF
            MOV    CX,4
    AGA:    ROL    BX,4               ; rotate next hex digit into low nibble
            MOV    DL,BL
            AND    DL,0FH             ; get the 4-bit binary
            CMP    DL,10
            JB     HEX_OK
            ADD    DL,7
    HEX_OK: ADD    DL,30H
            MOV    AH,2
            INT    21H                ;display the Hex digit
            LOOP   AGA
            MOV    AH,4CH
            INT    21H
CODE ENDS
END BEG