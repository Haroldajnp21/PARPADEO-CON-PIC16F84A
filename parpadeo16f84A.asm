;   /\\\\\\\\\
;  /\\\///////\\\
;  \/\\\     \/\\\                                                 /\\\          /\\\
;   \/\\\\\\\\\\\/        /\\\\\     /\\\\\\\\\\     /\\\\\\\\   /\\\\\\\\\\\  /\\\\\\\\\\\  /\\\\\\\\\
;    \/\\\//////\\\      /\\\///\\\  \/\\\//////    /\\\/////\\\ \////\\\////  \////\\\////  \////////\\\
;     \/\\\    \//\\\    /\\\  \//\\\ \/\\\\\\\\\\  /\\\\\\\\\\\     \/\\\         \/\\\        /\\\\\\\\\\
;      \/\\\     \//\\\  \//\\\  /\\\  \////////\\\ \//\\///////      \/\\\ /\\     \/\\\ /\\   /\\\/////\\\
;       \/\\\      \//\\\  \///\\\\\/    /\\\\\\\\\\  \//\\\\\\\\\\    \//\\\\\      \//\\\\\   \//\\\\\\\\/\\
;        \///        \///     \/////     \//////////    \//////////      \/////        \/////     \////////\//
;                                  Let's find out together what makes a PIC Tick!
;
; Code Produced by the Proton BASIC Compiler. Version 3.7.3.6
; Written by Les Johnson. January 2020
;----------------------------------------------------------
;
#define Config_Req 1
 LIST  P = 16F84A, F = INHX8M, W = 2, X = ON, R = DEC, MM = ON, N = 0, C = 255
INDF equ 0X0000
TMR0 equ 0X0001
PCL equ 0X0002
STATUS equ 0X0003
FSR equ 0X0004
PORTA equ 0X0005
PORTB equ 0X0006
EEDATL equ 0X0008
EEDATA equ 0X0008
EEDAT equ 0X0008
EEADR equ 0X0009
PCLATH equ 0X000A
INTCON equ 0X000B
OPTION_REG equ 0X0081
TRISA equ 0X0085
TRISB equ 0X0086
EECON1 equ 0X0088
EECON2 equ 0X0089
; SFR BITS
IRP=7
PP_IRP=7
RP1=6
PP_RP1=6
RP0=5
PP_RP0=5
NOT_TO=4
NOT_PD=3
Z=2
DC=1
C=0
GIE=7
EEIE=6
T0IE=5
INTE=4
RBIE=3
T0IF=2
INTF=1
RBIF=0
NOT_RBPU=7
INTEDG=6
T0CS=5
T0SE=4
PSA=3
PS2=2
PS1=1
PS0=0
EEIF=4
WRERR=3
PP_WRERR=3
WREN=2
PP_WREN=2
WR=1
PP_WR=1
RD=0
PP_RD=0
  __MAXRAM 0XCF
  __BADRAM 0X07, 0X50-0X7F, 0X87
CP_ON equ 0X000F
CP_OFF equ 0X3FFF
PWRTE_ON equ 0X3FF7
PWRTE_OFF equ 0X3FFF
WDT_ON equ 0X3FFF
WDT_OFF equ 0X3FFB
LP_OSC equ 0X3FFC
XT_OSC equ 0X3FFD
HS_OSC equ 0X3FFE
RC_OSC equ 0X3FFF
WDTE_OFF equ 0X0000
WDTE_ON equ 0X0004
FOSC_EXTRC equ 0X0003
FOSC_HS equ 0X0002
FOSC_LP equ 0X0000
FOSC_XT equ 0X0001
#define __16F84A 1
#define Xtal 20
#define _Core 14
#define _MaxRAM 68
#define _Ram_End 0X0044
#define _MaxMem 1024
#define _ADC 0
#define _ADC_Res 0
#define _Eeprom 64
#define _Pages 1
#define _Banks 1
#define RAM_Banks 1
#define _USART 0
#define _USB 0
#define _Flash 0
#define _Cwrite_Block 0
#define Bank0_Start 0X0C
#define Bank0_End 0X4F
#define _System_Variable_Count 4
ram_bank = 0
Current@Page = 0
Dest@Page = 0
#define LCD#Type 0
f@call macro pDest
    call pDest
    endm
