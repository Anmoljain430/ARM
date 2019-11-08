     AREA     nestedloop, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION	
; IGNORE THIS PART 	
		MOV  r0, #0x00000002      
		MOV r1 , #0x00000008	
		MOV r2,  #0x00000005;
		
        CMP r0,r1;
		ITE EQ ; if content r1 and r2 are equal then execute the next statement else go to the label loop
        MOVEQ r4 , #1; in case r0 = r1 then move '1' to r4
        BNE loop		
		B stop		;first if then else and then goes into the loop

loop	CMP r1, #3
		ITE LT
		LSLLT r2, #1
		MOVGE r2, #2
				

stop        B stop  ; stop program
        endfunc
      end

  

	   
