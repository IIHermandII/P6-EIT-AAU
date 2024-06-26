    /********************************************
    *	DO NOT REMOVE THIS LABLE.		*
    *	@auther	    Emil Leth Høimark	        *
    *	@place	    AAU, Denmark		*	
    *	@EIT	    6, spring semester 2024	*	
    *	@Title	    MAC EXEMPLS	FOR MY AND	*
    *		    MAGNUS GROOP                *
    ********************************************/
    
.global _BTN_SETUP
_BTN_SETUP:
    // BUTTONS
    bclr ANSELE, #7
    bclr ANSELE, #8
    Bclr ANSELE, #9
    bset CNPUE, #7 // makes pull up on pin 
    bset CNPUE, #8 // makes pull up on pin 
    bset CNPUE, #9 // makes pull up on pin 
    // LEDS
    bclr TRISD, #5  // RED
    bclr TRISD, #7  // GREEN
    bclr TRISB, #14 // BLUE
RETURN
    
.global _BTN_MODE_UPDATE
_BTN_MODE_UPDATE:
    mov PORTE, w0
    BTN_CHECK_MODE_1: BTSS, w0, #7
	goto BTN_MODE_x	// Testing for MODE_1 and MODE_4 (MODE_4 = btn1 & btn2)
    BTN_CHECK_MODE_2: BTSS, w0, #8
	goto BTN_MODE_2	// MODE_2 active
    BTN_CHECK_MODE_3: BTSS, w0, #9
	goto BTN_MODE_3	// MODE_3 active
	
	
    goto MODE_TEST_DONE
    
	BTN_MODE_x:
	    BTN_CHECK_MODE_4: BTSS, w0, #8 
		goto BTN_MODE_4 // MODE_4 (MODE_4 = btn1 & btn2)
	    goto BTN_MODE_1 // MODE_1 active
 
	BTN_MODE_1:
	    mov 0x3000, w0
	    clr w0
	    bset w0, #0
	    mov w0, 0x3000
	goto MODE_TEST_DONE
	
	BTN_MODE_2:
	    mov 0x3000, w0
	    clr w0
	    bset w0, #1
	    mov w0, 0x3000
	goto MODE_TEST_DONE
	    
	BTN_MODE_3:
	    mov 0x3000, w0
	    clr w0
	    bset w0, #2
	    mov w0, 0x3000
	goto MODE_TEST_DONE
	    
	BTN_MODE_4:
	    mov 0x3000, w0
	    clr w0
	    bset w0, #3
	    mov w0, 0x3000
	//*****
	
    MODE_TEST_DONE:
 RETURN