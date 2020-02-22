;Program which will ask for a string and takes the input from keyboard & display it

.MODEL SMALL
.STACK 100H
.DATA
	var1 DB 20 DUP('$')
.CODE
MAIN PROC
	MOV AX,@DATA
	MOV DS,AX
	MOV SI,OFFSET var1
L1:	
	MOV AH,1
	INT 21H
	CMP AL,13
	JE L2
	MOV [SI],AL
	INC SI
	JMP L1
L2:
	MOV DX,OFFSET var1
	MOV AH,9
	INT 21H
	MOV AH,4CH
	INT 21H
MAIN ENDP
END MAIN
	
	