;PROGRAM TO ADD TWO 32 BIT NUMBERS NUMBERS  

.MODEL SMALL
.STACK 100H
.DATA
ABC DD 12345678H
DEF DD 12345678H
GHI DW ?
.CODE 
MAIN PROC
         
    MOV AX,@DATA
    MOV DS,AX
	
	MOV DX,0
	
	MOV AX, WORD PTR ABC
	MOV BX, WORD PTR DEF
	ADD AX,BX
	MOV WORD PTR GHI,AX
	
	MOV AX, WORD PTR ABC+2
	MOV BX, WORD PTR DEF+2
	ADC AX,BX
	MOV WORD PTR GHI+2,AX
	
	JNC MOVE
	INC DL
	
MOVE: 
	MOV BYTE PTR GHI+4,DL
	
	MOV AX,WORD PTR GHI+4
	MOV SI,0054
	MOV [SI],AX
	
	MOV AX,WORD PTR GHI+2
	DEC SI
	DEC SI
	MOV [SI],AX
	
	MOV AX,WORD PTR GHI
	DEC SI
	DEC SI
	MOV [SI],AX
	
	MOV AH,4CH
    INT 21H
    
MAIN ENDP
END MAIN