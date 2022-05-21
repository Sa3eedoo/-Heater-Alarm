.CODE

MAIN PROC
    
    INCLUDE EMU8086.INC
    
    ;constats
    MOV BH,100
    MOV BL,10
    
    ;to loop on every 3mins
    AGAIN:
    
    PRINT 'Enter Current Temperature: '
    
    ;read first digit
    MOV AH,1
    INT 21H
    
    ;convert ascii to number
    SUB AX,130H
    MUL BH
    PUSH AX
    
    ;read second digit
    MOV AH,1
    INT 21H
    
    ;convert ascii to number
    SUB AX,130H
    MUL BL
    PUSH AX
    
    ;read third digit
    MOV AH,1
    INT 21H
    
    ;convert ascii to number
    SUB AX,130H
    PUSH AX
    
    ;print new line
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    ;calculate temp
    XOR AX,AX
    POP DX
    ADD AX,DX
    POP DX
    ADD AX,DX
    POP DX
    ADD AX,DX
    
    ;logic
    CMP AX,200
    JBE GREEN
    
    CMP AX,500
    JB YELLOW
    
    PRINT 'the red led is on'
    JMP DONE
    
    GREEN:
    PRINT 'the green led is on'
    JMP DONE
    
    YELLOW:
    PRINT 'the yellow led is on'
    
    DONE:
    
    ;print new line
    MOV AH,2
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
    
    ;delay
    MOV CX,4100H
    LOOP $
    
    ;repeat again
    JMP AGAIN
    
    MAIN ENDP
END MAIN