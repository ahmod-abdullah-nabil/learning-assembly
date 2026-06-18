;Program 2: Password verification system

.486

DATA SEGMENT USE16
    PASSWORD DB  'HELLO'
    PASS_LEN EQU ($ - PASSWORD)

    PROMPT   DB  'Input password: $'
    OK_MSG   DB  0DH, 0AH, 'Congratulations', 0DH, 0AH, '$'
    FAIL_MSG DB  0DH, 0AH, 'Failed', 0DH, 0AH, '$'

    INBUF    DB  20
    INLEN    DB  ?
    INDATA   DB  20 DUP(?)
DATA ENDS

CODE SEGMENT USE16
                 ASSUME CS:CODE, DS:DATA

    BEG:         MOV    AX, DATA
                 MOV    DS, AX

    INPUT_AGAIN: MOV    AH, 9
                 LEA    DX, PROMPT
                 INT    21H

                 MOV    AH, 0AH
                 LEA    DX, INBUF
                 INT    21H

                 MOV    AL, INLEN
                 CMP    AL, PASS_LEN
                 JNE    FAILED

                 LEA    SI, PASSWORD
                 LEA    DI, INDATA
                 MOV    CX, PASS_LEN

    COMPARE:     MOV    AL, [SI]
                 CMP    AL, [DI]
                 JNE    FAILED
                 INC    SI
                 INC    DI
                 LOOP   COMPARE

                 MOV    AH, 9
                 LEA    DX, OK_MSG
                 INT    21H
                 JMP    EXIT

    FAILED:      MOV    AH, 9
                 LEA    DX, FAIL_MSG
                 INT    21H
                 JMP    INPUT_AGAIN

    EXIT:        MOV    AH, 4CH
                 INT    21H

CODE ENDS
END BEG
