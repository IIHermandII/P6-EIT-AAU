#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/ACN-LMS-EIT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/ACN-LMS-EIT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=main.S LED_Manager.S ADC_Manager.S DAC_Manager.S TIM_Manager.S IIR_Manager.S RAM_Manager.S MAC_Manager.S BTN_Manager.S FIR_Manager.S TST.Manager.S

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/main.o ${OBJECTDIR}/LED_Manager.o ${OBJECTDIR}/ADC_Manager.o ${OBJECTDIR}/DAC_Manager.o ${OBJECTDIR}/TIM_Manager.o ${OBJECTDIR}/IIR_Manager.o ${OBJECTDIR}/RAM_Manager.o ${OBJECTDIR}/MAC_Manager.o ${OBJECTDIR}/BTN_Manager.o ${OBJECTDIR}/FIR_Manager.o ${OBJECTDIR}/TST.Manager.o
POSSIBLE_DEPFILES=${OBJECTDIR}/main.o.d ${OBJECTDIR}/LED_Manager.o.d ${OBJECTDIR}/ADC_Manager.o.d ${OBJECTDIR}/DAC_Manager.o.d ${OBJECTDIR}/TIM_Manager.o.d ${OBJECTDIR}/IIR_Manager.o.d ${OBJECTDIR}/RAM_Manager.o.d ${OBJECTDIR}/MAC_Manager.o.d ${OBJECTDIR}/BTN_Manager.o.d ${OBJECTDIR}/FIR_Manager.o.d ${OBJECTDIR}/TST.Manager.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/main.o ${OBJECTDIR}/LED_Manager.o ${OBJECTDIR}/ADC_Manager.o ${OBJECTDIR}/DAC_Manager.o ${OBJECTDIR}/TIM_Manager.o ${OBJECTDIR}/IIR_Manager.o ${OBJECTDIR}/RAM_Manager.o ${OBJECTDIR}/MAC_Manager.o ${OBJECTDIR}/BTN_Manager.o ${OBJECTDIR}/FIR_Manager.o ${OBJECTDIR}/TST.Manager.o

