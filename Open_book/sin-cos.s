	THUMB
	  AREA     sinx, CODE, READONLY
      EXPORT __main
      ENTRY 
__main  FUNCTION
	VLDR.F32 S31, =3.14159 ; storing Pi value 
	VLDR.F32 S30, =180 ; 
	VDIV.F32 S29,S31,S30 ; Pi/180

	VLDR.F32 S1,=45 ; angle in degrees
    BL sin  ;anmol added
	BL cos
	B  stop
	
sin     VMUL.F32 S2,S1,S29 ; (pi/180)*angle - given angle is converted to radians 

	    VMUL.F32 S3,S2,S2 ; x*x

	    VLDR.F32 S4,=2 ; to calculate 2*i and ((2*i)+1)

	    VLDR.F32 S5,=1; i value
	    VLDR.F32 S6,=1; increment

	    MOV R0,#10 ; No of terms in a series 

	    MOV R1,#1 ; counting variable i

	    VMOV.F32 S11,S2
	    VMOV.F32 S0,S2 

COUNT   CMP R1,R0		;Compare 'i' and 'n' 
		BLE LOOP		;if i < n goto LOOP
		VMOV.F32 S22,S0
		BX  lr
		;B stop			;else goto stop
			
LOOP    VMUL.F32 S7,S4,S5	; 2*i
		VADD.F32 S8,S7,S6	; (2*i)+1
		VNMUL.F32 S9,S11,S3
		VDIV.F32 S10,S9,S7
		VDIV.F32 S11,S10,S8
		VADD.F32 S0,S0,S11	;Finally add 's' to 't' and store it in 's'
		VADD.F32 S5,S5,S6
		ADD R1,R1,#1		;Increment the counter variable 'i'
		B COUNT				;Again goto comparision
			
;added for cosx
;Every term has to be multiplied by x^2 for next iteration 
cos 	VMUL.F32 S3,S2,S2 ; x*x

		VLDR.F32 S4,=2 ; to calculate 2*i, ((2*i)+1) and ((2*i)-1)

		VLDR.F32 S5,=1; i value
		VLDR.F32 S6,=1; increment

		MOV R0,#10 ; No of terms in a series 

		MOV R1,#1 ; counting variable n (To repeat the loop)

	
		VLDR.F32 S9,=1 ; Cosx  result is stored in s20 register
		VLDR.F32 S15,=1	; Using S15 to store the intermediate result of cosx

COUNT1  CMP R1,R0			;Compare 'i' and 'n' 
		BLE LOOP1			;if i < n goto LOOP
		VMOV.F32 S21,S0
		BX  lr
		;B stop				;else goto stop
			
LOOP1   VMUL.F32 S7,S4,S5	; 2*i
		VADD.F32 S8,S7,S6	; (2*i)+1
		VSUB.F32 S12,S7,S6	; (2*i)-1
		
		;Calculating next term for cosx
		VNMUL.F32 S13,S15,S3; 
		VDIV.F32 S14,S13,S7
		VDIV.F32 S15,S14,S12
		
		;Adding the new term to the previous result 
		
		VADD.F32 S9,S9,S15; (for cosx)
		
		;incrementing i value
		VADD.F32 S5,S5,S6
		
		
		ADD R1,R1,#1		;Increment the counter variable 'i'
		B COUNT1				;Again goto comparision


;added for cosx
stop    B stop
		ENDFUNC
		END 
 

 