f@jump macro pDest
    goto pDest
    endm
set@page macro pDest
    endm
s@b     macro pVarin
if((pVarin & 384) == 0)
if(ram_bank == 1)
    bcf STATUS,PP_RP0
endif
if(ram_bank == 2)
    bcf STATUS,PP_RP1
endif
if(ram_bank == 3)
    bcf STATUS,PP_RP0
    bcf STATUS,PP_RP1
endif
ram_bank = 0
endif
if((pVarin & 384) == 128)
if(ram_bank == 0)
    bsf STATUS,PP_RP0
endif
if(ram_bank == 2)
    bsf STATUS,PP_RP0
    bcf STATUS,PP_RP1
endif
if(ram_bank == 3)
    bcf STATUS,PP_RP1
endif
ram_bank = 1
endif
    endm
r@b     macro
if((ram_bank & 1) != 0)
    bcf STATUS,PP_RP0
endif
ram_bank = 0
    endm
variable Current@Page = 0
variable PDESTINATION@PAGE = 0
FIND@PAGE macro pLabelIn
local CURRENT_ADDR = $
local DEST_ADDR = pLabelIn
if((CURRENT_ADDR >= 0X1800) && (CURRENT_ADDR <= 0X2000))
    Current@Page = 3
endif
if((CURRENT_ADDR >= 0X1000) && (CURRENT_ADDR <= 0X1800))
    Current@Page = 2
endif
if((CURRENT_ADDR >= 0X0800) && (CURRENT_ADDR <= 0X1000))
    Current@Page = 1
endif
if((CURRENT_ADDR >= 0) && (CURRENT_ADDR <= 0X0800))
    Current@Page = 0
endif
if((DEST_ADDR >= 0X1800) && (DEST_ADDR <= 0X2000))
    PDESTINATION@PAGE = 3
endif
if((DEST_ADDR >= 0X1000) && (DEST_ADDR <= 0X1800))
    PDESTINATION@PAGE = 2
endif
if((DEST_ADDR >= 0X0800) && (DEST_ADDR <= 0X1000))
    PDESTINATION@PAGE = 1
endif
if((DEST_ADDR >= 0) && (DEST_ADDR <= 0X0800))
    PDESTINATION@PAGE = 0
endif
    endm
jump macro pLabel
    goto pLabel
    endm
wreg_byte macro pByteOut
    s@b pByteOut
    movwf pByteOut
    r@b
    endm
wreg_bit macro pVarOut,pBitout
    s@b pVarOut
    andlw 1
    btfsc STATUS,2
    bcf pVarOut,pBitout
    btfss STATUS,2
    bsf pVarOut,pBitout
    r@b
    endm
wreg_word macro pWordOut
    s@b pWordOut
    movwf pWordOut
    s@b pWordOut+1
    clrf pWordOut+1
    r@b
    endm
wreg_dword macro pDwordOut
    s@b pDwordOut+3
    clrf pDwordOut+3
    s@b pDwordOut+2
    clrf pDwordOut+2
    s@b pDwordOut+1
    clrf pDwordOut+1
    s@b pDwordOut
    movwf pDwordOut
    r@b
    endm
byte_wreg macro pByteIn
    s@b pByteIn
    movf pByteIn,W
    r@b
    endm
num_SFR macro pNumIn,pSFROut
    s@b pSFROut
    movlw pNumIn
    movwf pSFROut
    endm
num16_SFR macro pNumIn,pSFROut
    s@b pSFROut
    movlw (pNumIn & 255)
    movwf pSFROut
    s@b pSFROut + 1
    movlw ((pNumIn >> 8) & 255)
    movwf pSFROut + 1
    r@b
    endm
num_wreg macro pNumIn
    movlw (pNumIn & 255)
    endm
