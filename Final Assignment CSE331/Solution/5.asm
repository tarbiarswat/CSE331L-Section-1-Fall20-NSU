
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt



DATA SEGMENT

MSG1 DB 10,13,"Enter number :- $"

MSG2 DB 10,13,"Entered Value is Even $"

MSG3 DB 10,13,"Entered Value is Odd $"

DATA ENDS

DISPLAY MACRO MSG

MOV AH,9

LEA DX,MSG

INT 21H

ENDM

CODE SEGMENT

ASSUME CS:CODE,DS:DATA

START:

MOV AX,DATA

MOV DS,AX

DISPLAY MSG1

MOV AH,1

INT 21H

MOV AH,0

CHECK: MOV DL,2

DIV DL

CMP AH,0

JNE ODD

EVEN:

DISPLAY MSG2

JMP DONE

ODD:

DISPLAY MSG3

DONE:

MOV AH,4CH

INT 21H

CODE ENDS

END START





