    /********************************************		
    *	@auther	    Emil Leth Høimark	        *
    *	@place	    AAU, Denmark		*
    *	@EIT	    6, spring semester 2024	*
    *	@Title	    Ram opset			* 
    ********************************************/
    
.global _RAM_Setup
_RAM_Setup:
    mov #0X13E0, w0
    repeat #0x01A8 
    clr	[w0++]
    
    mov #0X7000, w0
    repeat #0x3E8 
    clr	[w0++]
RETURN
    