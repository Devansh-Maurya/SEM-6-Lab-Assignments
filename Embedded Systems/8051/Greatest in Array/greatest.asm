;THE PROGRAM IS ACTUALLY CALCULATING GREATEST FROM A PAIR
;CHANGE IMPLEMENTATION USING ONLY ONE POINTER

ORG 300H
DB 1, 2, 89, 54, 88;		DATA

ORG 00H
MOV DPTR, #300H

MOV R7, #04;			TOTAL NUMBERS
MOV R0, #00;			COUNTER 1
MOV R1, #01;			COUNTER 2
MOV R2, #00
CLR A
MOVC A, @A + DPTR
MOV R3, A;				GREATEST NUMBER
CLR A

LOOP:
	MOV A, R1
	MOVC A, @A + DPTR
	MOV R2, A;				;FIRST NUMBER
	MOV A, R0
	MOVC A, @A + DPTR;		SECOND NUMBER
	MOV R4, A
	CLR C
	SUBB A, R2				;FIND GREATER
	JC CHANGEGREATEST
	MOV A, R4
	MOV R3, A
L1:
	INC R0
	INC R1
	DJNZ R7, LOOP
	
	MOV P0, R3
	JMP LAST

CHANGEGREATEST:				;GREATEST NUMBER CHANGED
	MOV A, R2
	MOV R3, A
	JMP L1
	
LAST:
	END