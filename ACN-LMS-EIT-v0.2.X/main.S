    /********************************************		
    *	@auther	    Emil Leth Høimark	        *
    *	@place	    AAU, Denmark		*
    *	@EIT	    6, spring semester 2024	*
    *	@Title	    MAIN ASM			*   
    *********************************************
    *	 ---REGISTER RESERVED FOR POGRAM---	*
    *	0x3000		    |	MODE 1 2 3  	*
    *	0x2020		    |	ADC Error	*
    *	0x2022		    |	ADC Input, IIR	*
    *	0x2024		    |	SAMPLE ACCESS	*			    
    *	[0X73E2 to 0X7408]  |	IIR FILTER	*
    *	[0X13E2 to 0X1408]  |	IIR PAST OUTPUTS*
    *	[0X83E2	to 0X8408]  |	FIR W(n) Y-RAM	*
    *	0x1010		    |	BPORT OUTPUT	*
    *	0x1012		    |	CPORT OUTPUT	*
    *	0x1014		    |	DPORT OUTPUT	*
    *	0x1016		    |	EPORT OUTPUT	*
    ********************************************/
	
    // FVI you cant bset/bclr 0x2022 only REGISTER_NAME
    // If you not use .equ as seen in DAC SETUP
    // The LED's get turnd on/off with 8kHz do to DAC no danger thoug.
    
    // SIMULATION DONT WORK WITH 8KHZ!!! BUT IT DOES IN REAL LIFE WE HOPE // 

.global _main   
    _main:    
    /****************
    *	ASM SETUP   *
    ****************/
    //-------- 8 kKz Management --------
	mov #0x0000, w0
	mov w0, 0x2024
	//mov #0x0002, w0
	//mov w0, 0x2020
    //---------   Deadult Mode  --------
	mov #0x0001, w1
	mov w1, 0x3000
    //----------------------------------
    rcall _BTN_SETUP
    rcall _DAC_SETUP
    rcall _ADC_SETUP	// 2022->2016
    rcall _BUF_SETUP
    rcall _TIMER_INTERRUPT_SETUP
    rcall _IIR_A_COEFFICIENTS
    //-----------------TEST SETUP--------------
//    rcall _TST_IMPULS_SET		// TEST #1
//    rcall _TST_FILL_IIR_OUTPUT	// TEST SETUP IIR OUTPUT BUFFER
//    rcall _TST_FILL_FIR_OUTPUT
//    rcall _TST_FILL_MIC_INPUTS
//    rcall _TST_FILL_y_x_w_180
    /****************
    *	MAIN LOOP   *
    ****************/
    loop:
	//-------- 8 kKz Management --------
	PROGRAM_SAMPLE_AXES_DENIED:
	mov 0x2024, w0
	PROGRAM_SAMPLE_AXES: BTSS, w0, #0 // Set in TIM_Manager.S evry 8kHz. 
	    goto PROGRAM_SAMPLE_AXES_DENIED
	mov #0x0000, w0
	mov w0, 0x2024
	//----------------------------------
	rcall _BTN_MODE_UPDATE	    // Sellecting the mode using BTN_Manager.S
	
	mov 0x3000, w0
	CHECK_MODE_1: BTSC, w0, #0
	    goto MODE_1
	CHECK_MODE_2: BTSC, w0, #1
	    goto MODE_2
	CHECK_MODE_3: BTSC, W0, #2
	    goto MODE_3
	CHECK_MODE_4: BTSC, W0, #3
	    goto MODE_4
	    
	    goto BTN_MODE_STAGE
		/********************************
		*   MODE_1: TOTAL ACN FILTER	*
		********************************/
		MODE_1:	
		    bset LATD, #5
		    bclr LATD, #7
		    bclr LATB, #14
		    rcall _ADC_SOFTWARE_TRIGGER_ENABLE 
		    rcall _ADC1_CONVERTION_GET_RESULT_MODE_1_4
		    //------------TEST------------
		    //rcall _TST_ADC1_CONVERTION_GET_RESULT_MODE_1_4
		    //----------------------------
		    rcall _IIR_FILTER_EXECUTE_TEST  // FNK WORKS 1:53:00 AM
		    //rcall _TST_IMPULS_OFF
		    rcall _FIR_FILTER_EXECUTE_NLMS  // FNK WORKS 8:14:53 PM
		goto BTN_MODE_STAGE
		/********************************
		*   MODE_2: OUTPUT OF MIC INPUT	*
		********************************/
		MODE_2:
		    bset LATD, #7
		    bclr LATD, #5
		    bclr LATB, #14
		    rcall _ADC_SOFTWARE_TRIGGER_ENABLE
		    rcall _ADC1_CONVERTION_GET_RESULT_MODE_2
		goto BTN_MODE_STAGE
		/********************************
		*   MODE_3: OUTPUT OF MIC ERROR	*
		********************************/
		MODE_3:
		    bset LATB, #14
		    bclr LATD, #7
		    bclr LATD, #5
		    rcall _ADC_SOFTWARE_TRIGGER_ENABLE
		    rcall _ADC1_CONVERTION_GET_RESULT_MODE_3
		goto BTN_MODE_STAGE
		/********************************
		*   MODE_3: IIR OUTPUT		*
		********************************/
		MODE_4:
		    bset LATD, #5
		    bset LATD, #7
		    bset LATB, #14
		    rcall _ADC1_CONVERTION_GET_RESULT_MODE_1_4
		    rcall _ADC_SOFTWARE_TRIGGER_ENABLE
		    rcall _IIR_FILTER_EXECUTE_TEST
		//**** ************
	    BTN_MODE_STAGE:
    
	rcall _DAC_MAKE_OUTPUT		    // sets 0x2022 on output 
	rcall _DAC_SET_OUTPUT
    goto loop
.end  