    /********************************************		
    *	@auther	    Emil Leth Høimark	        *
    *	@place	    AAU, Denmark		*
    *	@EIT	    6, spring semester 2024	*
    *	@Title	    Test script 		* 
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