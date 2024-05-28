    /********************************************
    *	DO NOT REMOVE THIS LABLE.		*
    *	@auther	    Emil Leth Høimark	        *
    *	@place	    AAU, Denmark		*	
    *	@EIT	    6, spring semester 2024	*	
    *	@Title	    MAC EXEMPLS	FOR MY AND	*
    *		    MAGNUS GROOP                *
    *	@time	    7h,3m			*
    ********************************************/
    
    
 /************************************
 *  MAC (multiply accumulate) in use *
 ************************************/
 
 // INFO: X-ram 0x0FFE - 0x6FFF
 // INFO: Y-ram 0x7000 - 0xCFFF
 
 
.global _DIVF_TEST // WORKS 
_DIVF_TEST:
    mov #0x03D8, w12
    mov #0x0148, w13
    repeat #5
    divf w13, w12 // devide w13 by w12  w13/w12
    mov w0, 0x1042
RETURN
 
.global _MPY_TEST // WORKS 
_MPY_TEST:
    mov #0x4000, w4
    mov #0x4000, w5
    mpy w4*w5,A // devide w13 by w12  w13/w12
    sac.R A, #0, w0
    mov w0, 0x1042
    nop
    mov #0x1000, w8
    mov #0x1000, w1
    add w8, w1, w8  // Pointer is now ajusted.
RETURN
 
.global _XOR_TEST
_XOR_TEST:
    mov #0x8000, w0	// 10000
    //mov #0x0000, w0	// 00000
    //mov #0x7FFF, w0	// 01111
    mov #0x8000, w1
    xor w0, w1 , w2
    
    clr B
    mov #0x00AA, w4
    mov #0x0044, w5
    lac w5, #0, A
    lac w4, #0, B
    sub B   // B-A -> B
    sac B, #0, w1
    mov w1, 0x1042
    nop
RETURN
 
    
    //FLIM
    //MAX 
    //MIN
    //DISI
    //NORM
    //SAC.R
    
    
    
    //********************SIGNED FRAC************************** FACIT = CORRECTR
.global _MAC_TEST
_MAC_TEST:
    clr A
    mov #0x4000, w4 // moves the value 0x00FF to w4
    mov #0x4000, w5 // moves the value 0x0FFF to w5 
    mac w4*w5, A    // multiply w4 with w5, adds it to a
    
    sac A, #0, w5   // moves value form accumulator A to w5, (bit shift 0 bit)
    mov w5, 0x1042  // the result can be read in X-ram 0x1042
    // >>15  2808
    nop
    
    //*******************UNSIGNED INT************************** FACIT = CORRECTR
    bset CORCON, #0
    bset CORCON, #12
    clr A
    mov #0x4000, w4 // moves the value 0x00FF to w4
    mov #0x4000, w5 // moves the value 0x0FFF to w5 
    mac w4*w5, A    // multiply w4 with w5, adds it to a
    
    sac A, #0, w5   // moves value form accumulator A to w5, (bit shift 0 bit)
    mov w5, 0x1042  // the result can be read in X-ram 0x1042
    //>>15 1404
    nop
    
    //*******************SIGNED INT**************************** FACIT = CORRECTR
    bset CORCON, #0
    bclr CORCON, #12
    clr A
    mov #0x4000, w4 // moves the value 0x00FF to w4
    mov #0x4000, w5 // moves the value 0x0FFF to w5 
    mac w4*w5, A    // multiply w4 with w5, adds it to a
    
    sac A, #0, w5   // moves value form accumulator A to w5, (bit shift 0 bit)
    mov w5, 0x1042  // the result can be read in X-ram 0x1042
    //>>15 1404
    nop
    
      //******************UNSIGNED FRAC************************ FACIT = CORRECTR
    bclr CORCON, #0
    bclr CORCON, #12
    clr A
    mov #0x4000, w4 // moves the value 0x00FF to w4
    mov #0x4000, w5 // moves the value 0x0FFF to w5 
    mac w4*w5, A    // multiply w4 with w5, adds it to a
    
    sac A, #0, w5   // moves value form accumulator A to w5, (bit shift 0 bit)
    mov w5, 0x1042  // the result can be read in X-ram 0x1042
    //>>15 2808
    nop
    
    //********************SIGNED FRAC WITH PREEFETCH*********** FACIT = CORRECTR
    clr A
    mov #0x4000, w11// some value 
    mov w11, 0x1030 // X-ram
    mov w11, 0x7030 // Y-ram
    mov #0x2000, w11
    mov w11, 0x1032 
    mov w11, 0x7032
    mov #0x0200, w11
    mov w11, 0x1034
    mov w11, 0x7034
    mov #0, w4 // moves the value 0x0AFF to w4
    mov #0, w5 // moves the value 0x0FFF to w5 
    mov #0x1030, w8	// moves start adress for pointer to w8 x-ram
    mov #0x7030, w10	// moves start adress for pointer to w10 y-ram
    REPEAT #3     // wery wery important that the 1 is x the other is y
    MAC W4*W5,A,[w8]+=2,W4,[w10]+=2,W5 // --||-- (read example abowe)
    sac A, #0, w5   // moves value form accumulator A to w5, (bit shift 0 bit)
    mov w5, 0x1042  // the result can be read in X-ram 0x1044
    nop
    
