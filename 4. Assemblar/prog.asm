.686
.model flat, c
include C:\masm32\include\msvcrt.inc
includelib C:\masm32\lib\msvcrt.lib

;  int main() { int i = 1 ; int j = 1; while (i<10) { j = j * i; i = i + 1;} printf("%d ", i); return 0; } *
; Roll: 1603007

.stack 100h
printf PROTO arg1:Ptr Byte, printlist:VARARG

.data

output_msg3_format byte "%d",0Ah, 0



input_format byte "%d",0
i sdword 1
j sdword 1


.code
main proc
    
    mov eax,j

lp:
    cmp i,10
    je EXIT_
    mul i
    inc i
    jmp lp

EXIT_:

    INVOKE printf, ADDR output_msg3_format,i 
    
    ret
main endp
end