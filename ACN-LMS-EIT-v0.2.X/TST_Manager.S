    /********************************************
    *	DO NOT REMOVE THIS LABLE.		*
    *	@auther	    Emil Leth Høimark	        *
    *	@place	    AAU, Denmark		*	
    *	@EIT	    6, spring semester 2024	*	
    *	@Title	    MAC EXEMPLS	FOR MY AND	*
    *		    MAGNUS GROOP                *
    *	@time	    7h,3m			*
    ********************************************/
    
.global _TST_FILL_IIR_OUTPUT
_TST_FILL_IIR_OUTPUT:
    
    mov #0x0390, w1
    mov w1, 0X13E2
    mov #0X13E2, w1
    mov #0X13E2, w0
    repeat #19
	mov [w1], [w0++]
RETURN

.global _TST_ADC1_CONVERTION_GET_RESULT_MODE_1_4
_TST_ADC1_CONVERTION_GET_RESULT_MODE_1_4:
    mov #0x01CB, w0
    mov w0, 0x2016
    mov #0x02F0, w0
    mov w0, 0x2020
RETURN
    
.global _TST_IMPULS_SET
_TST_IMPULS_SET:
    mov #0x7FFF, w0
    mov w0, 0x2016
RETURN

.global _TST_IMPULS_OFF
_TST_IMPULS_OFF:
    mov #0x0000, w0
    mov w0, 0x2016
RETURN

.global _TST_FILL_FIR_OUTPUT
_TST_FILL_FIR_OUTPUT:
    mov #0x0370, w1
    mov w1, 0X83E2
    mov #0X83E2, w1
    mov #0X83E2, w0
    repeat #19
	mov [w1], [w0++]
RETURN

.global _TST_FILL_MIC_INPUTS
_TST_FILL_MIC_INPUTS:
     mov #0x0380, w1
    mov w1, 0X14E2
    mov #0X14E2, w1
    mov #0X14E2, w0
    repeat #19
	mov [w1], [w0++]
RETURN

.global _TST_FILL_y_x_w_180
_TST_FILL_y_x_w_180:
    //---------- y_180
    mov #0x028f, w1
    mov w1, 0X6E48
    mov #0X6E48, w1
    mov #0X6E48, w0
    repeat #179
	mov [w1], [w0++]
    //--------- x_180
    mov #0x03d7, w1
    mov w1, 0X6CC8
    mov #0X6CC8, w1
    mov #0X6CC8, w0
    repeat #179
	mov [w1], [w0++]
    //--------- w_180
    mov #0x051f, w1
    mov w1, 0X7048
    mov #0X7048, w1
    mov #0X7048, w0
    repeat #179
	mov [w1], [w0++]
RETURN