RETURN
    
    
 
.global _ALG_TWO_NORM_SQUARED
_ALG_TWO_NORM_SQUARED:
    
    /*
    MAC (multiply accumulate) W register only:
    ---------------------------------------------
    "the idea is to multyply w4, w5 and store the 
    result in accumulator a (acca).
    I then move the result for accumulator a to w5
    the i move w5 to a adress in X-ram so the UART
    can print the value. To change settings use:
    CORCON
    */
    clr A
    mov #0x00FF, w4 // moves the value 0x00FF to w4
    mov #0x0FFF, w5 // moves the value 0x0FFF to w5 
    mac w4*w5, a    // multiply w4 with w5, adds it to a
    sac A, #0, w5   // moves value form accumulator A to w5, (bit shift 0 bit)
    mov w5, 0x1042  // the result can be read in X-ram 0x1042
    
    /*
     MAC (multiply accumulate) 2-norm-squred:
    ---------------------------------------------
    "the idea is to multyply w4, w4 and store the 
    result in accumulator a (acca). Then increment
    the pointer w8, that gets the next data to w4
     
    I then move the result for accumulator a to w5
    the i move w5 to a adress in X-ram so the UART
    can print the value. To change settings use:
    CORCON
    */
    clr A
    mov #0x0001, w11// some value 
    mov w11, 0x1030 // X-ram
    mov #0x0002, w11
    mov w11, 0x1032 
    mov #0x0003, w11
    mov w11, 0x1034 
    mov #0x0004, w11
    mov w11, 0x1036 
    mov #0x0005, w11
    mov w11, 0x1036 
    
    mov #0x0AFF, w4 // moves the value 0x0AFF to w4
    mov #0x0FFF, w5 // moves the value 0x0FFF to w5 
    mov #0x1030, w8 // moves start adress for pointer to w8
    REPEAT #0x2	    // instruction repets 2 times
    MAC W4*W4,A,[W8]+=2,W4 // multyplies W4*W4 store in A, pull W8 to W4, incremet adress of W8 for next run
    
    sac A, #0, w5   // moves value form accumulator A to w5, (bit shift 0 bit)
    mov w5, 0x1044  // the result can be read in X-ram 0x1044
    
    
    /*
     MAC (multiply accumulate) FIR structure:
    ---------------------------------------------
    "the idea is to multyply w4, w5 and store the 
    result in accumulator a (acca). Then increment
    the pointer w8, that gets the next data to w4 in X-Rram IMPORTANT!!!!
    the pointer w10, that gets the next data to w5 in Y-Rram IMPORTANT!!!!
     
    FOR THIS INSTRUCTION TO WORK, YOU MUST! USE BOTH X-RAM AND Y-RAM!
    THIS CRASH THE PROGRAM IF X-X-RAM OR Y-Y-RAM
    ONLY X-Y-RAM IS A WALID OPERAND!
     
    I then move the result for accumulator a to w5
    the i move w5 to a adress in X-ram so the UART
    can print the value. To change settings use:
    CORCON
    */
    clr A
    mov #0x0001, w11// some value 
    mov w11, 0x1030 // X-ram
    mov w11, 0x7030 // Y-ram
    mov #0x0002, w11
    mov w11, 0x1032 
    mov w11, 0x7032
    mov #0x0003, w11
    mov w11, 0x1034
    mov w11, 0x7034
    mov #0x0004, w11
    mov w11, 0x1036
    mov w11, 0x7036
    mov #0x0005, w11
    mov w11, 0x1036
    mov w11, 0x7036
    
    mov #0x0AFF, w4 // moves the value 0x0AFF to w4
    mov #0x0FFF, w5 // moves the value 0x0FFF to w5 
    mov #0x1030, w8	// moves start adress for pointer to w8 x-ram
    mov #0x7030, w10	// moves start adress for pointer to w10 y-ram
    REPEAT #0x2     // wery wery important that the 1 is x the other is y
    MAC W4*W5,A,[w8]+=2,W4,[w10]+=2,W5 // --||-- (read example abowe)
    
    sac A, #0, w5   // moves value form accumulator A to w5, (bit shift 0 bit)
    mov w5, 0x1046  // the result can be read in X-ram 0x1044
RETURN    