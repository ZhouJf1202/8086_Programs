DATA SEGMENT 
    VAR1 DW 110AH
    VAR2 DB 4 DUP(0)
DATA ENDS 

CODE SEGMENT 
    ASSUME CS:CODE, DS:DATA, ES:DATA
START:   MOV AX, DATA
         MOV DS, AX
         MOV ES, AX
         MOV DX, VAR1
         LEA SI, VAR2 
         MOV BX, 0
LOOP1:   MOV AX, DX
         AND AX, 000FH
         CMP AL, 0AH
         JB LOOP2
         ADD AL, 07H
LOOP2:   ADD AL, 30H
         MOV [SI], AL
         INC SI
         INC BX
         CMP BX, 4
         JZ OVER
         MOV CL, 4
         SHR DX, CL
         LOOP LOOP1
OVER:    HLT
CODE ENDS 

            END START
