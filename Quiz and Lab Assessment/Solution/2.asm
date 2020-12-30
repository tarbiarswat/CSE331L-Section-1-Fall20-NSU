
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV AL,1   
MOV AH,1
MOV CX,7 
;   
MOV DL,0
MOV SI,0 
MOV SRS[SI],AL 
  
INC SI
MOV SRS[SI],AH
INC SI 

FIB: 
  
PUSH AX   

ADD AH,AL 
MOV DL,AH 
MOV SRS[SI],DL 
INC SI 
POP AX 

MOV AL,AH 
MOV AH,DL 
LOOP FIB 

MOV CX,7H
MOV SI,0 

     ADD: 
     ADD BL,SRS[SI] 
     INC SI
     LOOP ADD

SRS DB 12 DUP(0)  

   END