num_byte macro pNumIn,pByteOut
    s@b pByteOut
if(pNumIn == 0)
    clrf pByteOut
else
    movlw (pNumIn & 255)
    movwf pByteOut
endif
    r@b
    endm
num_bit macro pNumIn,pVarOut,pBitout
    s@b pVarOut
if((pNumIn & 1) == 1)
    bsf pVarOut,pBitout
else
    bcf pVarOut,pBitout
endif
    r@b
    endm
num_word macro pNumIn,pWordOut
if((pNumIn & 255) == 0)
    s@b pWordOut
    clrf pWordOut
else
    s@b pWordOut
    movlw low (pNumIn)
    movwf pWordOut
endif
if(((pNumIn >> 8) & 255) == 0)
    s@b pWordOut+1
    clrf pWordOut+1
else
    s@b pWordOut+1
    movlw high (pNumIn)
    movwf pWordOut+1
endif
    r@b
    endm
num_dword macro pNumIn,pDwordOut
if ((pNumIn >> 24 & 255) == 0)
    s@b pDwordOut+3
    clrf pDwordOut+3
else
    s@b pDwordOut+3
    movlw ((pNumIn >> 24) & 255)
    movwf pDwordOut+3
endif
if( ((pNumIn >> 16) & 255) == 0)
    s@b pDwordOut+2
    clrf pDwordOut+2
else
    s@b pDwordOut+2
    movlw ((pNumIn >> 16) & 255)
    movwf pDwordOut+2
endif
if( ((pNumIn >> 8) & 255) == 0)
    s@b pDwordOut+1
    clrf pDwordOut+1
else
    s@b pDwordOut+1
    movlw high (pNumIn)
    movwf pDwordOut+1
endif
if((pNumIn & 255) == 0)
    s@b pDwordOut
    clrf pDwordOut
else
    s@b pDwordOut
    movlw low (pNumIn)
    movwf pDwordOut
endif
    r@b
    endm
bit_wreg macro pVarin,pBitIn
    s@b pVarin
    clrw
    btfsc pVarin,pBitIn
    movlw 1
    r@b
    endm
bit_byte macro pVarin,pBitIn,pByteOut
    s@b pVarin
    clrw
    btfsc pVarin,pBitIn
    movlw 1
    s@b pByteOut
    movwf pByteOut
    r@b
    endm
bit_bit macro pVarin,pBitIn,pVarOut,pBitout
if((pVarin & 65408) == (pVarOut & 65408))
    s@b pVarOut
    btfsc pVarin,pBitIn
    bsf pVarOut,pBitout
    btfss pVarin,pBitIn
    bcf pVarOut,pBitout
else
    s@b pVarin
    clrdc
    btfsc pVarin,pBitIn
    setdc
    s@b pVarOut
    skpndc
    bsf pVarOut,pBitout
    skpdc
    bcf pVarOut,pBitout
endif
    endm
bit_word macro pVarin,pBitIn,pWordOut
    s@b pWordOut+1
    clrf pWordOut+1
    bit_byte pVarin,pBitIn,pWordOut
    endm
bit_dword macro pVarin,pBitIn,pDwordOut
    s@b pDwordOut+3
    clrf pDwordOut+3
    s@b pDwordOut+2
    clrf pDwordOut+2
    s@b pDwordOut+1
    clrf pDwordOut+1
    bit_byte pVarin,pBitIn,pDwordOut
    endm
word_wreg macro pWordIn
    byte_wreg pWordIn
    endm
word_byte macro pWordIn,pByteOut
    byte_byte pWordIn,pByteOut
    endm
word_bit macro pWordIn,pVarOut,pBitout
    byte_bit pWordIn, pVarOut, pBitout
    endm
word_word macro pWordIn,pWordOut
    s@b pWordIn+1
    movf pWordIn+1,W
    s@b pWordOut+1
    movwf pWordOut+1
    byte_byte pWordIn,pWordOut
    endm
