.8086

.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.STACK 100H
.DATA  

.CODE 

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    PRINT 'ENTER A BINARY NUMBER:  ' 
    MOV AH,1
    
    WHILE:
    INT 21H
    CMP AL,0DH
    JE END_WHILE
    
    AND AL,0FH
    SHL BX,1
    OR BL,AL
    JMP WHILE
    
    END_WHILE:
    PRINTN
    PRINT 'EQUIVALENT DECIMAL NUMBER:  '
    
    MOV CX,0
    
    MOV AX,BX
    MOV BX,10
    
    LOOP2:
    XOR DX,DX 
    CMP AX,0
    JE ENDL

    DIV BX
    
    PUSH DX
    INC CX

    JMP LOOP2
    
    ENDL:
    
    LOOP3:
    POP DX
    ADD DX,48
    MOV AH,2
    INT 21H
    LOOP LOOP3
    
    
        
        
        MOV AH,4CH
        INT 21H
        MAIN ENDP
END MAIN