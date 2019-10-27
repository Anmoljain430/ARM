     AREA     appcode, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION
		MOV R1,#2		;Moving 1st number into the register R0
		MOV R2,#5		;Moving 2nd number into the register R1		
GCD    	CMP R1,R2		;Comparing both the numbers
		SUBGT R1,R1,R2	;if (value of R1)> (value of R2) then perform R1-R2 
		SUBLT R2,R2,R1	;if (value of R1)< (value of R2) then perform R2-R1 
		BNE    GCD		;if values of R1 and R2 not equal then repeat the loop
stop    B stop ; stop program
     ENDFUNC
     END 