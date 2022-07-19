.686
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist:VARARG
scanf PROTO arg2:Ptr sdword, inputlist:VARARG

.data
    in1fmt byte "%d",0

    msg1fmt byte "%s",0
    msg1 byte "Enter the number: ",0

    msg2fmt byte "%s %d",0Ah,0
    msg2 byte "Answer:",0
    msg3 byte "Reminder:",0

    val1 dword ? ; number of volts
    val2 dword ? ; number of volts
    answer dword ?
    reminder dword ?

.code
main PROC
    INVOKE printf, ADDR msg1fmt, ADDR msg1
    INVOKE scanf, ADDR in1fmt, ADDR val1
    INVOKE printf, ADDR msg1fmt,ADDR msg1
    INVOKE scanf, ADDR in1fmt, ADDR val2

    push val2 ;6
    push val1 ;3
    call DivTwo
    pop val1
    pop val2

    ret
main ENDP

AddTwo PROC
    push ebp
    mov ebp, esp
    mov edx, [ebp+12]
    add edx, [ebp+8]
    mov answer, edx
    INVOKE printf, ADDR msg2fmt, ADDR msg2, answer
    pop ebp
    ret
AddTwo ENDP

MulTwo PROC
    
    push eax
    push ebx
    push ebp

    mov ebp, esp
    mov eax, [ebp+20]
    mov ebx, [ebp+16]
    mul ebx
    mov answer, eax

    INVOKE printf, ADDR msg2fmt, ADDR msg2, answer

    pop ebp
    pop ebx
    pop eax

    ret
MulTwo ENDP


DivTwo PROC
    
    push eax
    push ebx
    push edx
    push ebp

    mov ebp, esp
    mov edx,0
    mov eax, [ebp+20]
    mov ebx, [ebp+24]
    div ebx
    mov answer, eax
    mov reminder,edx

    INVOKE printf, ADDR msg2fmt, ADDR msg2, answer
    INVOKE printf, ADDR msg2fmt, ADDR msg3, reminder
    

    pop ebp
    pop edx
    pop ebx
    pop eax

    ret
DivTwo ENDP



Factorial PROC
    push eax
    push ebx
    push edx
    push ebp

    mov ebp, esp
    mov eax,1
    mov ebx, [ebp+20]

lp:
    cmp ebx,1
    je EXIT_    
    mul ebx
    dec ebx
    jmp lp

EXIT_:

    mov answer, eax
    

    INVOKE printf, ADDR msg2fmt, ADDR msg2, answer
    

    pop ebp
    pop edx
    pop ebx
    pop eax

    ret

Factorial ENDP

END main


