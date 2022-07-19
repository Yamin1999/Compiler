.686
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr Byte, inputlist:VARARG

.data
output_msg1_format byte "%s", 0
output_msg3_format byte "%d",0Ah, 0

output_msg1 byte "current:", 0
output_msg2 byte "resistance:", 0
output_msg3 byte "voltage:",0

input_format byte "%d",0
current sdword ?
resistance sdword ?
voltage sdword ?

.code
main proc

    INVOKE printf, ADDR output_msg1_format, ADDR output_msg1
    INVOKE scanf, ADDR input_format, ADDR current 

    INVOKE printf, ADDR output_msg1_format, ADDR output_msg2
    INVOKE scanf, ADDR input_format, ADDR resistance

    
    mov eax, current  
    mov ebx, resistance
    

    mul ebx

    mov voltage, eax
    

    INVOKE printf, ADDR output_msg1_format,ADDR output_msg3 
    INVOKE printf, ADDR output_msg3_format,voltage
    ret
main endp
end