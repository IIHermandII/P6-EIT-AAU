    /********************************************
    *	DO NOT REMOVE THIS LABLE.		*
    *	@auther	    Emil Leth Høimark	        *
    *	@place	    AAU, Denmark		*	
    *	@EIT	    6, spring semester 2024	*	
    *	@Title	    MAC EXEMPLS	FOR MY AND	*
    ********************************************/

.global _IIR_FILTER_EXECUTE_TEST
_IIR_FILTER_EXECUTE_TEST:
    /************************************************
    *	MAC PART IIR				    *
    *	y_1[n] = x_1[n] - {( sum ak_1 * y_1[n-k] )} *
    *	a_20 * y_20				    *
    ************************************************/
    
    // y_20 buffer setup------------
    mov #0X6FC8, w0 // y_20 Start    REVERSED 0X6FC7
    mov w0, XMODSRT
    mov #0X6FEF, w0 // y_20 End (C6+1 because it is end)
    mov w0, XMODEND
    mov 0X6CB0, w8  // y_20 Point
    // a_20 buffer setup------------
    mov #0X7000, w0 // a_20 Start
    mov w0, YMODSRT
    mov #0X7027, w0 // y_20 End (26+1 because it is end)
    mov w0, YMODEND
    mov #0X7000, w10 // a_20 Point always start at top
    
    clr A  
    clr w4
    clr w5
    REPEAT #20 
	MAC W4*W5,A,[W8]-=2,W4,[W10]+=2,W5  // The two modulo buffers go opsid ways
    clr B, [W8]+=4, W4	    // Updates W8 for IIR-Outputs, And Mic-Inputs 4
    mov w8, 0X6CB0	    // y_20 Point + 2
    mov w8, w2
    
    mov 0X2016, w0	    // ADC Input
    lac w0, #0, B
    sub B // B = B - A
    sac.r B, #0, w1
    mov w1, 0X6CA0
    mov #0X6CA0, w1
    mov [w1], [w8]
    
    // y_180 buffer setup------------
    mov #0X6E48, w0 // y_180 Start 
    mov w0, XMODSRT
    mov #0X6FAF, w0 // y_180 End (46+1 because it is end)
    mov w0, XMODEND
    mov 0X6CB2, w8  // y_180 Point
    
    mov [w2], [w8++]
    mov w8, 0X6CB2
    
    // x_180 buffer setup------------
    mov #0X6CC8, w0 // x_180 Start 
    mov w0, XMODSRT
    mov #0X6E2F, w0 // x_180 End (C8+1 because it is end)
    mov w0, XMODEND
    mov 0X6CB4, w8  // x_180 Point

    mov #0X2016, w0
    mov [w0], [w8++]
    mov w8, 0X6CB4
RETURN
    
.global _BUF_SETUP
_BUF_SETUP:
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
    
    mov #0x6FC6, w0 // Starts at 6 and not 8 do to the do to the first iteration 
    // in the mac, has to start at 8 and not A, because it meves to next and stores
    mov w0, 0X6CB0
    
    mov #0x6E48, w0
    mov w0, 0X6CB2
    
    mov #0X6CC8, w0
    mov w0, 0X6CB4
    
    mov #7030, w0
    mov w0, 0X6CB6
    
RETURN
 
.global _IIR_A_COEFFICIENTS
_IIR_A_COEFFICIENTS:
    /********************************************
    * Sets up filter coefficients		*	
    ********************************************/  
    mov #0xEA84, w0 
    mov w0, 0X7000
    mov #0x0C2A, w0
    mov w0, 0X7002
    mov #0xED15, w0
    mov w0, 0X7004
    mov #0x1391, w0
    mov w0, 0X7006
    mov #0xEE06, w0
    mov w0, 0X7008
    mov #0x1220, w0
    mov w0, 0X700A
    mov #0xEE1C, w0
    mov w0, 0X700C
    mov #0x1598, w0
    mov w0, 0X700E
    mov #0xF347, w0
    mov w0, 0X7010
    mov #0x16DA, w0
    mov w0, 0X7012
    mov #0xEFE5, w0
    mov w0, 0X7014
    mov #0x1376, w0
    mov w0, 0X7016
    mov #0xF3C6, w0
    mov w0, 0X7018
    mov #0x0FEB, w0
    mov w0, 0X701A
    mov #0xECE5, w0
    mov w0, 0X701C
    mov #0x09A0, w0
    mov w0, 0X701E
    mov #0xF105, w0
    mov w0, 0X7020
    mov #0x0857, w0
    mov w0, 0X7022
    mov #0xF3A1, w0
    mov w0, 0X7024
    mov #0x06CD, w0
    mov w0, 0X7026  
RETURN

