;Program to reverse a string using stack and display it

.MODEL SMALL
.STACK 100H
.DATA
MSG DB 'STRING$'
.CODE
MAIN PROC
MOV AX,@DATA
MOV DS,AX

LEA SI,MSG
MOV CX,6

L1:

MOV AL,[SI]
PUSH AX
INC SI
LOOP L1
MOV CX,6


L2:
POP DX
MOV AH,02H
INT 21H
LOOP L2

MOV AH,4CH
INT 21H

MAIN ENDP
END MAIN