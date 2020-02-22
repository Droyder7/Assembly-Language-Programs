;PROGRAM TO ADD 16 BIT SIGNED NUMBERS  

.MODEL SMALL
.STACK 100H
.DATA
X DW 2000
Y DW -3000
PLUS DB " + $"
MINUS DB " -$"
EQUAL DB " = $"
ENTER DB 10,13,"$"
.CODE 
MAIN PROC
         
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AX,X
    CALL PRINT
    
    LEA DX,PLUS
	MOV AH,9H
	INT 21H
    
    MOV AX,Y
    CALL PRINT
    
    LEA DX,EQUAL
	MOV AH,9H
	INT 21H
        
    MOV     AX, X
	MOV     BX, Y
	ADD     AX,BX
	
    CALL PRINT
    
    LEA DX,ENTER
	MOV AH,9H
	INT 21H
    
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
PRINT PROC            
  
  MOV BX,AX
  ADD AX,0
  JNS  SIGN
	MOV BX,65535
	SUB BX,AX
	ADD BX,1
	LEA DX,MINUS
	MOV AH,9H
	INT 21H
	
	MOV AX,BX
	    
SIGN:    MOV CX,0 
    MOV DX,0 
    LABEL1: 
        CMP AX,0 
        JE PRINT1       
          
        MOV BX,10         
          
        DIV BX                   
          
        PUSH DX               
          
        INC CX               
          
        MOV DX,0 
        JMP LABEL1 
    PRINT1: 
        CMP CX,0 
        JE EXIT
          
        POP DX 
          
        ADD DX,48 
        MOV AH,02H 
        INT 21H 

        DEC CX 
        JMP PRINT1
         
EXIT:
    
    MOV AX,0 
RET 
PRINT ENDP 
END MAIN
