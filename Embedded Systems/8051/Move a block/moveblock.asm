ORG 50H
DB "Hello World"

COUNT EQU 11

ORG 0000H

MOV DPTR, #50H
MOV R1, #COUNT

MOV A, #30H
ADD A, #COUNT
MOV R0, A

CLR A


LOOP:
	MOV A, R1
	MOVC A, @A + DPTR
	MOV @R0, A
	DEC R0
	DJNZ R1, LOOP

END
