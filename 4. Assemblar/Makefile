name=sum_proc
main:
	wine ~/.wine/drive_c/masm32/bin/ml /c /coff /Cp $(name).asm
	wine ~/.wine/drive_c/masm32/bin/link -entry:main /subsystem:console $(name).obj