word_dword macro pWordIn,pDwordOut
    s@b pDwordOut+3
    clrf pDwordOut+3
    s@b pDwordOut+2
    clrf pDwordOut+2
    byte_byte pWordIn+1,pDwordOut+1
    byte_byte pWordIn,pDwordOut
    endm
byte_byte macro pByteIn,pByteOut
    s@b pByteIn
    movf pByteIn,W
    s@b pByteOut
    movwf pByteOut
    r@b
    endm
byte_word macro pByteIn,pWordOut
    s@b pWordOut+1
    clrf pWordOut+1
    byte_byte pByteIn,pWordOut
    endm
byte_dword macro pByteIn,pDwordOut
    s@b pDwordOut+3
    clrf pDwordOut+3
    s@b pDwordOut+2
    clrf pDwordOut+2
    s@b pDwordOut+1
    clrf pDwordOut+1
    byte_byte pByteIn,pDwordOut
    endm
    byte_bit macro pByteIn,pVarOut,pBitout
if((pByteIn & 65408) == (pVarOut & 65408))
    s@b pByteIn
    btfsc pByteIn,0
    bsf pVarOut,pBitout
    btfss pByteIn,0
    bcf pVarOut,pBitout
else
    s@b pByteIn
    rrf pByteIn,W
    s@b pVarOut
    skpnc
    bsf pVarOut,pBitout
    skpc
    bcf pVarOut,pBitout
endif
    r@b
    endm
dword_wreg macro pDwordIn
    byte_wreg pDwordIn
    endm
dword_byte macro pDwordIn,pByteOut
    byte_byte pDwordIn,pByteOut
    endm
dword_word macro pDwordIn,pWordOut
    s@b pDwordIn+1
    movf pDwordIn+1,W
    s@b pWordOut+1
    movwf pWordOut+1
    byte_byte pDwordIn,pWordOut
    endm
dword_dword macro pDwordIn,pDwordOut
    byte_byte pDwordIn+3,pDwordOut+3
    byte_byte pDwordIn+2,pDwordOut+2
    byte_byte pDwordIn+1,pDwordOut+1
    byte_byte pDwordIn,pDwordOut
    endm
dword_bit macro pDwordIn,pVarOut,pBitout
    byte_bit pDwordIn,pVarOut,pBitout
    endm
num_float macro pNumIn,pFloatOut
    num_byte pNumIn,pFloatOut+3
    num_byte ((pNumIn >> 8) & 255),pFloatOut+2
    num_byte ((pNumIn >> 16) & 255),pFloatOut+1
    num_byte ((pNumIn >> 24) & 255),pFloatOut
    endm
wreg_float macro pFloatOut
    PAGESEL _UNS_INT08_TOFL32
    call _UNS_INT08_TOFL32
    byte_byte PP_AARG,pFloatOut
    byte_byte PP_AARGH,pFloatOut+1
    byte_byte PP_AARGHH,pFloatOut+2
    byte_byte PP_AARGHHH,pFloatOut+3
    endm
bit_float macro pVarin,pBitIn,pFloatOut
    bit_wreg pVarin,pBitIn
    PAGESEL _UNS_INT08_TOFL32
    call _UNS_INT08_TOFL32
    byte_byte PP_AARG,pFloatOut
    byte_byte PP_AARGH,pFloatOut+1
    byte_byte PP_AARGHH,pFloatOut+2
    byte_byte PP_AARGHHH,pFloatOut+3
    endm
byte_float macro pByteIn,pFloatOut
    byte_wreg pByteIn
    PAGESEL _UNS_INT08_TOFL32
    call _UNS_INT08_TOFL32
    byte_byte PP_AARG,pFloatOut
    byte_byte PP_AARGH,pFloatOut+1
    byte_byte PP_AARGHH,pFloatOut+2
    byte_byte PP_AARGHHH,pFloatOut+3
    endm
