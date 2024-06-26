    /********************************************		
    *	@auther	    Emil Leth Høimark	        *
    *	@place	    AAU, Denmark		*
    *	@EIT	    6, spring semester 2024	*
    *	@Title	    FxNLMS and FIR		* 
    ********************************************/
    
.global _FIR_FILTER_EXECUTE_NLMS
_FIR_FILTER_EXECUTE_NLMS:
    //	w(n + 1) = w(n) + µ /(x(n)^2) e(x) x(n)
    // y_180 buffer setup------------
    mov #0X6E48, w0 // y_180 Start 
    mov w0, XMODSRT
    mov #0X6FAF, w0 // y_180 End (46+1 because it is end)
    mov w0, XMODEND
    mov 0X6CB2, w8  // y_180 Point
    
    mov #0, w4
    mov #0, w5
    clr A  
    REPEAT #180 // Repeats for all 21 coefficients 
	MAC W4*W4,A,[W8]-=2,W4	// x.x = ||x(n)||^2
    sac.r A, #0, w2		// w2 = ||x(n)||^2
    // MATLAB VALIDATED OK
    
    // LERNING RATE AND ERROR SIGNAL µ*e(x)
    mov #0x0CCD, w4		// w4 = µ
    mov 0x2020, w5		// w5 = e(x)
    MPY w4*w5,B
    sac.r B, #0, w3		// w3 = µ*e(x) 
    // DEVIDE ERROR_LERNINGRATE WITH 2-NORM-SQURED (µ*e(x)) / (||x(n)||^2)
    repeat #5			// w0 = µ*e(x) / ||x(n)||^2
	divf w3, w2		// w3/w2 store in w0    
    mov w0, w6			// w5 = µ*e(x) / ||x(n)||^2
    // MATLAB VALIDATED OK 

    mov #0X6E48, w0 // y_180 Start 
    mov w0, XMODSRT
    mov #0X6FAF, w0 // y_180 End (46+1 because it is end)
    mov w0, XMODEND
    mov 0X6CB2, w8  // y_180 Point

    mov #0X7048, w0 // w_180 Start 
    mov w0, YMODSRT
    mov #0X71AF, w0 // w_180 End (46+1 because it is end)
    mov w0, YMODEND
    mov #0X7048, w10  // w_180 Point
    
    
    
    clr A
    clr B
    mov #0X074C, w11	// w11 is counter  #0x0698 -> #0x0800 = #20 Times. 0x0800 eazy to check 
    mov #0X6CA0, w0
    
    mov [w8], [w0]  
    mov 0X6CA0, w4
    mov [w10], [w0]	
    mov 0X6CA0, w5
    nop
    
    FIR_LOOP:
	// getting y_180 coef y_180 = x(n)
	MPY w4*w6,A	// x(n) * (µ*e(x) / ||x(n)||^2)
	LAC w5, #0, B	// stores what w1 ( filter coff ) points at

	ADD A		// A = A + B ; w(n)+((µ*e(x) / ||x(n)||^2)*x(n))
	sac.r A, #0, w1	
	
	mov w1, 0X6CA0
	mov #0X6CA0, w1
	mov [w1], [w10]    // problem we make data in and fetch it again
	
	//CLR A, [w8]-=2,w4, 2=+[w10]+=2,w5	// Preeefetch next irr output, and fir filter coff, and stores the new coff
	CLR A, [w8]-=2,w4
	mov [++w10], [w0]
	mov 0X6CA0, w5
	CLR B	
	inc w11, w11
    FIR_LOOP_CHECK: BTSS, w11, #11
	goto FIR_LOOP
    // MATLAB VALIDATED OK
    /****************************************************
    *	EXECUTES THE FIR FILTER AND MAKES OUTPUT REDDY	*
    ****************************************************/
    mov #0X7048, w0 // w_180 Start 
    mov w0, XMODSRT
    mov #0X71AF, w0 // w_180 End (46+1 because it is end)
    mov w0, XMODEND
    mov #0X7048, w10  // w_180 Point
    
    mov #0X6CC8, w0 // x_180 Start 
    mov w0, XMODSRT
    mov #0X6E2F, w0 // x_180 End (C8+1 because it is end)
    mov w0, XMODEND
    mov 0X6CB4, w8  // x_180 Point
    
    mov #0, w4 
    mov #0, w5
    
    clr A  
    REPEAT #180 // Repeats for all 21 coefficients 
	MAC W4*W5,A,[W8]-=2,W4,[W10]+=2,W5	// The two modulo buffers go opsid ways
    CLR B, [w8]+=2,w4, [w10]-=2,w5
    NEG A   // negates result. 
    sac.r A, #0, w2
    mov w2, 0x2022
    // MATLAB VALIDATED OK 
RETURN