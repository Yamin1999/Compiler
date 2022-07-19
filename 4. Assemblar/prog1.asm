.686 ; Pentium or below processors
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist: VARARG
scanf PROTO arg2:Ptr Byte, inputlist: VARARG

.data
out_msg_frmt1 byte "%s", 0Ah, 0
out_msg_frmt2 byte "%d", 0Ah, 0

out_msg1 byte "Enter the Number:", 0
out_msg2 byte "Total:", 0
out_msg3 byte "Enter the count:", 0



input_frmt byte "%d", 0
count sdword 0
total sdword 0
number sdword ?



;sdword= 32 singed number
;dword = 32 bits
;word =16 bits
;byte = 8 bits

.code
main proc
    INVOKE printf, ADDR out_msg_frmt1, ADDR out_msg1
    INVOKE scanf, ADDR input_frmt, ADDR count

    mov eax,total
    
    mov ecx,count

    
    cmp ecx,0
    je EXIT

    dec ecx


    
    EXIT:
    INVOKE printf, ADDR out_msg_frmt2, ADDR out_msg2 
    ret
main endp
end