word_float macro pWordIn,pFloatOut
    byte_byte pWordIn,PP_AARG
    byte_byte pWordIn+1,PP_AARGH
    PAGESEL _UNS_INT16_TOFL32
    call _UNS_INT16_TOFL32
    byte_byte PP_AARG,pFloatOut
    byte_byte PP_AARGH,pFloatOut+1
    byte_byte PP_AARGHH,pFloatOut+2
    byte_byte PP_AARGHHH,pFloatOut+3
    endm
dword_float macro pDwordIn,pFloatOut
    byte_byte pDwordIn,PP_AARG
    byte_byte pDwordIn+1,PP_AARGH
    byte_byte pDwordIn+2,PP_AARGHH
    byte_byte pDwordIn+3,PP_AARGHHH
    PAGESEL _unsgn_int32_tofl32
    call _unsgn_int32_tofl32
    byte_byte PP_AARG,pFloatOut
    byte_byte PP_AARGH,pFloatOut+1
    byte_byte PP_AARGHH,pFloatOut+2
    byte_byte PP_AARGHHH,pFloatOut+3
    endm
float_float macro pFloatIn,pFloatOut
    byte_byte pFloatIn,pFloatOut
    byte_byte pFloatIn+1,pFloatOut+1
    byte_byte pFloatIn+2,pFloatOut+2
    byte_byte pFloatIn+3,pFloatOut+3
    endm
float_wreg macro pFloatIn
    float_float pFloatIn,PP_AARG
    PAGESEL _FL32_TO_INT32
    call _FL32_TO_INT32
    endm
float_bit macro pFloatIn,pVarOut,pBitout
    float_float pFloatIn,PP_AARG
    PAGESEL _FL32_TO_INT32
    call _FL32_TO_INT32
    wreg_bit pVarOut,pBitout
    endm
float_byte macro pFloatIn,pByteOut
    float_float pFloatIn,PP_AARG
    PAGESEL _FL32_TO_INT32
    call _FL32_TO_INT32
    wreg_byte pByteOut
    endm
float_word macro pFloatIn,pWordOut
    float_float pFloatIn,PP_AARG
    PAGESEL _FL32_TO_INT32
    call _FL32_TO_INT32
    byte_byte PP_AARGHHH,pWordOut
    byte_byte PP_AARGHH,pWordOut+1
    endm
float_dword macro pFloatIn,pDwordOut
    float_float pFloatIn,PP_AARG
    PAGESEL _FL32_TO_INT32
    call _FL32_TO_INT32
    byte_byte PP_AARGHHH,pDwordOut
    byte_byte PP_AARGHH,pDwordOut+1
    byte_byte PP_AARGH,pDwordOut+2
    byte_byte PP_AARG,pDwordOut+3
    endm
num_FSR macro pNumIn
    num_byte pNumIn, FSR
if (((pNumIn >> 8) & 255) == 1)
    bsf STATUS,7
else
    bcf STATUS,7
endif
    endm
label_word macro pLabelIn,pWordOut
    movlw (pLabelIn & 255)
    s@b pWordOut
    movwf pWordOut
    movlw ((pLabelIn >> 8) & 255)
    s@b pWordOut+1
    movwf pWordOut+1
    r@b
    endm
wreg_sword macro pWordOut
    s@b pWordOut
    movwf pWordOut
    movlw 0
    btfsc pWordOut,7
    movlw 255
    s@b pWordOut+1
    movwf pWordOut+1
    r@b
    endm
wreg_sdword macro pDwordOut
    s@b pDwordOut
    movwf pDwordOut
    movlw 0
    btfsc pDwordOut,7
    movlw 255
    s@b pDwordOut+1
    movwf pDwordOut+1
    s@b pDwordOut+2
    movwf pDwordOut+2
    s@b pDwordOut+3
    movwf pDwordOut+3
    r@b
    endm
byte_sword macro pByteIn,pWordOut
    s@b pByteIn
    movf pByteIn,W
    s@b pWordOut
    movwf pWordOut
    movlw 0
    btfsc pWordOut,7
    movlw 255
    s@b pWordOut+1
    movwf pWordOut+1
    r@b
    endm
