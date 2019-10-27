     AREA     appcode, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION		
    MOV R0,#0	;Moving 0 into the register R0
    MOV R1,#1	;Moving 1 into the register R1
    MOV R3,#50	;Specifying the number upto which the fib series has to be calculated
	MOV R4,#0x20000000	;Base address of the fib series
    MOV R5,#0	;New number of the series will get stored in R5 register  
    ADD R5,R0,R1	;Adding present and previous numbers of the series 
Loop2 	CMP R5,R3	;Checking if present value is less than the required value
    BLE Loop1	;if less goto Loop
    B stop		;Else goto end 
Loop1 STR R5,[R4],#4	;Storing the series of numbers into the memory starting from base address
    MOV R0,R1	;Moving previous value to R0 
    MOV R1,R5	;Moving present value to R1
    ADD R5,R0,R1	;Next value is calculated by adding present and previous values
    B Loop2		;Repeat the loop until R5 value > required value 
stop    B stop 	;stop program
     ENDFUNC
     END 
