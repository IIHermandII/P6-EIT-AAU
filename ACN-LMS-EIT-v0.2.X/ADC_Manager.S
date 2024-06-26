    /********************************************
    *	@auther	    Hoimark			*
    *	@place	    AAU, Denmark		*	
    *	@EIT	    6, spring semester 2024	*	
    *	@Title	    ADC				*
    ********************************************/
    
.global _ADC_SOFTWARE_TRIGGER_ENABLE     
_ADC_SOFTWARE_TRIGGER_ENABLE:
    bset ADCON3L, #6
RETURN 

.global _ADC1_CONVERTION_GET_RESULT_MODE_1_4
_ADC1_CONVERTION_GET_RESULT_MODE_1_4:  
    mov ADCBUF7, w0 // Input on pin B2 moved to 0x2022 
    mov w0, 0x2016 
    mov ADCBUF10, w0 // Error on pin B8 moved to 0x2020
    mov w0, 0x2020
RETURN
    
.global _ADC1_CONVERTION_GET_RESULT_MODE_2 // Input mic only
_ADC1_CONVERTION_GET_RESULT_MODE_2:  
    mov ADCBUF7, w0 // Input mic pin B2 moved to 0x2022 
    mov w0, 0x2022
RETURN
    
    
.global _ADC1_CONVERTION_GET_RESULT_MODE_3 // Error mic only
_ADC1_CONVERTION_GET_RESULT_MODE_3:  
    //mov ADCBUF10, w0 // Error mic pin B8 moved to 0x2022 
    mov ADCBUF0, w0
    mov w0, 0x2022
RETURN
    
    
.global _ADC1_CONVERTION_GET_RESULT // OLD
_ADC1_CONVERTION_GET_RESULT:
    /*
    Where the results will be stored depending on the pin
    ADCBUF0,  A0
    ADCBUF1,  A1
    ADCBUF2,  A2
    ADCBUF3,  A3
    ADCBUF4,  A4
    ADCBUF5,  B0
    ADCBUF6,  B1
    ADCBUF7,  B2    // Input mic
    ADCBUF8,  B3	
    ADCBUF9,  B7
    ADCBUF10, B8    // Error mic
    ADCBUF11, B9
    ADCBUF12, C0
    ADCBUF13, C1
    ADCBUF14, C2
    ADCBUF15, C7
    */
    mov ADCBUF0, w0 // potensumeter
    mov w0, 0x2018
    mov ADCBUF7, w0 // Input on pin B2 moved to 0x2022 
    mov w0, 0x2020 // CHANGED FOR TEST
    mov ADCBUF10, w0 // Error on pin B8 moved to 0x2020
    mov w0, 0x2022 // CHANGED FOR TEST
RETURN
    
