    /********************************************
    *	DO NOT REMOVE THIS LABLE.		*
    *	@auther	    Emil Leth Høimark	        *
    *	@place	    AAU, Denmark		*	
    *	@EIT	    6, spring semester 2024	*	
    *	@Title	    MAC EXEMPLS	FOR MY AND	*
    ********************************************/
    
    /*********************************************
    *	FILTER COEFFICIENTS:
    *	[0X73E0 to 0X7408]
    *	FILTER MODULO BUFFER STORAGE:
    *	w8,	w2,	w3,	w4,
    *	0X140A,	0X140C,	0X140E, 
    *	pY	startY	endY	pY2
    * 
    *	OLD OUTPUTS:
    *	[0X13E0 to 0X1408]	
    *	OUTPUT MODULO BUFFER STORAGE:
    *	w10,	w5,	w6,	w7
    *   0X1410,	0X1412, 0X1414, 0X1416
    *	pX	startX	endX	modcon	 
    *********************************************/
 
.global _IIR_FILTER_EXECUTE
_IIR_FILTER_EXECUTE:		
    clr A  
    clr B
    clr w4
    clr w5
    REPEAT #20 // Repeats for all 21 coefficients HERE HERE HERE
	MAC W4*W5,A,[W8]-=2,W4,[W10]+=2,W5	// The two modulo buffers go opsid ways
    mov 0x2022, w0     // adc input, to w0 
    lac w0, #0, B
    //mov #0x1023, w4
    //MPY w4*w5,B
    //lac w0, #0, B
    sub B // B = B - A
    sac.r B, #0, w2
    mov w2, [++w8]  // saves output in output buffer 
    mov w2, 0x2022  // saves output in  0x2024
    nop
RETURN

    // SEAMS TO WORK NOW I CUT'N DO MAPLE
.global _IIR_FILTER_EXECUTE_TEST
_IIR_FILTER_EXECUTE_TEST:
    /****************************
    *	MAC PART IIR		*
    ****************************/
    clr A  
    clr w4
    clr w5
    REPEAT #20 // Repeats for all 21 coefficients HERE HERE HERE
	MAC W4*W5,A,[W8]-=2,W4,[W10]+=2,W5	// The two modulo buffers go opsid ways
    clr B, [W8]+=4, W4, [W10]-=2,W5 // Updates W8 for IIR-Outputs, And Mic-Inputs
    /****************************
    *	ADC INPUT HADLING	*
    ****************************/
    mov 0x2016, w4	// adc input, to w0 
    mov #0x0100, w9	// Feeding input in to input buffer
    add w8, w9, w9
    mov #0x2016, w7
    mov [w7], [w9]
    mov #0x2684, w5
    MPY w4*w5,B
    /****************************
    *	IIR PART CONTINUED	*
    ****************************/
    //lac w4, #0, B
    sub B // B = B - A
    sac.r B, #0, w2
    mov w2, w3
    mov w2, 0x2018
    mov #0x2018, w2
    mov [w2],[w8]
    mov w3, 0x2022  // saves output in  0x2024 // this will not work 
RETURN
    /********************************************
    * Sets up filter coefficients		*	
    * Sets up modulo buffer			*
    ********************************************/   
.global _IIR_FILTER_SETUP
_IIR_FILTER_SETUP:
    // FILTER COEFFICIENTS:
    mov #0xEA84, w0 
    mov w0, 0X73E2
    mov #0x0C2A, w0
    mov w0, 0X73E4
    mov #0xED15, w0
    mov w0, 0X73E6
    mov #0x1391, w0
    mov w0, 0X73E8
    mov #0xEE06, w0
    mov w0, 0X73EA
    mov #0x1220, w0
    mov w0, 0X73EC
    mov #0xEE1C, w0
    mov w0, 0X73EE
    mov #0x1598, w0
    mov w0, 0X73F0
    mov #0xF347, w0
    mov w0, 0X73F2
    mov #0x16DA, w0
    mov w0, 0X73F4
    mov #0xEFE5, w0
    mov w0, 0X73F6
    mov #0x1376, w0
    mov w0, 0X73F8
    mov #0xF3C6, w0
    mov w0, 0X73FA
    mov #0x0FEB, w0
    mov w0, 0X73FC
    mov #0xECE5, w0
    mov w0, 0X73FE
    mov #0x09A0, w0
    mov w0, 0X7400
    mov #0xF105, w0
    mov w0, 0X7402
    mov #0x0857, w0
    mov w0, 0X7404
    mov #0xF3A1, w0
    mov w0, 0X7406
    mov #0x06CD, w0
    mov w0, 0X7408 
    
    // OUTPUT BUFFER: 
    // [0X13E0 to 0X1408]
    mov #0X13E2, w0 
    mov w0, XMODSRT
    mov #0X1409, w0
    mov w0, XMODEND
    mov #0X13E2, w8 // This is in order with FIR
    
    // FILTER OUTPUTS: 
    // [0X73E0 to 0X7408]
    mov #0X73E2, w0
    mov w0, YMODSRT
    mov #0X7409, w0
    mov w0, YMODEND
    mov #0X73E2, w10 // This is in order with FIR
    
    mov #0, w4 // moves the value 0x0AFF to w4
    mov #0, w5
    
    // MODCON
    // 1|1|00|1111|1010|1000
    // X 0n | Y on | U | no revrs | w10 | w8 
    mov #0XCFA8, w0
    mov w0, MODCON
    
    bclr CORCON, #13	// Signed arithmatic
    bclr CORCON, #12
    bclr CORCON, #0	// Fraction arithmatic
    
RETURN
    
