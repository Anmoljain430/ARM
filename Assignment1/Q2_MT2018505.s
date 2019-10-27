     AREA     appcode, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION
		MOV R0,#22		;Moving 1st number into the register R1
		MOV R1,#10		;Moving 2nd number into the register R2
		MOV R2,#54		;Moving 3rd number into the register R3
		MOV  R3, #0x20000000;Address location for storing the large number
		CMP R0,R1		;Comparing 1st and 2nd numbers by subtracting the numbers
		MOVLT R0,R1		;if (value of R0)<(value of R1) then copy R1 value into R0
		CMP R0,R2		;Checking 1st and 3rd numbers by subtracting the numbers
		MOVLT R0,R2		;if (value of R0)<(value of R2) then copy R2 value into R0
		STR R0,[R3]		;Storing the large number into the memory location 
stop    B stop ; stop program
     ENDFUNC
     END 