.MODEL SMALL
.STACK 100H
.DATA
	ARR DW 12,124,37,322,49,63,26,48,50,25,'$'
	BASE DW 10
.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	MOV CX,10
L1:
	LEA SI,ARR
	LEA DI,ARR
	INC DI
	INC DI
L2:
	MOV AX,[SI]
	MOV BX,[DI]
	CMP AX,[DI]
	JG L3
	MOV [SI],BX
	MOV [DI],AX
L3:
	INC SI
	INC SI
	INC DI
	INC DI
	MOV AX,[DI]
	CMP AX,'$'
	JE L4
	JMP L2
L4:
	LOOP L1
	LEA SI,ARR
L5:
	MOV AX,[SI]
	CMP AX,'$'
	JE L9
	MOV BX,BASE
	MOV CX,'$'
	PUSH CX
L6:
	MOV DX,0
	DIV BX
	PUSH DX
	CMP AX,0
	JE L7
	JMP L6
L7:
	POP DX
	CMP DX,'$'
	JE L8
	ADD DX,48
	MOV AH,02H
	INT 21H
	JMP L7
L8:
	MOV DX,' '
	MOV AH,02H
	INT 21H
	INC SI
	INC SI
	JMP L5
L9:
	MOV AH,4CH
	INT 21H
MAIN ENDP
END  MAIN