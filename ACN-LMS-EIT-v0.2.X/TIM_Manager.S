    /********************************************		
    *	@auther	    Emil Leth Høimark	        *
    *	@place	    AAU, Denmark		*
    *	@EIT	    6, spring semester 2024	*
    *	@Title	    TIMER1 AND INTERRUPT	*
    *	@time					*
    ********************************************/
    .include "xc.inc"
       .text
      /*
    Note: The compiler requires only one leading underscore before any of the interrupt handler names. The assembler requires two leading underscores 
    before any of the interrupt handler names. The compiler format is shown in tables in the following sections.
    */

.global __T1Interrupt
__T1Interrupt:
    PUSH RCOUNT
    bclr IFS0, #1   // clrs interrupt flag
    clr TMR1	    // clrs buffer 
    mov #0x0001, w0
    mov w0, 0x2024
    POP RCOUNT
RETFIE
    
    // Timer1 MPLAB® XC16 ISR Name: _T1Interrupt 
    // Timer1 IVT(interrupt vetcor table) address 0x000016
    // RETFIE return form interrubt
    
    
.global _TIMER_INTERRUPT_SETUP
_TIMER_INTERRUPT_SETUP: 	
    clr T1CON	    // turns off timer1
    clr TMR1	    // clr the buffer of timer1
    mov #0x0300, w0 // 8MHz clock	    
    mov w0, T1CON
    //-------------TEST---------------
    //mov #0xF3E7, w0
    //--------------------------------
    //mov #0x03E7, w0	// 4kHz
    mov #0x01E3, w0	// 8kHz
    //mov #0x012C, w0	// GOOD FOR MUCIK
    mov w0, PR1	 
    
    bclr IFS0, #1	    // cleans interrubt flag of timer1
    bset IEC0, #1	    // enables interrubt in timer 1
    bset IPC0, #6	    // T1IP<2:0>: Timer1 Interrupt Priority bits in the IPCx Interrupt register
    bset IPC0, #5	    // prio 6
    bset INTCON2, #15	    // Global Interrupt Enable bit
    
    bset T1CON, #15	    // turns on timer 1
RETURN
    
.global _TIM_TEST   // set high low evry 8kHz
_TIM_TEST:
    bclr TRISD, #0
    mov 0x2018, w0
    TIM_TEST_SET: BTSS, w0, #0
	goto TIM_TEST_BIT_SET
    goto TIM_TEST_BIT_OFF
	
    goto GOTO_PROTECTION
    
	TIM_TEST_BIT_SET:
	    mov #0x0001, w0
	    mov w0, PORTD
	    mov w0, 0x2018
	goto GOTO_PROTECTION
	
	TIM_TEST_BIT_OFF:
	    mov #0x0000, w0
	    mov w0, PORTD
	    mov w0, 0x2018
	goto GOTO_PROTECTION
    
    GOTO_PROTECTION:
RETURN