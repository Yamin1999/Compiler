.686 ; Pentium or below processors
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

.stack 100h
printf PROTO arg1:Ptr Byte, printlist: VARARG
scanf PROTO arg2:Ptr Byte, inputlist: VARARG

.data
out_msg_frmt byte "%s", 0Ah, 0
out_msg1 byte "Enter the Number:", 0
out_msg2 byte "POSITIVE", 0
out_msg3 byte "NEGATIVE", 0
out_msg4 byte "ZERO", 0
;out_msg byte "Hello World", 0Ah, 0



input_frmt byte "%d", 0
number sdword ?



;sdword= 32 singed number
;dword = 32 bits
;word =16 bits
;byte = 8 bits

.code
main proc
    INVOKE printf, ADDR out_msg_frmt, ADDR out_msg1
    INVOKE scanf, ADDR input_frmt, ADDR number

    mov eax,number
    cmp eax,0

    jl NEGATIVE
    je ZERO
    jg POSITIVE

    NEGATIVE:
    INVOKE printf, ADDR out_msg_frmt, ADDR out_msg3
    jmp EXIT
    
    POSITIVE:
    INVOKE printf, ADDR out_msg_frmt, ADDR out_msg2
    jmp EXIT

    ZERO:
    INVOKE printf, ADDR out_msg_frmt, ADDR out_msg4
    jmp EXIT

    ;INVOKE printf, ADDR out_msg_frmt, number
    
    EXIT:
    ret
main endp
end
