;Example 1. Input a decimal number from keyboard, then display it in it’s binary form.

.486
DATA SEGMENT USE16
       MESG  DB 'Enter !',0DH,0AH,'$'
       MESG2 DB 'ERROR ! $'
DATA ENDS
CODE SEGMENT USE16
              ASSUME CS:CODE,DS:DATA
       BEG:   MOV    AX, DATA
              MOV    DS, AX
              MOV    AH, 9
              MOV    DX, OFFSET MESG
              INT    21H                   ;Display the prompts
              MOV    AH, 1
              INT    21H
              CMP    AL, 39H
              JA     ERROR
              CMP    AL,30H
              JB     ERROR
              SUB    AL,30H
              MOV    BL,AL

              MOV    AH, 2
              MOV    DL, '='
              INT    21H
              ;display " = "
              CALL   DISP
       ;Call the subprogram to
       ;display a number in binary
       ;form

              MOV    AH, 2
              MOV    DL, 'B'
              INT    21H
              ;diaply " B "
              JMP    EXIT
       ERROR: MOV    AH,9
              LEA    DX,MESG2
              INT    21H
       EXIT:  MOV    AH, 4CH
              INT    21H

;---------------------------------
DISP PROC                                  ;Display the data in BL in its binary format
              MOV    CX,8
       LAST:  MOV    DL,'0'
              RCL    BL,1
              JNC    NE
              MOV    DL,'1'
       NE:    MOV    AH,2
              INT    21H
              LOOP   LAST
              RET
DISP ENDP
CODE ENDS
END BEG