# Source Files
SOURCEFILES=main.S LED_Manager.S ADC_Manager.S DAC_Manager.S TIM_Manager.S IIR_Manager.S RAM_Manager.S MAC_Manager.S BTN_Manager.S FIR_Manager.S TST.Manager.S



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/ACN-LMS-EIT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=33CH512MP508
MP_LINKER_FILE_OPTION=,--script=p33CH512MP508.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/main.o: main.S  .generated_files/flags/default/2747225526df5627b341d012de4b74efb82ec2e8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  main.S  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"  -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/main.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/LED_Manager.o: LED_Manager.S  .generated_files/flags/default/c7ae9859c6b2e55740468d9c22f2d6ae25c13e10 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LED_Manager.o.d 
	@${RM} ${OBJECTDIR}/LED_Manager.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  LED_Manager.S  -o ${OBJECTDIR}/LED_Manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/LED_Manager.o.d"  -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/LED_Manager.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ADC_Manager.o: ADC_Manager.S  .generated_files/flags/default/693eff8f1cac46c643e21bd1bd99bccf0abb8ac3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC_Manager.o.d 
	@${RM} ${OBJECTDIR}/ADC_Manager.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ADC_Manager.S  -o ${OBJECTDIR}/ADC_Manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ADC_Manager.o.d"  -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/ADC_Manager.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/DAC_Manager.o: DAC_Manager.S  .generated_files/flags/default/c7e316ca47f100114b530f00c528dbc1093d914d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/DAC_Manager.o.d 
	@${RM} ${OBJECTDIR}/DAC_Manager.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  DAC_Manager.S  -o ${OBJECTDIR}/DAC_Manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/DAC_Manager.o.d"  -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/DAC_Manager.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/TIM_Manager.o: TIM_Manager.S  .generated_files/flags/default/87aa1cc56c118aa2df7389a992d2048639836e7e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TIM_Manager.o.d 
	@${RM} ${OBJECTDIR}/TIM_Manager.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  TIM_Manager.S  -o ${OBJECTDIR}/TIM_Manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/TIM_Manager.o.d"  -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/TIM_Manager.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/IIR_Manager.o: IIR_Manager.S  .generated_files/flags/default/ad21fd329daed3b76caf5535dc4ba080b8ddd4f6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/IIR_Manager.o.d 
	@${RM} ${OBJECTDIR}/IIR_Manager.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  IIR_Manager.S  -o ${OBJECTDIR}/IIR_Manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/IIR_Manager.o.d"  -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/IIR_Manager.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/RAM_Manager.o: RAM_Manager.S  .generated_files/flags/default/bdd60d6487a8c900743b5390233fe1f6468138a0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RAM_Manager.o.d 
	@${RM} ${OBJECTDIR}/RAM_Manager.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  RAM_Manager.S  -o ${OBJECTDIR}/RAM_Manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/RAM_Manager.o.d"  -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/RAM_Manager.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/MAC_Manager.o: MAC_Manager.S  .generated_files/flags/default/c59c454c8f0c100e529cb3dd6a52c2cc2e64c2f7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MAC_Manager.o.d 
	@${RM} ${OBJECTDIR}/MAC_Manager.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  MAC_Manager.S  -o ${OBJECTDIR}/MAC_Manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MAC_Manager.o.d"  -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/MAC_Manager.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/BTN_Manager.o: BTN_Manager.S  .generated_files/flags/default/3aae01f0e70f9c4998252e9b03b897d1b9f3259c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/BTN_Manager.o.d 
	@${RM} ${OBJECTDIR}/BTN_Manager.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  BTN_Manager.S  -o ${OBJECTDIR}/BTN_Manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/BTN_Manager.o.d"  -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/BTN_Manager.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FIR_Manager.o: FIR_Manager.S  .generated_files/flags/default/e2878d649e412b9a9932f1417c8be0c12f1ada53 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FIR_Manager.o.d 
	@${RM} ${OBJECTDIR}/FIR_Manager.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  FIR_Manager.S  -o ${OBJECTDIR}/FIR_Manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FIR_Manager.o.d"  -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/FIR_Manager.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/TST.Manager.o: TST.Manager.S  .generated_files/flags/default/716cb338c5030edc03023cf4071dc80da880d604 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TST.Manager.o.d 
	@${RM} ${OBJECTDIR}/TST.Manager.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  TST.Manager.S  -o ${OBJECTDIR}/TST.Manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/TST.Manager.o.d"  -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/TST.Manager.o.asm.d",--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/main.o: main.S  .generated_files/flags/default/58a11df4f35c27877588b2ff577f1791278349f8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  main.S  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/main.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/LED_Manager.o: LED_Manager.S  .generated_files/flags/default/4116d361a4362e43a75721d1fef8d9986347f1a7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LED_Manager.o.d 
	@${RM} ${OBJECTDIR}/LED_Manager.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  LED_Manager.S  -o ${OBJECTDIR}/LED_Manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/LED_Manager.o.d"  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/LED_Manager.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/ADC_Manager.o: ADC_Manager.S  .generated_files/flags/default/7a74112bcf4cfeb503493f6cdf8576c119c17eb9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ADC_Manager.o.d 
	@${RM} ${OBJECTDIR}/ADC_Manager.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ADC_Manager.S  -o ${OBJECTDIR}/ADC_Manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/ADC_Manager.o.d"  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/ADC_Manager.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/DAC_Manager.o: DAC_Manager.S  .generated_files/flags/default/aa8a0b258c047145f62b78c3c1acf2d77c592152 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/DAC_Manager.o.d 
	@${RM} ${OBJECTDIR}/DAC_Manager.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  DAC_Manager.S  -o ${OBJECTDIR}/DAC_Manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/DAC_Manager.o.d"  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/DAC_Manager.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/TIM_Manager.o: TIM_Manager.S  .generated_files/flags/default/c9b6729273a58e3b3347365e016bcc76688ca45b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TIM_Manager.o.d 
	@${RM} ${OBJECTDIR}/TIM_Manager.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  TIM_Manager.S  -o ${OBJECTDIR}/TIM_Manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/TIM_Manager.o.d"  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/TIM_Manager.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/IIR_Manager.o: IIR_Manager.S  .generated_files/flags/default/92650bb7333b6dddd13fe006c4ac66c00f2f5f84 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/IIR_Manager.o.d 
	@${RM} ${OBJECTDIR}/IIR_Manager.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  IIR_Manager.S  -o ${OBJECTDIR}/IIR_Manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/IIR_Manager.o.d"  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/IIR_Manager.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/RAM_Manager.o: RAM_Manager.S  .generated_files/flags/default/643b88c7adb4fa66d7256218d623f38620f5f9c9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RAM_Manager.o.d 
	@${RM} ${OBJECTDIR}/RAM_Manager.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  RAM_Manager.S  -o ${OBJECTDIR}/RAM_Manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/RAM_Manager.o.d"  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/RAM_Manager.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/MAC_Manager.o: MAC_Manager.S  .generated_files/flags/default/2d281adcc53d13f15c6148ba99e5cbf08025cccd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/MAC_Manager.o.d 
	@${RM} ${OBJECTDIR}/MAC_Manager.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  MAC_Manager.S  -o ${OBJECTDIR}/MAC_Manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/MAC_Manager.o.d"  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/MAC_Manager.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/BTN_Manager.o: BTN_Manager.S  .generated_files/flags/default/d8a99addf87331cbdf8e52bd35f940e132d9a41b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/BTN_Manager.o.d 
	@${RM} ${OBJECTDIR}/BTN_Manager.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  BTN_Manager.S  -o ${OBJECTDIR}/BTN_Manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/BTN_Manager.o.d"  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/BTN_Manager.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/FIR_Manager.o: FIR_Manager.S  .generated_files/flags/default/1931a517794ab56078a4e0288a8cd642a4afa656 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/FIR_Manager.o.d 
	@${RM} ${OBJECTDIR}/FIR_Manager.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  FIR_Manager.S  -o ${OBJECTDIR}/FIR_Manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/FIR_Manager.o.d"  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/FIR_Manager.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/TST.Manager.o: TST.Manager.S  .generated_files/flags/default/d629e223bcddfed47b3ff387163891f32fcba461 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TST.Manager.o.d 
	@${RM} ${OBJECTDIR}/TST.Manager.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  TST.Manager.S  -o ${OBJECTDIR}/TST.Manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/TST.Manager.o.d"  -omf=elf -DXPRJ_default=$(CND_CONF)    -Wa,-MD,"${OBJECTDIR}/TST.Manager.o.asm.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)  -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/ACN-LMS-EIT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/ACN-LMS-EIT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)      -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
${DISTDIR}/ACN-LMS-EIT.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o ${DISTDIR}/ACN-LMS-EIT.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,${DISTDIR}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex ${DISTDIR}/ACN-LMS-EIT.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
