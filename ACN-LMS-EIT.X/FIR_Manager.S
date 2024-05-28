    /********************************************
    *	DO NOT REMOVE THIS LABLE.		*
    *	@auther	    Emil Leth Høimark	        *
    *	@place	    AAU, Denmark		*	
    *	@EIT	    6, spring semester 2024	*	
    *	@Title	    MAC EXEMPLS	FOR MY AND	*
    ********************************************/
    
.global _FIR_FILTER_EXECUTE_NLMS
_FIR_FILTER_EXECUTE_NLMS:
    //	w(n + 1) = w(n) + µ /(x(n)^2) e(x) x(n)
    /****************************************
    *	CALGULATE THE FILTER CORIFISHENTS   *
    ****************************************/
    
    /****************************************
    *	PREE LOOP CALGULATIONS		    *
    ****************************************/
    mov #0, w4
    mov #0, w5
    
    // DOT PRODUCT/2-NORM-SQURED ||x(n)||^2  
    // CORRECT
    clr A  
    REPEAT #20 // Repeats for all 21 coefficients 
	MAC W4*W4,A,[W8]-=2,W4	// x.x = ||x(n)||^2
    CLR B,[W8]+=2, W4
    sac.r A, #0, w2		// w2 = ||x(n)||^2
    //mov w2, 0x2018
    // LERNING RATE AND ERROR SIGNAL µ*e(x)
    // CORRECT
    mov #0x0CCD, w4		// w4 = µ
    mov 0x2020, w5		// w5 = e(x)
    MPY w4*w5,B
    sac.r B, #0, w3		// w3 = µ*e(x) 
    nop
    // DEVIDE ERROR_LERNINGRATE WITH 2-NORM-SQURED (µ*e(x)) / (||x(n)||^2)
    // CORRECT
    repeat #5			// w0 = µ*e(x) / ||x(n)||^2
	divf w3, w2		// w3/w2 store in w0    
    mov w0, w6			// w5 = µ*e(x) / ||x(n)||^2
    
    /****************************************
    *	LOOP SETUP	    		    *
    ****************************************/
    // Y-RAM BUFFER SETUP
    mov #0X83E2, w0
    mov w0, YMODSRT
    mov #0X8409, w0
    mov w0, YMODEND
    mov #0X83E2, w10
    // OPERATOR SETUP
    mov #0x84D0, w0
    mov [w8], [w0]
    mov 0x84D0, w4
    mov #0x84D2, w0
    mov [w10], [w0]
    mov 0x84D2, w5
    clr A
    clr B
    mov #0x006C, w11	// w11 is counter  #0x006D -> #0x0080 = #20 Times. 0x0080 eazy to check 
    mov #0X84E2, w0
    FIR_LOOP:
	MPY w4*w6,A	// x(n) * (µ*e(x) / ||x(n)||^2) // THIS ALSO MAX SUS
	LAC w5, #0, B	// stores what w1 ( filter coff ) points at
	ADD A		// A = A + B ; w(n)+((µ*e(x) / ||x(n)||^2)*x(n))
	sac.r A, #0, w1	// THIS MAY CAUSE THE ROUNDING thing
	mov w1, 0X84E2
	mov [w0], [w10++]		// must be ++ here to ensure we get the next value pulled down and newer uses what we stand on 
	CLR A, [w8]-=2,w4, [w10],w5	// Preeefetch next irr output, and fir filter coff, and stores the new coff
	CLR B	
	//mov w1, [w12++]
	inc w11, w11
    FIR_LOOP_CHECK: BTSS, w11, #7
	goto FIR_LOOP
    CLR A,[w10]+=2,w5	// Y-Buffer is out 1 out of scope at this point
    CLR A,[w10]-=2,w5	// Yes it tages this 2 instructions to move it bac in place 
    /****************************************************
    *	EXECUTES THE FIR FILTER AND MAKES OUTPUT REDDY	*
    ****************************************************/
    mov #0X14E2, w0 
    mov w0, XMODSRT
    mov #0X1509, w0
    mov w0, XMODEND
    mov #0x0100, w9	// Feeding input in to input buffer
    add w8, w9, w8
    
    mov #0, w4 
    mov #0, w5
    
    clr A  
    REPEAT #20 // Repeats for all 21 coefficients 
	MAC W4*W5,A,[W8]-=2,W4,[W10]+=2,W5	// The two modulo buffers go opsid ways
    CLR B, [w8]+=2,w4, [w10]-=2,w5
    NEG A
    sac.r A, #0, w2
    mov w2, 0x2022
    
    mov #0X73E2, w0
    mov w0, YMODSRT
    mov #0X7409, w0
    mov w0, YMODEND
    mov #0X73E2, w10
    
    mov #0X13E2, w0 
    mov w0, XMODSRT
    mov #0X1409, w0
    mov w0, XMODEND
    mov #0x0100, w9	// Feeding input in to input buffer
    sub w8, w9, w8
    
    clr A
    clr B
    mov #0, w4 // MABAY THEIS NEED TO BE SAVED I DONT KNOW YET
    mov #0, w5
RETURN