byte_sdword macro pByteIn,pDwordOut
    s@b pByteIn
    movf pByteIn,W
    s@b pDwordOut
    movwf pDwordOut
    movlw 0
    btfsc pDwordOut,7
    movlw 255
    s@b pDwordOut+1
    movwf pDwordOut+1
    s@b pDwordOut+2
    movwf pDwordOut+2
    s@b pDwordOut+3
    movwf pDwordOut+3
    r@b
    endm
word_sdword macro pWordIn,pDwordOut
    s@b pWordIn
    movf pWordIn,W
    s@b pDwordOut
    movwf pDwordOut
    s@b pWordIn+1
    movf pWordIn+1,W
    s@b pDwordOut+1
    movwf pDwordOut+1
    movlw 0
    btfsc pDwordOut+1,7
    movlw 255
    s@b pDwordOut+2
    movwf pDwordOut+2
    s@b pDwordOut+3
    movwf pDwordOut+3
    r@b
    endm
; COMPILER SYSTEM VARIABLES
PP0 = 0X0C
PP0H = 0X0D
PP1 = 0X0E
PP1H = 0X0F
; CONSTANTS
#define __Xtal 20
proton#code#start
    org 0
    nop
    nop
    nop
    goto proton#main#start
    org 4
__delay_ms_
    clrf PP1H
__delay_ms_w_
    movwf PP1
__delayms_from_regs__
    movlw 255
    addwf PP1,F
    btfss STATUS,0
    addwf PP1H,F
    btfss STATUS,0
    goto __Exit_Library__
    movlw 3
    movwf PP0H
    movlw 230
    call __delay_us_w_
    goto __delayms_from_regs__
__delay_us_
    clrf PP0H
__delay_us_w_
    addlw 252
    movwf PP0
    comf PP0H,F
    btfss STATUS,0
    goto $ + 7
    movlw 255
    nop
    addwf PP0,F
    btfsc STATUS,0
    goto $ - 3
    addwf PP0,F
    nop
    incfsz PP0H,F
    goto $ - 8
    return
__Exit_Library__
i@nt
    bcf STATUS,PP_IRP
    bcf STATUS,PP_RP0
    bcf STATUS,PP_RP1
    return
proton#main#start
    bcf STATUS,PP_RP0
    bcf STATUS,PP_RP1
F1_SOF equ $ ; PARPADEO16F84A.BAS
F1_000022 equ $ ; IN [PARPADEO16F84A.BAS] TRISA=0
    bsf STATUS,5
ram_bank = 1
    clrf TRISA
F1_000023 equ $ ; IN [PARPADEO16F84A.BAS] TRISB=0
    clrf TRISB
F1_000025 equ $ ; IN [PARPADEO16F84A.BAS] PORTB=0
    bcf STATUS,5
ram_bank = 0
    clrf PORTB
Inicio
F1_000028 equ $ ; IN [PARPADEO16F84A.BAS] PORTB.0=0
    bcf PORTB,0
F1_000029 equ $ ; IN [PARPADEO16F84A.BAS] DELAYMS 500
    movlw 0X01
    movwf PP1H
    movlw 0XF4
    call __delay_ms_w_
ram_bank = 0
F1_000030 equ $ ; IN [PARPADEO16F84A.BAS] PORTB.0=1
    bsf PORTB,0
F1_000031 equ $ ; IN [PARPADEO16F84A.BAS] DELAYMS 500
    movlw 0X01
    movwf PP1H
    movlw 0XF4
    call __delay_ms_w_
ram_bank = 0
F1_000032 equ $ ; IN [PARPADEO16F84A.BAS] GOTO INICIO
    goto Inicio
F1_000033 equ $ ; IN [PARPADEO16F84A.BAS] END
_pblb__2
    goto _pblb__2
F1_EOF equ $ ; PARPADEO16F84A.BAS
_pblb__3
    goto _pblb__3
__EOF
__config FOSC_HS&WDTE_OFF&PWRTE_OFF&CP_OFF
    end
