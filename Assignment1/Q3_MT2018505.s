     AREA     appcode, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION
		MOV R1,#8	;Moving the given number into register R1
		AND R2,R1,#1	;Logical AND operation between the given number and 1 and storing the result in R2 reg
		MOV  R4, #0x20000000;Memory location to store the result
		STR R2,[R4]		;If even, value stored in mem location is 0 else 1
stop    B stop 			;stop program
     ENDFUNC
     END 