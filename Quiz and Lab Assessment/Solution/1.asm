
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


MOV AX, @DATA 

MOV DS, AX

MOV SI, OFFSET ARR1  

MOV DI, OFFSET ARR2 

MOV CX, 0

INPUT: 
MOV AH,1

INT 21H   

CMP AL,13   

JE L1       

MOV [DI],AL     

INC DI        

INC CX        

JMP INPUT


L1:
DEC DI     

PUSH CX      

MOV AH, 2      

MOV DL, 0AH    

INT 21H       

MOV DL, 0DH      

INT 21H

LX:
MOV BL, [DI]  

MOV [SI], BL  

INC SI
DEC DI
LOOP LX

POP CX

MOV SI, OFFSET ARR1 
MOV DI, OFFSET ARR2 

CHECK:
MOV BL, [SI]
MOV BH, [DI]
CMP BL, BH
JNE NOTPAL
INC DI
INC SI
LOOP CHECK

LEA DX, PAL
MOV AH, 9
INT 21H
JMP EXIT

NOTPAL:
LEA DX, NOPAL
MOV AH, 9
INT 21H
JMP EXIT


EXIT:

RET
ARR1 DB 40 DUP('$')  ;REVERSE
ARR2 DB 40 DUP('$')  ;FOR INPUT
PAL DB 'YES$'
NOPAL DB 'NO$'

ret




