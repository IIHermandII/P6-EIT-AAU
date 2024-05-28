    /********************************************
    *	@auther	    Hoimark			*
    *	@place	    AAU, Denmark		*	
    *	@EIT	    6, spring semester 2024	*	
    *	@Title	    LED1 & LED2			*
    ********************************************/
 .global _LED1_LED2_ON
 _LED1_LED2_ON:
    .equ vall, 3
    clr TRISE	    // Clear TRISE to configure all PORT E pins as outputs
    mov #vall, W1   // moving val to W1 register
    mov W1, PORTE   // moving W1 to PORTE 
RETURN
