

    .MODEL SMALL
    
    .STACK 100H

    .DATA
      
MSG1    DB  13, 10, "Enter Any HEX digit: $"  
 
MSG2    DB  13, 10, "In Decimal:s: $"         

MSG3    DB  13, 10, "Invalid $"    


.CODE
        
 MAIN PROC 
    
MOV AX, @DATA  
    
MOV DS, AX
    
LEA DX, MSG1

MOV AH, 9

INT 21H
            
MOV AH, 1
INT 21H  
   
MOV BL,AL 
    
CMP BL,9  

JA FirstDigit  
LEA DX, MSG2 

MOV AH, 9
INT 21H  

    
   
    
SecondDigit:
MOV DL, BL 
                  
INT 21H 
    
    