.global _ADC_SETUP
_ADC_SETUP:
    mov #0x0000, w0
    mov w0, ADCON1L	//	turns of ADON				
    mov #0x00E0, w1
    mov w1, ADCON1H	//	SHRRES 12-bit resolution; FORM Fractional; 
    mov w0, ADCON2L	//	erly interrubt turned off
    mov #0x0002, w1
    mov w1, ADCON2H	//	Shared ADC Core Sample Time Selection bits
    mov w0, ADCON3L	//	all adc core can be triggert and other trigger stuff
    mov w0, ADCON3H
    mov #0x5555, w1	//	turn on sign on adc
    mov w1, ADMOD0L	//	Channel is single-ended, Channel output data are unsigned
    mov w1, ADMOD0H	//	Channel is single-ended, Channel output data are unsigned
    mov w1, ADMOD1L	//	Channel is single-ended, Channel output data are unsigned
    mov w0, ADIEL	//	Individual and common interrupts are disabled for the corresponding channe
    mov w0, ADIEH	//	Individual and common interrupts are disabled for the corresponding channe
    mov w0, ADSTATL	//	Channel conversion result is not ready
    mov w0, ADSTATH	//	Channel conversion result is not ready
    mov w0, ADCMP0ENL	//	Conversion result for corresponding channel is not used by the comparator
    mov w0, ADCMP1ENL	//	Conversion result for corresponding channel is not used by the comparator
    mov w0, ADCMP2ENL	//	Conversion result for corresponding channel is not used by the comparator
    mov w0, ADCMP3ENL	//	Conversion result for corresponding channel is not used by the comparator
    mov w0, ADCMP0ENH	//	Conversion result for corresponding channel is not used by the comparator
    mov w0, ADCMP1ENH	//	Conversion result for corresponding channel is not used by the comparator
    mov w0, ADCMP2ENH	//	Conversion result for corresponding channel is not used by the comparator
    mov w0, ADCMP3ENH	//	Conversion result for corresponding channel is not used by the comparator  
    mov w0, ADCMP0LO	//	ADC Digital Comparator n Low Threshold Register
    mov w0, ADCMP1LO	//	ADC Digital Comparator n Low Threshold Register
    mov w0, ADCMP2LO	//	ADC Digital Comparator n Low Threshold Register
    mov w0, ADCMP3LO	//	ADC Digital Comparator n Low Threshold Register
    mov w0, ADCMP0HI	//	ADC Digital Comparator n High Threshold Register
    mov w0, ADCMP1HI	//	ADC Digital Comparator n High Threshold Register
    mov w0, ADCMP2HI	//	ADC Digital Comparator n High Threshold Register
    mov w0, ADCMP3HI	//	ADC Digital Comparator n High Threshold Register
    mov w0, ADFL0DAT	//	ADFLnDAT: ADC Oversampling Filter n Result Registe
    mov w0, ADFL1DAT	//	ADFLnDAT: ADC Oversampling Filter n Result Registe
    mov w0, ADFL2DAT	//	ADFLnDAT: ADC Oversampling Filter n Result Registe
    mov w0, ADFL3DAT	//	ADFLnDAT: ADC Oversampling Filter n Result Registe
    mov #0x0400, w1
    mov w1, ADFL0CON	//	ADC Digital Filter n Control Register,  Filter Averaging/Oversampling Ratio (4x) bits 
    mov w1, ADFL1CON	//	ADC Digital Filter n Control Register,  Filter Averaging/Oversampling Ratio (4x) bits 
    mov w1, ADFL2CON	//	ADC Digital Filter n Control Register,  Filter Averaging/Oversampling Ratio (4x) bits 
    mov w1, ADFL3CON	//	ADC Digital Filter n Control Register,  Filter Averaging/Oversampling Ratio (4x) bits
    mov w0, ADCMP0CON	//	ADC Digital Comparator n Control Register
    mov w0, ADCMP1CON	//	ADC Digital Comparator n Control Register
    mov w0, ADCMP2CON	//	ADC Digital Comparator n Control Register
    mov w0, ADCMP3CON	//	ADC Digital Comparator n Control Register
    mov w0, ADLVLTRGL	//	ADC Level-Sensitive Trigger Control Register Low, Input channel trigger is edge-sensitive
    mov w0, ADLVLTRGH	//	ADC Level-Sensitive Trigger Control Register High, Input channel trigger is edge-sensitive
    mov w0, ADEIEL	//	ADC Early Interrupt Enable Register Low, Early interrupt is disabled for the channel
    mov w0, ADEIEH	//	ADC Early Interrupt Enable Register High, Early interrupt is disabled for the channel
    mov w0, ADEISTATL	//	ADC Early Interrupt Status Register Low, Early interrupt was not generated since the last ADCBUFx read
    mov w0, ADEISTATH	//	ADC Early Interrupt Status Register High, Early interrupt was not generated since the last ADCBUFx read
    mov w0, ADCON5H	//	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%[OPS THIS MIGHT BE RONG]
    mov w0, ADCBUF1	//	ADC BUFFER
    mov w0, ADCBUF2	//	ADC BUFFER
    mov w0, ADCBUF3	//	ADC BUFFER
    mov w0, ADCBUF4	//	ADC BUFFER
    mov w0, ADCBUF5	//	ADC BUFFER
    mov w0, ADCBUF6	//	ADC BUFFER
    mov w0, ADCBUF7	//	ADC BUFFER
    mov w0, ADCBUF8	//	ADC BUFFER
    mov w0, ADCBUF9	//	ADC BUFFER
    mov w0, ADCBUF10	//	ADC BUFFER
    mov w0, ADCBUF11	//	ADC BUFFER
    mov w0, ADCBUF12	//	ADC BUFFER  
    mov w0, ADCBUF13	//	ADC BUFFER
    mov w0, ADCBUF14	//	ADC BUFFER
    mov w0, ADCBUF15	//	ADC BUFFER
    mov w0, ADCBUF16	//	ADC BUFFER
    mov w0, ADCBUF17	//	ADC BUFFER
    mov w0, ADCBUF18	//	ADC BUFFER
    mov w0, ADCBUF19	//	ADC BUFFER
    mov w0, ADCBUF20	//	ADC BUFFER
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    mov #0xF0FF, w0	//	ADC Dedicated Core x Power-up Delay bits
    mov ADCON5H, w1	//	1111 = 32768 Source Clock Periods
    and w0, w1, w2
    mov #0x0F00, w0
    ior w0, w2, w1
    mov w1, ADCON5H
    bset ADCON1L, #15	// ADON: ADC Enable bit, ADC module is enabled
			// ADC1 SharedCorePowerEnable
    bset ADCON5L, #7	// SHRPWR = 1
    wait_untill_SHRRDY_is_reddy:
    nop
    SHRRDY_reddy_flag: BTSS ADCON5L, #15    // SHRRDY = 1
	goto wait_untill_SHRRDY_is_reddy
    bset ADCON3H, #7	// SHREN
    //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // Common software trigger odd (bit 8 = 1)
    // Common software trigger even (bit 0 = 1)
    //mov w0, ADTRIG0L	
    bset ADTRIG0L, #0	//   TRGSRC0  on; TRGSRC1  off;	    //POTENSIOMETER
    mov w0, ADTRIG0H	//   TRGSRC2  off; TRGSRC3  off; 
    mov w0, ADTRIG1L	//   TRGSRC4  off; TRGSRC5  off; 
    bset ADTRIG1H, #8	//   TRGSRC6  off; TRGSRC7  on;	    //INPUT PIN
    mov w0, ADTRIG2L	//   TRGSRC8  off; TRGSRC9  off;  
    bset ADTRIG2H, #0	//   TRGSRC10 on;  TRGSRC11 off;    //OUTPUT PIN
    mov w0, ADTRIG3L	//   TRGSRC12 off; TRGSRC13 off; 
    mov w0, ADTRIG3H	//   TRGSRC14 off; TRGSRC15 off; 
    mov w0, ADTRIG4L	//   TRGSRC16 off; TRGSRC17 off; 	
    mov w0, ADTRIG4H	//   TRGSRC18 off; TRGSRC19 off; 
    mov w0, ADTRIG5L	//   TRGSRC20 off; 
    //PULL DOWN
    //bset CNPDB, #2 // makes pulldown on pin B2
    //bset CNPDB, #8 // makes pulldown on pin B8  
RETURN
    