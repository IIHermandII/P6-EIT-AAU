    /********************************************
    *	@auther	    Hoimark			*
    *	@place	    AAU, Denmark		*	
    *	@EIT	    6, spring semester 2024	*	
    *	@Title	    DAC				*
    ********************************************/
.global _DAC_TEST
_DAC_TEST:
    mov 0x2022, w0 
    inc w0, w1
    mov w1, 0x2022
    RESET_REGISTER_CHECK: BTSC 0x2022, #14 // if bit 14 set we reset 0x2022
    goto RESET_REGISTER
    
    goto goto_protection_test
	RESET_REGISTER:
	mov #0x0000, w0 
	mov w0, 0x2022 
    goto_protection_test:
RETURN
    
    
.global _DAC_SETUP
_DAC_SETUP:    
    mov #0x7BFF, w0 // 0 = LATx[n] is driven on the PORTx[n] pin
    mov TRISB, w1
    and w0, w1, w2
    mov w2, TRISB
    mov #0xCFFF, w0 // 0 = LATx[n] is driven on the PORTx[n] pin
    mov TRISE, w1
    and w0, w1, w2
    mov w2, TRISE
    clr TRISC	// trisc i can clr 
    clr TRISD	// trisd i can clr 
RETURN
    
    
.global _DAC_SET_OUTPUT
_DAC_SET_OUTPUT:
    .equ B_ADDRESS, 0x1010
    .equ C_ADDRESS, 0x1012
    .equ D_ADDRESS, 0x1014
    .equ E_ADDRESS, 0x1016
    
    // This ordor asures MSB is set first 
    // This asures that LSB is set last 
    
    mov B_ADDRESS, w0
    mov D_ADDRESS, w1
    mov E_ADDRESS, w2
    mov C_ADDRESS, w3
    
    mov w0, PORTB
    mov w1, PORTD
    mov w2, PORTE
    mov w3, PORTC    
RETURN 
    
    
.global _DAC_MAKE_OUTPUT
_DAC_MAKE_OUTPUT:
    /*
    C7	= DAC_PIN_0	    B15 = DAC_PIN_11
    D4	= DAC_PIN_1	    D2	= DAC_PIN_10
    D3	= DAC_PIN_2	    D0	= DAC_PIN_9
    B10 = DAC_PIN_3	    D1	= DAC_PIN_8
    D6	= DAC_PIN_4	    E12 = DAC_PIN_7
    C3	= DAC_PIN_5	    E13 = DAC_PIN_6
    port B  : yxxxxyxxxxxxxxxx	2 bit
    port C  : xxxxxxxxyxxxyxxx	2 bit
    port D  : xxxxxxxxxyxyyyyy	6 bit
    port E  : xxyyxxxxxxxxxxxx	2 bit
    total   : 1111111111110000	12 bit
	      ^          ^       
	     15          4
    */
    
    mov w4, w3	    // Saves w4 in w3, w4 is used in mac
    mov 0x2022, w0  // Outout in signed-fraction
    mov #0x8000, w1
    xor w0, w1, w4  // Output in unsigned-intiger
    
    .equ B_ADDRESS, 0x1010
    .equ C_ADDRESS, 0x1012
    .equ D_ADDRESS, 0x1014
    .equ E_ADDRESS, 0x1016
    
    DAC_PIN_0: btsc w4, #4  // set all registers
    goto DAC_PIN_0_HIGH
    bclr C_ADDRESS, #7
    DAC_PIN_0_END:
    
    DAC_PIN_1: btsc w4, #5
    goto DAC_PIN_1_HIGH
    bclr D_ADDRESS, #4
    DAC_PIN_1_END:
    
    DAC_PIN_2: btsc w4, #6
    goto DAC_PIN_2_HIGH
    bclr D_ADDRESS, #3
    DAC_PIN_2_END:
    
    DAC_PIN_3: btsc w4, #7
    goto DAC_PIN_3_HIGH
    bclr B_ADDRESS, #10
    DAC_PIN_3_END:
    
    DAC_PIN_4: btsc w4, #8
    goto DAC_PIN_4_HIGH
    bclr D_ADDRESS, #6
    DAC_PIN_4_END:
    
    DAC_PIN_5: btsc w4, #9
    goto DAC_PIN_5_HIGH
    bclr C_ADDRESS, #3
    DAC_PIN_5_END:
    
    DAC_PIN_6: btsc w4, #10
    goto DAC_PIN_6_HIGH
    bclr E_ADDRESS, #13
    DAC_PIN_6_END:
    
    DAC_PIN_7: btsc w4, #11
    goto DAC_PIN_7_HIGH
    bclr E_ADDRESS, #12
    DAC_PIN_7_END:
    
    DAC_PIN_8: btsc w4, #12
    goto DAC_PIN_8_HIGH
    bclr D_ADDRESS, #1
    DAC_PIN_8_END:
    
    DAC_PIN_9: btsc w4, #13
    goto DAC_PIN_9_HIGH
    bclr D_ADDRESS, #0
    DAC_PIN_9_END:
    
    DAC_PIN_10: btsc w4, #14
    goto DAC_PIN_10_HIGH
    bclr D_ADDRESS, #2
    DAC_PIN_10_END:
    
    DAC_PIN_11: btsc w4, #15
    goto DAC_PIN_11_HIGH
    bclr B_ADDRESS, #15
    DAC_PIN_11_END:
    
    //OUT PUT WAS HERE
    
    //*****************************************
    goto goto_protection
	DAC_PIN_0_HIGH:
	bset C_ADDRESS, #7
	goto DAC_PIN_0_END
    
	DAC_PIN_1_HIGH:
	bset D_ADDRESS, #4
	goto DAC_PIN_1_END
    
	DAC_PIN_2_HIGH:
	bset D_ADDRESS, #3
	goto DAC_PIN_2_END
    
	DAC_PIN_3_HIGH:
	bset B_ADDRESS, #10
	goto DAC_PIN_3_END
    
	DAC_PIN_4_HIGH:
	bset D_ADDRESS, #6
	goto DAC_PIN_4_END
    
	DAC_PIN_5_HIGH:
	bset C_ADDRESS, #3
	goto DAC_PIN_5_END
    
	DAC_PIN_6_HIGH:
	bset E_ADDRESS, #13
	goto DAC_PIN_6_END
    
	DAC_PIN_7_HIGH:
	bset E_ADDRESS, #12
	goto DAC_PIN_7_END
    
	DAC_PIN_8_HIGH:
	bset D_ADDRESS, #1
	goto DAC_PIN_8_END
    
	DAC_PIN_9_HIGH:
	bset D_ADDRESS, #0
	goto DAC_PIN_9_END
    
	DAC_PIN_10_HIGH:
	bset D_ADDRESS, #2
	goto DAC_PIN_10_END
    
	DAC_PIN_11_HIGH:
	bset B_ADDRESS, #15
	goto DAC_PIN_11_END
    goto_protection:
    //*****************************************
    mov w3, w4
RETURN
    
    