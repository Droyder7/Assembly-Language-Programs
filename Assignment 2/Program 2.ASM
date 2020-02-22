;PROGRAM TO MULTIPLY TWO 16 BIT NUMBERS NUMBERS  

.MODEL SMALL
.STACK 100H
.DATA
X DW 65535
Y DW 10000
Z DW ?
N DW ?
A DW ?
B DW ?
C DW ?  
D DW ?
MULT DB " * $"
EQUAL DB " = $"
ENTER DB 10,13,"$"
.CODE 
MAIN PROC
         
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AX,X
    CALL PRINT
    
    LEA DX,MULT
	MOV AH,9H
	INT 21H
    
    MOV DX,0
    
    MOV AX,Y
    CALL PRINT
    
    LEA DX,EQUAL
	MOV AH,9H
	INT 21H
        
    MOV     AX, X
	MOV     BX, Y
	MUL BX
	
    CALL PRINT
    
    LEA DX,ENTER
	MOV AH,9H
	INT 21H
    
    MOV AH,4CH
    INT 21H
    
MAIN ENDP
PRINT PROC
    
    MOV CX,0            
	 
     JNO LABEL1
     
     MOV BX,10000         
     DIV BX
     MOV Z,AX
     
     MOV AX,DX
     MOV DX,0
     
     MOV BX,1000
     DIV BX
     MOV A,AX
     
     MOV AX,DX
     MOV DX,0
     
     MOV BX,100
     DIV BX
     MOV B,AX
     
     MOV AX,DX
     MOV DX,0
     
     MOV BX,10
     DIV BX
     MOV C,AX
     MOV D,DX
     
     MOV AX,D
     PUSH AX
     
     MOV AX,C
     PUSH AX
     
     MOV AX,B
     PUSH AX
     
     MOV AX,A
     PUSH AX
 
     MOV CX,4
             
     MOV AX,Z 
     
LABEL1:    
        MOV DX,0
        
        CMP AX,0 
        JE PRINT1       
          
        MOV BX,10         
          
        DIV BX
                       
          
        PUSH DX               
          
        INC CX               
          
         
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
