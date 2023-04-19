
; PICBASIC PRO(TM) Compiler 3.0.7.1, (c) 1998, 2013 microEngineering Labs, Inc. All Rights Reserved. 
MPASMWIN_USED			EQU	1

#define	PBP_PATH	C:\PROGRAM FILES (X86)\PBP3\




        NOLIST
    ifdef PM_USED
        LIST
        "Error: PM does not support this device.  Use MPASM."
        NOLIST
    else
        LIST
        LIST p = 18F4550, r = dec, w = -311, w = -230, f = inhx32
        INCLUDE "P18F4550.INC"	; MPASM  Header
        NOLIST
    endif
        LIST
EEPROM_START	EQU	0F00000h
BLOCK_SIZE	EQU	32


PBP_HARDWAREDEF  macro
  endm


    CONFIG  PLLDIV = 5            ; Divide by 5 (20 MHz oscillator input)
    CONFIG  CPUDIV = OSC1_PLL2	  ;[Primary Oscillator Src: /1][96 MHz PLL Src: /2]
    CONFIG  USBDIV = 2            ; USB clock source comes from the 96 MHz PLL divided by 2
    CONFIG  FOSC = ECPLLIO_EC	  ; EC oscillator, PLL enabled, port function on RA6 (ECPIO)
    CONFIG  FCMEN = OFF           ; Fail-Safe Clock Monitor disabled
    CONFIG  IESO = OFF            ; Oscillator Switchover mode disabled
    CONFIG  PWRT = OFF            ; PWRT disabled
    CONFIG  BOR = ON              ; Brown-out Reset enabled in hardware only (SBOREN is disabled)
    CONFIG  VREGEN = ON           ; USB voltage regulator enabled
    CONFIG  WDT = ON              ; WDT enabled
    CONFIG  WDTPS = 512           ; 1:512
    CONFIG  PBADEN = OFF          ; PORTB<4:0> pins are configured as digital I/O on Reset
    CONFIG  LPT1OSC = OFF         ; Timer1 configured for higher power operation
    CONFIG  MCLRE = OFF	          ; RE3 input pin enabled; MCLR pin disabled
    CONFIG  STVREN = ON           ; Stack full/underflow will cause Reset
    CONFIG  LVP = OFF             ; Single-Supply ICSP disabled
    CONFIG  ICPRT = ON            ; ICPORT enabled
    CONFIG  CP0 = OFF             ; Block 0 (000800-001FFFh) is not code-protected
    CONFIG  CP1 = OFF             ; Block 1 (002000-003FFFh) is not code-protected
    CONFIG  CP2 = OFF             ; Block 2 (004000-005FFFh) is not code-protected
    CONFIG  CP3 = OFF             ; Block 3 (006000-007FFFh) is not code-protected
    



; Define statements.
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00040	DEFINE OSC 48
#define		OSC		 48
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00042	Define ADC_BITS     10  ' Set number of bits in result
#define		ADC_BITS		     10  
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00043	Define ADC_CLOCK     3  ' Set clock source (3=rc)
#define		ADC_CLOCK		     3  
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00044	Define ADC_SAMPLEUS 50  ' Set sampling time in uS
#define		ADC_SAMPLEUS		 50  
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00047	DEFINE HSER_RCSTA 90h 
#define		HSER_RCSTA		 90h 
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00050	DEFINE HSER_TXSTA 24h 
#define		HSER_TXSTA		 24h 
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00053	DEFINE HSER_BAUD 115200
#define		HSER_BAUD		 115200

RAM_START       		EQU	00000h
RAM_END         		EQU	007FFh
RAM_BANKS       		EQU	00008h
BANK0_START     		EQU	00060h
BANK0_END       		EQU	000FFh
BANK1_START     		EQU	00100h
BANK1_END       		EQU	001FFh
BANK2_START     		EQU	00200h
BANK2_END       		EQU	002FFh
BANK3_START     		EQU	00300h
BANK3_END       		EQU	003FFh
BANK4_START     		EQU	00400h
BANK4_END       		EQU	004FFh
BANK5_START     		EQU	00500h
BANK5_END       		EQU	005FFh
BANK6_START     		EQU	00600h
BANK6_END       		EQU	006FFh
BANK7_START     		EQU	00700h
BANK7_END       		EQU	007FFh
BANKA_START     		EQU	00000h
BANKA_END       		EQU	0005Fh

; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00028	A00000	FLAGS   VAR     BYTE BANKA SYSTEM       ' Static flags
FLAGS           		EQU	RAM_START + 000h
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00027	A00001	GOP     VAR     BYTE BANKA SYSTEM       ' Gen Op Parameter
GOP             		EQU	RAM_START + 001h
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00012	A00002	R0      VAR     WORD BANKA SYSTEM       ' System Register
R0              		EQU	RAM_START + 002h
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00013	A00004	R1      VAR     WORD BANKA SYSTEM       ' System Register
R1              		EQU	RAM_START + 004h
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00014	A00006	R2      VAR     WORD BANKA SYSTEM       ' System Register
R2              		EQU	RAM_START + 006h
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00015	A00008	R3      VAR     WORD BANKA SYSTEM       ' System Register
R3              		EQU	RAM_START + 008h
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00016	A0000A	R4      VAR     WORD BANKA SYSTEM       ' System Register
R4              		EQU	RAM_START + 00Ah
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00017	A0000C	R5      VAR     WORD BANKA SYSTEM       ' System Register
R5              		EQU	RAM_START + 00Ch
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00018	A0000E	R6      VAR     WORD BANKA SYSTEM       ' System Register
R6              		EQU	RAM_START + 00Eh
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00019	A00010	R7      VAR     WORD BANKA SYSTEM       ' System Register
R7              		EQU	RAM_START + 010h
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00020	A00012	R8      VAR     WORD BANKA SYSTEM       ' System Register
R8              		EQU	RAM_START + 012h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00001	A00014	'****************************************************************
T1              		EQU	RAM_START + 014h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00001	A00016	'****************************************************************
T2              		EQU	RAM_START + 016h
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00023	A00018	RM1     VAR     BYTE BANKA SYSTEM       ' Pin 1 Mask
RM1             		EQU	RAM_START + 018h
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00026	A00019	RM2     VAR     BYTE BANKA SYSTEM       ' Pin 2 Mask
RM2             		EQU	RAM_START + 019h
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00021	A0001A	RR1     VAR     BYTE BANKA SYSTEM       ' Pin 1 Register
RR1             		EQU	RAM_START + 01Ah
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00024	A0001B	RR2     VAR     BYTE BANKA SYSTEM       ' Pin 2 Register
RR2             		EQU	RAM_START + 01Bh
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00022	A0001C	RS1     VAR     BYTE BANKA SYSTEM       ' Pin 1 Bank
RS1             		EQU	RAM_START + 01Ch
; C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.RAM	00025	A0001D	RS2     VAR     BYTE BANKA SYSTEM       ' Pin 2 Bank
RS2             		EQU	RAM_START + 01Dh
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00001	A0001E	'****************************************************************
PB01            		EQU	RAM_START + 01Eh
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00061	A00060	AllFlags        var byte        $60     ;Flags.0 = USB out 
_AllFlags        		EQU	RAM_START + 060h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00062	A00061	FunctionKeys    var byte        $61     ;IO Input State
_FunctionKeys    		EQU	RAM_START + 061h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00063	A00062	P1Keys          var word        $62     ;IO Input State
_P1Keys          		EQU	RAM_START + 062h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00064	A00064	P2Keys          var word        $64     ;IO Input State
_P2Keys          		EQU	RAM_START + 064h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00065	A00066	FKeytemp        var byte        $66     ;IO Input State Temp
_FKeytemp        		EQU	RAM_START + 066h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00066	A00067	F1Keys          var word        $67     ;IO Input State Temp
_F1Keys          		EQU	RAM_START + 067h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00067	A00069	F2Keys          var word        $69     ;IO Input State Temp
_F2Keys          		EQU	RAM_START + 069h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00068	A0006B	OUTPUTS0        var byte        $6B
_OUTPUTS0        		EQU	RAM_START + 06Bh
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00069	A0006C	OUTPUTS1        var byte        $6C
_OUTPUTS1        		EQU	RAM_START + 06Ch
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00070	A0006D	OUTPUTS2        var byte        $6D
_OUTPUTS2        		EQU	RAM_START + 06Dh
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00072	A0006E	ANINPUT         VAR WORD        $6E     ;IO Analog Input State
_ANINPUT         		EQU	RAM_START + 06Eh
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00073	A00070	ANALOG0         var WORD        $70     ;IO Analog Input State
_ANALOG0         		EQU	RAM_START + 070h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00074	A00072	ANALOG1         var WORD        $72     ;IO Analog Input State
_ANALOG1         		EQU	RAM_START + 072h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00075	A00074	ANALOG2         var WORD        $74     ;IO Analog Input State
_ANALOG2         		EQU	RAM_START + 074h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00076	A00076	ANALOG3         var WORD        $76     ;IO Analog Input State
_ANALOG3         		EQU	RAM_START + 076h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00077	A00078	ANALOG4         var WORD        $78     ;IO Analog Input State
_ANALOG4         		EQU	RAM_START + 078h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00078	A0007A	ANALOG5         var WORD        $7A     ;IO Analog Input State
_ANALOG5         		EQU	RAM_START + 07Ah
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00079	A0007C	ANALOG6         var WORD        $7C     ;IO Analog Input State
_ANALOG6         		EQU	RAM_START + 07Ch
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00080	A0007E	ANALOG7         var WORD        $7E     ;IO Analog Input State
_ANALOG7         		EQU	RAM_START + 07Eh
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00081	A00080	ANTemp0         var word        $80     ;IO Analog Input State Temp
_ANTemp0         		EQU	RAM_START + 080h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00082	A00082	ANTemp1         var word        $82     ;IO Analog Input State Temp
_ANTemp1         		EQU	RAM_START + 082h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00083	A00084	ANTemp2         var word        $84     ;IO Analog Input State Temp
_ANTemp2         		EQU	RAM_START + 084h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00084	A00086	ANTemp3         var word        $86     ;IO Analog Input State Temp
_ANTemp3         		EQU	RAM_START + 086h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00085	A00088	ANTemp4         var word        $88     ;IO Analog Input State Temp
_ANTemp4         		EQU	RAM_START + 088h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00086	A0008A	ANTemp5         var word        $8A     ;IO Analog Input State Temp
_ANTemp5         		EQU	RAM_START + 08Ah
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00087	A0008C	ANTemp6         var word        $8C     ;IO Analog Input State Temp
_ANTemp6         		EQU	RAM_START + 08Ch
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00088	A0008E	ANTemp7         var word        $8E     ;IO Analog Input State Temp
_ANTemp7         		EQU	RAM_START + 08Eh
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00089	A00090	USBBuffer       Var Byte[10]    $90
_USBBuffer       		EQU	RAM_START + 090h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00090	A0009B	USBBufferCount  Var Byte        $9B
_USBBufferCount  		EQU	RAM_START + 09Bh
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00091	A0009C	IDTX            var byte        $9C
_IDTX            		EQU	RAM_START + 09Ch
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00092	A0009D	Temp            var byte        $9D
_Temp            		EQU	RAM_START + 09Dh
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00093	A0009E	CHUTES0         var byte        $9E
_CHUTES0         		EQU	RAM_START + 09Eh
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00094	A0009F	CHUTES1         var byte        $9F
_CHUTES1         		EQU	RAM_START + 09Fh
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00095	A000A0	VConfig         var byte        $A0     ;commcounter,Autocounter,coinSlot1,coinSlot2,counter Enable 
_VConfig         		EQU	RAM_START + 0A0h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00096	A000A1	TRIGGER1        var byte        $A1
_TRIGGER1        		EQU	RAM_START + 0A1h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00097	A000A2	TRIGGER2        var byte        $A2
_TRIGGER2        		EQU	RAM_START + 0A2h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00098	A000A3	TIMER1          var byte        $A3
_TIMER1          		EQU	RAM_START + 0A3h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00099	A000A4	TIMER2          var byte        $A4
_TIMER2          		EQU	RAM_START + 0A4h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00100	A000A5	MEDIAK          var byte        $A5
_MEDIAK          		EQU	RAM_START + 0A5h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00101	A000A6	TMEDIAK         var byte        $A6
_TMEDIAK         		EQU	RAM_START + 0A6h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00102	A000A7	i               var byte        $A7
_i               		EQU	RAM_START + 0A7h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00103	A000A8	x               var byte        $A8
_x               		EQU	RAM_START + 0A8h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00104	A000A9	y               var byte        $A9
_y               		EQU	RAM_START + 0A9h
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00105	A000AA	epTX            var byte        $AA
_epTX            		EQU	RAM_START + 0AAh
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00106	A000AB	POV1            var byte        $AB
_POV1            		EQU	RAM_START + 0ABh
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00107	A000AC	POV2            var byte        $AC
_POV2            		EQU	RAM_START + 0ACh
; C:\TEMP\DCLFI32V1.0\DES_FIRMAC01.BAS	00005	A00400	USBReservedMemory Var Byte[USBMEMORYSIZE] USBMEMORYADDRESS	' Reserve memory used by USB assembler code
_USBReservedMemory		EQU	RAM_START + 00400h
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00305	PORTL   VAR     PORTB
_PORTL           		EQU	 PORTB
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00306	PORTH   VAR     PORTC
_PORTH           		EQU	 PORTC
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00307	TRISL   VAR     TRISB
_TRISL           		EQU	 TRISB
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00308	TRISH   VAR     TRISC
_TRISH           		EQU	 TRISC
_ANALOG1??LOWBYTE		EQU	_ANALOG1
_ANALOG1??HIGHBYTE		EQU	_ANALOG1 + 001h
_ANALOG5??LOWBYTE		EQU	_ANALOG5
_ANALOG5??HIGHBYTE		EQU	_ANALOG5 + 001h
_ANALOG7??LOWBYTE		EQU	_ANALOG7
_ANALOG7??HIGHBYTE		EQU	_ANALOG7 + 001h
_ANALOG3??LOWBYTE		EQU	_ANALOG3
_ANALOG3??HIGHBYTE		EQU	_ANALOG3 + 001h
_ANALOG6??LOWBYTE		EQU	_ANALOG6
_ANALOG6??HIGHBYTE		EQU	_ANALOG6 + 001h
_ANALOG0??LOWBYTE		EQU	_ANALOG0
_ANALOG0??HIGHBYTE		EQU	_ANALOG0 + 001h
_ANALOG2??LOWBYTE		EQU	_ANALOG2
_ANALOG2??HIGHBYTE		EQU	_ANALOG2 + 001h
_ANALOG4??LOWBYTE		EQU	_ANALOG4
_ANALOG4??HIGHBYTE		EQU	_ANALOG4 + 001h
#define _COUNTS1         	 PB01, 000h
#define _COUNTS2         	 PB01, 001h
#define _PORTA??6        	 PORTA, 006h
#define _LATC??0         	 LATC, 000h
#define _VConfig??1      	_VConfig, 001h
#define _OUTPUTS2??6     	_OUTPUTS2, 006h
#define _VConfig??2      	_VConfig, 002h
#define _OUTPUTS2??7     	_OUTPUTS2, 007h
#define _AllFlags??1     	_AllFlags, 001h
#define _AllFlags??2     	_AllFlags, 002h
#define _AllFlags??0     	_AllFlags, 000h
#define _Temp??0         	_Temp, 000h
#define _FunctionKeys??0 	_FunctionKeys, 000h
#define _Temp??1         	_Temp, 001h
#define _FunctionKeys??3 	_FunctionKeys, 003h
#define _Temp??2         	_Temp, 002h
#define _P1Keys??0       	_P1Keys, 000h
#define _Temp??3         	_Temp, 003h
#define _P1Keys??5       	_P1Keys, 005h
#define _Temp??4         	_Temp, 004h
#define _P1Keys??6       	_P1Keys, 006h
#define _Temp??5         	_Temp, 005h
#define _P1Keys??7       	_P1Keys, 007h
#define _Temp??6         	_Temp, 006h
#define _P1Keys??8       	_P1Keys + 001h, 000h
#define _Temp??7         	_Temp, 007h
#define _P1Keys??9       	_P1Keys + 001h, 001h
#define _P1Keys??10      	_P1Keys + 001h, 002h
#define _P1Keys??1       	_P1Keys, 001h
#define _P1Keys??2       	_P1Keys, 002h
#define _P1Keys??3       	_P1Keys, 003h
#define _P1Keys??4       	_P1Keys, 004h
#define _FunctionKeys??1 	_FunctionKeys, 001h
#define _FunctionKeys??2 	_FunctionKeys, 002h
#define _FunctionKeys??4 	_FunctionKeys, 004h
#define _P2Keys??0       	_P2Keys, 000h
#define _P2Keys??5       	_P2Keys, 005h
#define _P2Keys??6       	_P2Keys, 006h
#define _P2Keys??7       	_P2Keys, 007h
#define _P2Keys??8       	_P2Keys + 001h, 000h
#define _P2Keys??9       	_P2Keys + 001h, 001h
#define _P2Keys??10      	_P2Keys + 001h, 002h
#define _P2Keys??1       	_P2Keys, 001h
#define _P2Keys??2       	_P2Keys, 002h
#define _P2Keys??3       	_P2Keys, 003h
#define _P2Keys??4       	_P2Keys, 004h
#define _AllFlags??3     	_AllFlags, 003h
#define _MEDIAK??0       	_MEDIAK, 000h
#define _PORTA??5        	 PORTA, 005h
#define _MEDIAK??1       	_MEDIAK, 001h
#define _MEDIAK??2       	_MEDIAK, 002h
#define _MEDIAK??3       	_MEDIAK, 003h
#define _MEDIAK??4       	_MEDIAK, 004h
#define _MEDIAK??5       	_MEDIAK, 005h
#define _MEDIAK??6       	_MEDIAK, 006h
#define _MEDIAK??7       	_MEDIAK, 007h
#define _PORTD??4        	 PORTD, 004h
#define _PORTD??5        	 PORTD, 005h
#define _PORTD??6        	 PORTD, 006h
#define _PORTD??7        	 PORTD, 007h
#define _PORTB??0        	 PORTB, 000h
#define _PORTB??1        	 PORTB, 001h
#define _PORTB??2        	 PORTB, 002h
#define _PORTB??3        	 PORTB, 003h
#define _PORTB??4        	 PORTB, 004h
#define _PORTB??5        	 PORTB, 005h
#define _PORTB??6        	 PORTB, 006h
#define _PORTB??7        	 PORTB, 007h
#define _PORTE??2        	 PORTE, 002h
#define _PORTE??1        	 PORTE, 001h
#define _PORTE??0        	 PORTE, 000h
#define _LATA??4         	 LATA, 004h
#define _POV1??0         	_POV1, 000h
#define _POV1??1         	_POV1, 001h
#define _POV1??2         	_POV1, 002h
#define _POV1??3         	_POV1, 003h
#define _POV2??0         	_POV2, 000h
#define _POV2??1         	_POV2, 001h
#define _POV2??2         	_POV2, 002h
#define _POV2??3         	_POV2, 003h
#define _VConfig??3      	_VConfig, 003h
#define _VConfig??0      	_VConfig, 000h
#define _VConfig??4      	_VConfig, 004h
#define _FKeytemp??0     	_FKeytemp, 000h
#define _FKeytemp??3     	_FKeytemp, 003h
#define _FKeytemp??1     	_FKeytemp, 001h
#define _FKeytemp??2     	_FKeytemp, 002h
#define _FKeytemp??4     	_FKeytemp, 004h
#define _LATA??2         	 LATA, 002h
#define _LATA??3         	 LATA, 003h
#define _OUTPUTS2??4     	_OUTPUTS2, 004h
#define _OUTPUTS2??5     	_OUTPUTS2, 005h
#define _LATD??0         	 LATD, 000h
#define _LATD??1         	 LATD, 001h
#define _PORTD??3        	 PORTD, 003h
#define _PORTD??1        	 PORTD, 001h
#define _LATD??2         	 LATD, 002h

; Constants.
_USBMEMORYADDRESS		EQU	00400h
_USBMEMORYSIZE   		EQU	00100h
_USBBufferSizeMax		EQU	00008h
_USBBufferSizeTX 		EQU	0000Bh
_USBMediaTX      		EQU	00003h
_USBkeyTX        		EQU	00008h
_USBBufferSizeRX 		EQU	00008h

; EEPROM data.


	INCLUDE	"FIRMAC01.MAC"
	INCLUDE	"C:\PROGRAM FILES (X86)\PBP3\PBPPIC18.LIB"


; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00036	#HEADER
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00062	#CONFIG
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00286	BANKA   $0000, $005F
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00287	BANK0   $0060, $00FF
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00288	BANK1   $0100, $01FF
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00289	BANK2   $0200, $02FF
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00290	BANK3   $0300, $03FF
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00291	BANK4   $0400, $04FF
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00292	BANK5   $0500, $05FF
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00293	BANK6   $0600, $06FF
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00294	BANK7   $0700, $07FF
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00300	    INCLUDE "PBPPI18L.RAM"
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00301	#ELSE
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00302	    LIBRARY  "PBPPIC18"

; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00303	    INCLUDE "PBPPIC18.RAM"
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00304	#ENDIF
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00309	USBMEMORYADDRESS Con	$400	' USB RAM starts here
; C:\PROGRAM FILES (X86)\PBP3\DEVICES\PIC18F4550.PBPINC	00313	#HEADER
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00011	#CONFIG

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00038	Include "DES_FirmAC01.bas"
; C:\TEMP\DCLFI32V1.0\DES_FIRMAC01.BAS	00004	USBMEMORYSIZE	Con	256	' USB RAM size in bytes

; C:\TEMP\DCLFI32V1.0\DES_FIRMAC01.BAS	00007	goto	hid_desc_end	' Skip over all of the USB assembler code
	GOTO?L	_hid_desc_end

; C:\TEMP\DCLFI32V1.0\DES_FIRMAC01.BAS	00008	asm

	ASM?


#define	USB_EP0_BUFF_SIZE 	8	; 8, 16, 32, or 64
#define	USB_MAX_NUM_INT		2	; For tracking Alternate Setting
#define	USB_MAX_EP_NUMBER  	2	; UEP1
#define	NUM_CONFIGURATIONS	1
#define	NUM_INTERFACES		2

#define UCFG_VAL	USB_PULLUP_ENABLE|USB_INTERNAL_TRANSCEIVER|USB_FULL_SPEED|USB_PING_PONG__NO_PING_PONG
;#define UCFG_VAL	USB_PULLUP_ENABLE|USB_INTERNAL_TRANSCEIVER|USB_LOW_SPEED|USB_PING_PONG__NO_PING_PONG

;#define USE_SELF_POWER_SENSE_IO
;#define USE_USB_BUS_SENSE_IO

#define USB_POLLING

; HID
; Endpoints Allocation
#define	HID_INTF_ID		  0x00
#define	HID_EP			  1
#define	HID_INT_OUT_EP_SIZE	  16
#define	HID_INT_IN_EP_SIZE	  16

#define HID_DEV_INTF_ID       0x01
#define HID_DEV_EP            2
#define HID_DEV_INT_OUT_EP_SIZE   16
#define HID_DEV_INT_IN_EP_SIZE    16

#define HID_NUM_OF_DSC        1

   include	"usb_hid.asm"	; Include rest of USB files, starting with HID class code

; ******************************************************************
; This table is polled by the host immediately after USB Reset has been released.
; This table defines the maximum packet size EP0 can take.
; See section 9.6.1 of the Rev 1.0 USB specification.
; These fields are application DEPENDENT. Modify these to meet
; your specifications.
; ******************************************************************
DeviceDescriptor
	retlw	(EndDeviceDescriptor-DeviceDescriptor)/2	; bLength Length of this descriptor
	retlw	USB_DESCRIPTOR_DEVICE ; bDescType This is a DEVICE descriptor
	retlw	0x00		; bcdUSBUSB Revision 1.10 (low byte)
	retlw	0x02		; high byte
	retlw	0x00		; bDeviceClass zero means each interface operates independently
	retlw	0x00		; bDeviceSubClass
	retlw	0x00		; bDeviceProtocol
	retlw	USB_EP0_BUFF_SIZE ; bMaxPacketSize for EP0

        ; idVendor (low byte, high byte)
	retlw	0x32
	retlw	0x15

        ; idProduct (low byte, high byte)
	retlw	0x07
	retlw	0x10

    retlw	0x00          ; bcdDevice (low byte)
	retlw	0x01         ; (high byte)
	retlw	0x01         ; iManufacturer (string index)
	retlw	0x02         ; iProduct      (string index) 
	retlw	0x03         ; iSerialNumber (string index)
	retlw	NUM_CONFIGURATIONS ; bNumConfigurations
EndDeviceDescriptor

; ******************************************************************
; This table is retrieved by the host after the address has been set.
; This table defines the configurations available for the device.
; See section 9.6.2 of the Rev 1.0 USB specification (page 184).
; These fields are application DEPENDENT. 
; Modify these to meet your specifications.
; ******************************************************************
; Configuration pointer table
USB_CD_Ptr
Configs
	db	low Config1, high Config1
	db	upper Config1, 0

; Configuration Descriptor
Config1
	retlw	(Interface1-Config1)/2	; bLength Length of this descriptor
	retlw	USB_DESCRIPTOR_CONFIGURATION ; bDescType 2=CONFIGURATION
Config1Len
	retlw	low ((EndConfig1 - Config1)/2)	; Length of this configuration
	retlw	high ((EndConfig1 - Config1)/2)
	retlw	NUM_INTERFACES		; bNumInterfaces Number of interfaces
	retlw	0x01		; bConfigValue Configuration Value
	retlw	0x00		; iConfig (string index)
	retlw	_DEFAULT|_SELF	; bmAttributes attributes - bus powered  
	retlw	0x32     ; Max power consumption (2X mA)
Interface1
	retlw	(HIDDescriptor1-Interface1)/2	; length of descriptor
	retlw	USB_DESCRIPTOR_INTERFACE
	retlw	0x00		; number of interface, 0 based array
	retlw	0x00		; alternate setting
	retlw	0x01		; number of endpoints used in this interface
	retlw	0x03		; interface class - assigned by the USB
	retlw	0x00		; boot device
	retlw	0x00		; interface protocol
	retlw 	0x02		; index to string descriptor that describes this interface
HIDDescriptor1
	retlw	(Endpoint1In-HIDDescriptor1)/2	; descriptor size (9 bytes)
    retlw	DSC_HID		; descriptor type (HID)
	retlw	0x11		; HID class release number (1.11)
	retlw	0x01
    retlw	0x00		; Localized country code (none)
    retlw	0x01		; # of HID class descriptor to follow (1)
    retlw	0x22		; Report descriptor type (HID)
ReportDescriptor1Len
	retlw	low ((EndReportDescriptor1-ReportDescriptor1)/2)
	retlw	high ((EndReportDescriptor1-ReportDescriptor1)/2)
Endpoint1In
	retlw	(Interface2-Endpoint1In)/2	; length of descriptor
	retlw	USB_DESCRIPTOR_ENDPOINT
	retlw	HID_EP|_EP_IN		; EP1, In
	retlw	_INT		; Interrupt
	retlw	low (HID_INT_IN_EP_SIZE)		; This should be the size of the endpoint buffer
	retlw	high (HID_INT_IN_EP_SIZE)
	retlw	0x01                        ; Polling interval
;EndPoint1Out
;	retlw	(Interface2-EndPoint1Out)/2	; Length of this Endpoint Descriptor
;	retlw	USB_DESCRIPTOR_ENDPOINT		; bDescriptorType = 5 for Endpoint Descriptor
;	retlw	HID_EP|_EP_OUT		; Endpoint number & direction
;	retlw	_INT		; Transfer type supported by this Endpoint
;	retlw	low (HID_INT_OUT_EP_SIZE)		; This should be the size of the endpoint buffer
;	retlw	high (HID_INT_OUT_EP_SIZE)
;	retlw	0x01                        ; Polling interval
Interface2
    retlw   (HIDDescriptor2-Interface2)/2   ; length of descriptor
    retlw   USB_DESCRIPTOR_INTERFACE        ; INTERFACE descriptor type
    retlw   0x01        ; number of interface, 0 based array
    retlw   0x00        ; alternate setting
    retlw   0x02        ; number of endpoints used in this interface
    retlw   0x03        ; interface class - assigned by the USB
    retlw   0x00        ; boot device
    retlw   0x00        ; interface protocol
    retlw   0x04        ; index to string descriptor that describes this interface
HIDDescriptor2
    retlw   (Endpoint2In-HIDDescriptor2)/2  ; descriptor size (9 bytes)
    retlw   DSC_HID     ; descriptor type (HID)
    retlw   0x11        ; HID class release number (1.11)
    retlw   0x01
    retlw   0x00        ; Localized country code (none)
    retlw   0x01        ; # of HID class descriptor to follow (1)
    retlw   0x22        ; Report descriptor type (HID)
ReportDescriptor2Len
    retlw   low ((EndReportDescriptor2-ReportDescriptor2)/2)
    retlw   high ((EndReportDescriptor2-ReportDescriptor2)/2)
Endpoint2In
    retlw   (EndPoint2Out-Endpoint2In)/2    ; length of descriptor
    retlw   USB_DESCRIPTOR_ENDPOINT
    retlw   HID_DEV_EP|_EP02_IN       ; EP2, In
    retlw   _INT        ; Interrupt
    retlw   low (HID_DEV_INT_IN_EP_SIZE)        ; This should be the size of the endpoint buffer
    retlw   high (HID_DEV_INT_IN_EP_SIZE)
    retlw   0x01                        ; Polling interval
EndPoint2Out
    retlw   (EndConfig1-EndPoint2Out)/2 ; Length of this Endpoint Descriptor
    retlw   USB_DESCRIPTOR_ENDPOINT     ; bDescriptorType = 5 for Endpoint Descriptor
    retlw   HID_DEV_EP|_EP02_OUT      ; Endpoint number & direction
    retlw   _INT        ; Transfer type supported by this Endpoint
    retlw   low (HID_DEV_INT_OUT_EP_SIZE)       ; This should be the size of the endpoint buffer
    retlw   high (HID_DEV_INT_OUT_EP_SIZE)
    retlw   0x01                        ; Polling interval
EndConfig1

ReportDescriptor1
    retlw   0x05 ; USAGE_PAGE (generic desktop Choose the usage page "mouse" is on      
    retlw   0x01 ; LOW
    
    retlw   0x09 ; USAGE Device is a Gamepad        
    retlw   0x05 ; LOW
    
    retlw   0xA1 ; COLLECTION (APPLICATION)     
    retlw   0x01 ; LOW
    
    retlw   0x85 ; REPORT_ID (1 Pad1)
    retlw   0x01 ; LOW
    
    retlw   0xA1 ; Colection Physycal       
    retlw   0x00 ; LOW
    
    retlw   0x09 ; usage x      
    retlw   0x30 ;
    
    retlw   0x09 ; usage y      
    retlw   0x31 ;
        
    retlw   0x15 ; logical minimun 0
    retlw   0x00 ;
    
    retlw   0x26 ; logical maximun -1
    retlw   0xFF ;
    retlw   0xFF ;
    
    retlw   0x35 ; Physical Minimum (0)
    retlw   0x00 ;
    
    retlw   0x46 ; Physical Maximum (-1)
    retlw   0xFF ;
    retlw   0xFF ;
    
    retlw   0x95 ; REPORT_COUNT 2       
    retlw   0x02 ;
    
    retlw   0x75 ; report size 16       
    retlw   0x10 ;
    
    retlw   0x81 ; Input (Data,Var,Abs,NWrp,Lin,Pref,NNul,Bit)   
    retlw   0x02 ;
    
    retlw   0xC0 ; END_COLLECTION
;******************************************
    
    retlw   0xA1 ; Colection Physycal       
    retlw   0x00 ; LOW
    
    retlw   0x09 ; usage Rx     
    retlw   0x33 ;
    
    retlw   0x09 ; usage Ry     
    retlw   0x34 ;
        
    retlw   0x15 ; logical minimun 0
    retlw   0x00 ;
    
    retlw   0x26 ; logical maximun (-1)
    retlw   0xFF ;
    retlw   0xFF ;
    
    retlw   0x35 ; Physical Minimum (0)
    retlw   0x00 ;
    
    retlw   0x46 ; Physical Maximum (-1)
    retlw   0xFF ;
    retlw   0xFF ;
    
    retlw   0x95 ; REPORT_COUNT 2       
    retlw   0x02 ;
    
    retlw   0x75 ; report size 16       
    retlw   0x10 ;
    
    retlw   0x81 ; Input (Data,Var,Abs,NWrp,Lin,Pref,NNul,Bit)   
    retlw   0x02 ;
    
    retlw   0xC0 ; END_COLLECTION
;******************************************

    retlw   0x05 ; USAGE_PAGE (Button)      
    retlw   0x09 ; low
    
    retlw   0x19 ; Usage Minimum (Button 1)
    retlw   0x01 ;
    
    retlw   0x29 ; Usage Maximum (Button 9)
    retlw   0x09 ;
    
    retlw   0x95 ; report count 9      
    retlw   0x09 ;
    
    retlw   0x75 ; report size 1        
    retlw   0x01 ;
    
    retlw   0x81 ; Input (Data,Var,Abs,NWrp,Lin,Pref,NNul,Bit)     
    retlw   0x02 ;
    
    retlw   0x05 ; Usage Page (Generic Desktop)
    retlw   0x01 ;
    
    retlw   0x09 ; Usage (Hat Switch)
    retlw   0x39 ;
    
    retlw   0x15 ;  Logical Minimum (1)
    retlw   0x01 ;
    
    retlw   0x25 ; Logical Maximum (8)
    retlw   0x08 ;
    
    retlw   0x35 ; Physical Minimum (0)
    retlw   0x00 ;
    
    retlw   0x46 ; Physical Maximum (4155)
    retlw   0x3B ;
    retlw   0x10 ;
    
    retlw   0x66 ; Unit (None)
    retlw   0x0E ;
    retlw   0x00 ;
    
    retlw   0x75 ; report size 4
    retlw   0x04 ;
    
    retlw   0x95 ; report count 1
    retlw   0x01 ;
    
    retlw   0x81 ; Input (Data,Var,Abs,NWrp,Lin,Pref,Null,Bit)
    retlw   0x42 ; LOW
    
    retlw   0x75 ; report size 3
    retlw   0x03 ;
    
    retlw   0x95 ; report count 1
    retlw   0x01 ;
    
    retlw   0x81 ; (Cnst,Var,Abs,NWrp,Lin,Pref,NNul,Bit)
    retlw   0x03 ; LOW
    
    retlw   0xC0 ; END_COLLECTION

;***********************************************************************
;*                       GamePAD 2                                     *
;***********************************************************************

    retlw   0x05 ; USAGE_PAGE (generic desktop Choose the usage page "mouse" is on      
    retlw   0x01 ; LOW
    
    retlw   0x09 ; USAGE Device is a Gamepad        
    retlw   0x05 ; LOW
    
    retlw   0xA1 ; COLLECTION (APPLICATION)     
    retlw   0x01 ; LOW
    
    retlw   0x85 ; REPORT_ID (2 Pad2)
    retlw   0x02 ; LOW
    
    retlw   0xA1 ; Colection Physycal       
    retlw   0x00 ; LOW
    
    retlw   0x09 ; usage x      
    retlw   0x30 ;
    
    retlw   0x09 ; usage y      
    retlw   0x31 ;
        
    retlw   0x15 ; logical minimun 0
    retlw   0x00 ;
    
    retlw   0x26 ; logical maximun -1
    retlw   0xFF ;
    retlw   0xFF ;
    
    retlw   0x35 ; Physical Minimum (0)
    retlw   0x00 ;
    
    retlw   0x46 ; Physical Maximum (-1)
    retlw   0xFF ;
    retlw   0xFF ;
    
    retlw   0x95 ; REPORT_COUNT 2       
    retlw   0x02 ;
    
    retlw   0x75 ; report size 16       
    retlw   0x10 ;
    
    retlw   0x81 ; Input (Data,Var,Abs,NWrp,Lin,Pref,NNul,Bit)   
    retlw   0x02 ;
    
    retlw   0xC0 ; END_COLLECTION
;******************************************
    
    retlw   0xA1 ; Colection Physycal       
    retlw   0x00 ; LOW
    
    retlw   0x09 ; usage Rx     
    retlw   0x33 ;
    
    retlw   0x09 ; usage Ry     
    retlw   0x34 ;
        
    retlw   0x15 ; logical minimun 0
    retlw   0x00 ;
    
    retlw   0x26 ; logical maximun (-1)
    retlw   0xFF ;
    retlw   0xFF ;
    
    retlw   0x35 ; Physical Minimum (0)
    retlw   0x00 ;
    
    retlw   0x46 ; Physical Maximum (-1)
    retlw   0xFF ;
    retlw   0xFF ;
    
    retlw   0x95 ; REPORT_COUNT 2       
    retlw   0x02 ;
    
    retlw   0x75 ; report size 16       
    retlw   0x10 ;
    
    retlw   0x81 ; Input (Data,Var,Abs,NWrp,Lin,Pref,NNul,Bit)   
    retlw   0x02 ;
    
    retlw   0xC0 ; END_COLLECTION
;******************************************

    retlw   0x05 ; USAGE_PAGE (Button)      
    retlw   0x09 ; low
    
    retlw   0x19 ; Usage Minimum (Button 1)
    retlw   0x01 ;
    
    retlw   0x29 ; Usage Maximum (Button 10)
    retlw   0x0A ;
    
    retlw   0x95 ; report count 10      
    retlw   0x0A ;
    
    retlw   0x75 ; report size 1        
    retlw   0x01 ;
    
    retlw   0x81 ; Input (Data,Var,Abs,NWrp,Lin,Pref,NNul,Bit)     
    retlw   0x02 ;
    
    retlw   0x05 ; Usage Page (Generic Desktop)
    retlw   0x01 ;
    
    retlw   0x09 ; Usage (Hat Switch)
    retlw   0x39 ;
    
    retlw   0x15 ;  Logical Minimum (1)
    retlw   0x01 ;
    
    retlw   0x25 ; Logical Maximum (8)
    retlw   0x08 ;
    
    retlw   0x35 ; Physical Minimum (0)
    retlw   0x00 ;
    
    retlw   0x46 ; Physical Maximum (4155)
    retlw   0x3B ;
    retlw   0x10 ;
    
    retlw   0x66 ; Unit (None)
    retlw   0x0E ;
    retlw   0x00 ;
    
    retlw   0x75 ; report size 4
    retlw   0x04 ;
    
    retlw   0x95 ; report count 1
    retlw   0x01 ;
    
    retlw   0x81 ; Input (Data,Var,Abs,NWrp,Lin,Pref,Null,Bit)
    retlw   0x42 ; LOW
    
    retlw   0x75 ; report size 2
    retlw   0x02 ;
    
    retlw   0x95 ; report count 1
    retlw   0x01 ;
    
    retlw   0x81 ; (Cnst,Var,Abs,NWrp,Lin,Pref,NNul,Bit)
    retlw   0x03 ; LOW
        
    retlw   0xC0 ; END_COLLECTION

EndReportDescriptor1

ReportDescriptor2

;***************************************
;*            Keyboard Emu             *
;***************************************
    retlw   0x05 ; USAGE_PAGE (generic desktop)     
    retlw   0x01 ; LOW
    
    retlw   0x09 ; USAGE Key        
    retlw   0x06 ; LOW
    
    retlw   0xA1 ; COLLECTION (APPLICATION)     
    retlw   0x01 ; LOW
    
    retlw   0x85 ; REPORT_ID (1)
    retlw   0x01 ; LOW
    
    retlw   0x05 ; USAGE_PAGE (kbrd/keypad)     
    retlw   0x07 ; LOW
    
    retlw   0x75 ; report size 1
    retlw   0x01 ;
    
    retlw   0x95 ; report count 8
    retlw   0x08 ;
    
    retlw   0x19 ; Usage Minimum (0xE0)
    retlw   0xE0 ;
    
    retlw   0x29 ; Usage Maximum (0xE7)
    retlw   0xE7 ;
    
    retlw   0x15 ; logical minimun      
    retlw   0x00 ;
    
    retlw   0x25 ; logical maximun      
    retlw   0x01 ;
    
    retlw   0x81 ; input  (Data,Var,Abs,NWrp,Lin,Pref,NNul,Bit)
    retlw   0x02 ;
    
    retlw   0x75 ; report size 8
    retlw   0x08 ;
    
    retlw   0x95 ; report count 6
    retlw   0x06 ;
    
    retlw   0x15 ; logical minimun      
    retlw   0x00 ;
    
    retlw   0x25 ; logical maximun      
    retlw   0x64 ;
    
    retlw   0x05 ; USAGE_PAGE (kbrd/keypad)     
    retlw   0x07 ; LOW
    
    retlw   0x19 ; Usage Minimum (0x00)
    retlw   0x00 ;
    
    retlw   0x29 ; Usage Maximum (0x65)
    retlw   0x65 ;
    
    retlw   0x81 ; input  (Data,Var,Abs,NWrp,Lin,Pref,NNul,Bit)
    retlw   0x00 ;
    
    retlw   0xC0 ; END_COLLECTION


;***************************************
;*            Mouse Emu                *
;***************************************
    retlw   0x05 ; USAGE_PAGE (generic desktop)     
    retlw   0x01 ; LOW
    
    retlw   0x09 ; USAGE Mouse      
    retlw   0x02 ; LOW
    
    retlw   0xA1 ; COLLECTION (APPLICATION)     
    retlw   0x01 ; LOW
    
    retlw   0x85 ; REPORT_ID (2)
    retlw   0x02 ; LOW
    
    retlw   0x09 ; USAGE_PAGE (Pointer)     
    retlw   0x01 ; LOW
    
    retlw   0xA1 ; COLLECTION (Physical)    
    retlw   0x00 ;
    
    retlw   0x05 ; USAGE_PAGE (Button)
    retlw   0x09 ;
    
    retlw   0x19 ; Usage Minimum (Button 1)
    retlw   0x01 ;
    
    retlw   0x29 ; Usage Maximum (Button 2)
    retlw   0x02 ;
    
    retlw   0x15 ; logical minimun      
    retlw   0x00 ;
    
    retlw   0x25 ; logical maximun      
    retlw   0x01 ;
    
    retlw   0x75 ; report size 1
    retlw   0x01 ;
    
    retlw   0x95 ; report count 3
    retlw   0x02 ;
    
    retlw   0x81 ; input  (Data,Var,Abs,NWrp,Lin,Pref,NNul,Bit)
    retlw   0x02 ;
    
    retlw   0x95 ; report count 3       
    retlw   0x06 ;
    
    retlw   0x81 ; input (Data,Var,Abs) 
    retlw   0x03 ;
    
    retlw   0x05 ; USAGE_PAGE (Generic Desktop)     
    retlw   0x01 ; LOW
    
    retlw   0x09 ; Usage(X)
    retlw   0x30 ;
    
    retlw   0x09 ; Usage(Y)
    retlw   0x31 ;
    
    retlw   0x15 ; logical minimun (-127)       
    retlw   0x81 ;
    
    retlw   0x25 ; logical maximun (127)        
    retlw   0x7F ;
    
    retlw   0x75 ; report size 8
    retlw   0x08 ;
    
    retlw   0x95 ; report count 2
    retlw   0x02 ;
    
    retlw   0x81 ; INPUT (Data,Var,Rel) 
    retlw   0x06 ;
    
    retlw   0xC0 ; END_COLLECTION
    retlw   0xC0 ; END_COLLECTION
    
    
;***************************************
;*          Volume Control             *
;***************************************
    retlw   0x05 ; USAGE_PAGE (Consumer Devices)        
    retlw   0x0C ; LOW
    
    retlw   0x09 ; USAGE (Consumer Control)     
    retlw   0x01 ; LOW
    
    retlw   0xA1 ; COLLECTION (APPLICATION)     
    retlw   0x01 ; LOW
    
    retlw   0x85 ; REPORT_ID (3 Media)
    retlw   0x03 ; LOW
    
    retlw   0x19 ; Usage Minimum (0x00)
    retlw   0x00 ;
    
    retlw   0x2A ; Usage Maximum (0xAC format)
    retlw   0x3C ;
    retlw   0x02
    
    retlw   0x15 ; logical minimun      
    retlw   0x00 ;
    
    retlw   0x26 ; logical maximun (572)        
    retlw   0x3C ;
    retlw   0x02 ;

    retlw   0x95 ; report count 1
    retlw   0x01 ;
    
    retlw   0x75 ; report size 16
    retlw   0x10 ;
    
    retlw   0x81 ; input  (Data,Var,Abs)
    retlw   0x00 ;
    
    retlw   0xC0 ; END_COLLECTION

;***************************************
;*          ConfigInterface            *
;***************************************

EndReportDescriptor2

; String pointer table
USB_SD_Ptr
Strings
	db	low String0, high String0
        db	upper String0, 0
	db	low String1, high String1
        db	upper String1, 0
	db	low String2, high String2
       	db	upper String2, 0
	db	low String3, high String3
	   	db	upper String3, 0
	db	low String4, high String4
	   	db	upper String4, 0
	;db	low String5, high String5
	;   db	upper String5, 0

String0
	retlw	(String1-String0)/2	; Length of string
	retlw	USB_DESCRIPTOR_STRING   ; Descriptor type 3
	retlw	0x09		        ; Language ID (as defined by MS 0x0409)
	retlw	0x04

; company name
String1
	retlw	(String2-String1)/2
	retlw	USB_DESCRIPTOR_STRING
	
        retlw   'D'
        retlw   0x00
        retlw   'C'
        retlw   0x00
        retlw   'L'
        retlw   0x00
	
; product name	
String2
	retlw	(String3-String2)/2
	retlw	USB_DESCRIPTOR_STRING
	    
        retlw   'A'
        retlw   0x00
        retlw   'R'
        retlw   0x00
        retlw   'C'
        retlw   0x00
        retlw   'A'
        retlw   0x00
        retlw   'D'
        retlw   0x00
        retlw   'E'
        retlw   0x00
        retlw   ' '
        retlw   0x00
        retlw   'J'
        retlw   0x00
        retlw   'A'
        retlw   0x00
        retlw   'M'
        retlw   0x00
        retlw   'M'
        retlw   0x00
        retlw   'A'
        retlw   0x00
; serial number
String3
	retlw	(String4-String3)/2
	retlw	USB_DESCRIPTOR_STRING
	
        retlw   'J'
        retlw   0x00
        retlw   'V'
        retlw   0x00
        retlw   'S'
        retlw   0x00
        retlw   '0'
        retlw   0x00
        retlw   '0'
        retlw   0x00
        retlw   '0'
        retlw   0x00
        retlw   '0'
        retlw   0x00

String4
    retlw	(String5-String4)/2
	retlw	USB_DESCRIPTOR_STRING
        
        retlw   'C'
        retlw   0x00
        retlw   'O'
        retlw   0x00
        retlw   'N'
        retlw   0x00
        retlw   'T'
        retlw   0x00
        retlw   'R'
        retlw   0x00
        retlw   'O'
        retlw   0x00
        retlw   'L'
        retlw   0x00
        
String5


	ENDASM?


; C:\TEMP\DCLFI32V1.0\DES_FIRMAC01.BAS	00764	hid_desc_end

	LABEL?L	_hid_desc_end	
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00040	DEFINE OSC 48
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00042	Define ADC_BITS     10  ' Set number of bits in result
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00043	Define ADC_CLOCK     3  ' Set clock source (3=rc)
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00044	Define ADC_SAMPLEUS 50  ' Set sampling time in uS
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00047	DEFINE HSER_RCSTA 90h 
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00050	DEFINE HSER_TXSTA 24h 
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00053	DEFINE HSER_BAUD 115200
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00055	USBBufferSizeMax   con 8  ' maximum buffer size
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00056	USBBufferSizeTX    con 11  ' output
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00057	USBMediaTX         con 3
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00058	USBkeyTX           con 8
; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00059	USBBufferSizeRX    con 8  ' input

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00111	TRISA =%10100011
	MOVE?CB	0A3h, TRISA

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00112	ADCON1=%00001101
	MOVE?CB	00Dh, ADCON1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00113	ADCON2=%10000000
	MOVE?CB	080h, ADCON2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00115	TRISB=%11111111
	MOVE?CB	0FFh, TRISB

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00116	TRISC=%10010010
	MOVE?CB	092h, TRISC

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00117	TRISD=%11110000
	MOVE?CB	0F0h, TRISD

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00118	TRISE=%0111
	MOVE?CB	007h, TRISE

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00119	PORTD=0
	MOVE?CB	000h, PORTD

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00120	PORTC=%100
	MOVE?CB	004h, PORTC

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00121	PORTA.6=0
	MOVE?CT	000h, _PORTA??6

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00123	OUTPUTS0=0
	MOVE?CB	000h, _OUTPUTS0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00124	OUTPUTS1=0
	MOVE?CB	000h, _OUTPUTS1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00125	OUTPUTS2=0
	MOVE?CB	000h, _OUTPUTS2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00134	RESET:

	LABEL?L	_RESET	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00135	clear
	CLEAR?	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00136	LATC.0=1
	MOVE?CT	001h, _LATC??0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00138	READ 1,CHUTES0
	READADDRESS?C	001h
	READ?B	_CHUTES0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00139	READ 2,CHUTES1
	READADDRESS?C	002h
	READ?B	_CHUTES1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00140	if CHUTES0=255 then CHUTES0=0 : write 1,CHUTES0
	CMPNE?BCL	_CHUTES0, 0FFh, L00001
	MOVE?CB	000h, _CHUTES0
	WRITEADDRESS?C	001h
	WRITE?B	_CHUTES0
	LABEL?L	L00001	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00141	if CHUTES1=255 then CHUTES1=0 : write 2,chutes1
	CMPNE?BCL	_CHUTES1, 0FFh, L00003
	MOVE?CB	000h, _CHUTES1
	WRITEADDRESS?C	002h
	WRITE?B	_CHUTES1
	LABEL?L	L00003	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00142	read 3,VConfig  ;commcounter,Autocounter,coinSlot1,coinSlot2,counter Enable 
	READADDRESS?C	003h
	READ?B	_VConfig

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00143	read 4,Temp
	READADDRESS?C	004h
	READ?B	_Temp

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00145	if temp !="A" then
	CMPEQ?BCL	_Temp, 041h, L00005

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00146	    CHUTES0=0
	MOVE?CB	000h, _CHUTES0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00147	    CHUTES1=0
	MOVE?CB	000h, _CHUTES1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00148	    VConfig=%00011111
	MOVE?CB	01Fh, _VConfig

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00149	    write 1,CHUTES0
	WRITEADDRESS?C	001h
	WRITE?B	_CHUTES0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00150	    write 2,CHUTES1
	WRITEADDRESS?C	002h
	WRITE?B	_CHUTES1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00151	    write 3,VConfig
	WRITEADDRESS?C	003h
	WRITE?B	_VConfig

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00152	    write 4,"A"
	WRITEADDRESS?C	004h
	WRITE?C	041h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00153	endif
	LABEL?L	L00005	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00155	if VConfig.1=1 then outputs2.6=1 ;on coinSlot1
	CMPNE?TCL	_VConfig??1, 001h, L00007
	MOVE?CT	001h, _OUTPUTS2??6
	LABEL?L	L00007	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00156	if VConfig.2=1 then outputs2.7=1 ;on coinSlot2
	CMPNE?TCL	_VConfig??2, 001h, L00009
	MOVE?CT	001h, _OUTPUTS2??7
	LABEL?L	L00009	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00157	gosub wout
	GOSUB?L	_wout

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00159	USBInit
	USBINIT?	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00161	AllFlags.1=1
	MOVE?CT	001h, _AllFlags??1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00162	AllFlags.2=1
	MOVE?CT	001h, _AllFlags??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00163	ANALOG1=32768
	MOVE?CW	08000h, _ANALOG1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00164	ANALOG5=32768
	MOVE?CW	08000h, _ANALOG5

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00165	ANALOG7=32768
	MOVE?CW	08000h, _ANALOG7

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00166	ANALOG3=32768
	MOVE?CW	08000h, _ANALOG3

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00168	ANALOG6=32768
	MOVE?CW	08000h, _ANALOG6

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00169	ANALOG0=32768
	MOVE?CW	08000h, _ANALOG0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00170	ANALOG2=32768
	MOVE?CW	08000h, _ANALOG2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00171	ANALOG4=32768
	MOVE?CW	08000h, _ANALOG4

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00173	MainLoop:

	LABEL?L	_MainLoop	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00175	    GOSUB READIN
	GOSUB?L	_READIN

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00177	    if chutes0>0 or CHUTES1>0 then gosub COUNTER
	CMPGT?BCB	_CHUTES0, 000h, T1
	CMPGT?BCB	_CHUTES1, 000h, T2
	LOR?BBW	T1, T2, T2
	CMPF?WL	T2, L00011
	GOSUB?L	_COUNTER
	LABEL?L	L00011	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00179	    if AllFlags.0=1 then
	CMPNE?TCL	_AllFlags??0, 001h, L00013

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00180	        AllFlags.0=0
	MOVE?CT	000h, _AllFlags??0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00181	    endif
	LABEL?L	L00013	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00183	    if AllFlags.1=1 then
	CMPNE?TCL	_AllFlags??1, 001h, L00015

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00184	        AllFlags.1=0
	MOVE?CT	000h, _AllFlags??1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00185	        idtx=1
	MOVE?CB	001h, _IDTX

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00186	        USBBuffer[0]=1
	MOVE?CB	001h, _USBBuffer

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00187	        USBBuffer[1]=ANALOG1.lowbyte
	MOVE?BB	_ANALOG1??LOWBYTE, _USBBuffer + 00001h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00188	        USBBuffer[2]=ANALOG1.highbyte
	MOVE?BB	_ANALOG1??HIGHBYTE, _USBBuffer + 00002h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00189	        USBBuffer[3]=ANALOG5.lowbyte
	MOVE?BB	_ANALOG5??LOWBYTE, _USBBuffer + 00003h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00190	        USBBuffer[4]=ANALOG5.highbyte
	MOVE?BB	_ANALOG5??HIGHBYTE, _USBBuffer + 00004h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00191	        USBBuffer[5]=ANALOG7.lowbyte
	MOVE?BB	_ANALOG7??LOWBYTE, _USBBuffer + 00005h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00192	        USBBuffer[6]=ANALOG7.highbyte
	MOVE?BB	_ANALOG7??HIGHBYTE, _USBBuffer + 00006h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00193	        USBBuffer[7]=ANALOG3.lowbyte
	MOVE?BB	_ANALOG3??LOWBYTE, _USBBuffer + 00007h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00194	        USBBuffer[8]=ANALOG3.highbyte
	MOVE?BB	_ANALOG3??HIGHBYTE, _USBBuffer + 00008h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00196	        Temp.0=FunctionKeys.0
	MOVE?TT	_FunctionKeys??0, _Temp??0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00197	        Temp.1=FunctionKeys.3
	MOVE?TT	_FunctionKeys??3, _Temp??1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00198	        Temp.2=P1Keys.0
	MOVE?TT	_P1Keys??0, _Temp??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00199	        Temp.3=P1Keys.5
	MOVE?TT	_P1Keys??5, _Temp??3

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00200	        Temp.4=P1Keys.6
	MOVE?TT	_P1Keys??6, _Temp??4

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00201	        Temp.5=P1Keys.7
	MOVE?TT	_P1Keys??7, _Temp??5

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00202	        Temp.6=P1Keys.8
	MOVE?TT	_P1Keys??8, _Temp??6

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00203	        Temp.7=P1Keys.9
	MOVE?TT	_P1Keys??9, _Temp??7

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00205	        USBBuffer[9]=Temp;P1Keys.lowbyte
	MOVE?BB	_Temp, _USBBuffer + 00009h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00207	        Temp.0=P1Keys.10
	MOVE?TT	_P1Keys??10, _Temp??0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00208	        Temp.1=P1Keys.1
	MOVE?TT	_P1Keys??1, _Temp??1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00209	        Temp.2=P1Keys.2
	MOVE?TT	_P1Keys??2, _Temp??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00210	        Temp.3=P1Keys.3
	MOVE?TT	_P1Keys??3, _Temp??3

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00211	        Temp.4=P1Keys.4
	MOVE?TT	_P1Keys??4, _Temp??4

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00212	        Temp.5=0
	MOVE?CT	000h, _Temp??5

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00213	        Temp.6=0
	MOVE?CT	000h, _Temp??6

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00214	        Temp.7=0
	MOVE?CT	000h, _Temp??7

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00216	        USBBuffer[10]=Temp;P1Keys.highbyte
	MOVE?BB	_Temp, _USBBuffer + 0000Ah

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00217	        gosub DoUSBOut
	GOSUB?L	_DoUSBOut

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00218	    endif
	LABEL?L	L00015	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00220	    if AllFlags.2=1 then
	CMPNE?TCL	_AllFlags??2, 001h, L00017

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00221	        AllFlags.2=0
	MOVE?CT	000h, _AllFlags??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00222	        idtx=1
	MOVE?CB	001h, _IDTX

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00223	        USBBuffer[0]=2
	MOVE?CB	002h, _USBBuffer

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00224	        USBBuffer[1]=ANALOG6.lowbyte
	MOVE?BB	_ANALOG6??LOWBYTE, _USBBuffer + 00001h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00225	        USBBuffer[2]=ANALOG6.highbyte
	MOVE?BB	_ANALOG6??HIGHBYTE, _USBBuffer + 00002h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00226	        USBBuffer[3]=ANALOG0.lowbyte
	MOVE?BB	_ANALOG0??LOWBYTE, _USBBuffer + 00003h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00227	        USBBuffer[4]=ANALOG0.highbyte
	MOVE?BB	_ANALOG0??HIGHBYTE, _USBBuffer + 00004h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00228	        USBBuffer[5]=ANALOG2.lowbyte
	MOVE?BB	_ANALOG2??LOWBYTE, _USBBuffer + 00005h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00229	        USBBuffer[6]=ANALOG2.highbyte
	MOVE?BB	_ANALOG2??HIGHBYTE, _USBBuffer + 00006h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00230	        USBBuffer[7]=ANALOG4.lowbyte
	MOVE?BB	_ANALOG4??LOWBYTE, _USBBuffer + 00007h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00231	        USBBuffer[8]=ANALOG4.highbyte
	MOVE?BB	_ANALOG4??HIGHBYTE, _USBBuffer + 00008h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00233	        Temp.0=FunctionKeys.1
	MOVE?TT	_FunctionKeys??1, _Temp??0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00234	        Temp.1=FunctionKeys.2
	MOVE?TT	_FunctionKeys??2, _Temp??1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00235	        Temp.2=FunctionKeys.4
	MOVE?TT	_FunctionKeys??4, _Temp??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00236	        Temp.3=P2Keys.0
	MOVE?TT	_P2Keys??0, _Temp??3

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00237	        Temp.4=P2Keys.5
	MOVE?TT	_P2Keys??5, _Temp??4

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00238	        Temp.5=P2Keys.6
	MOVE?TT	_P2Keys??6, _Temp??5

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00239	        Temp.6=P2Keys.7
	MOVE?TT	_P2Keys??7, _Temp??6

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00240	        Temp.7=P2Keys.8
	MOVE?TT	_P2Keys??8, _Temp??7

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00242	        USBBuffer[9]=Temp;P2Keys.lowbyte
	MOVE?BB	_Temp, _USBBuffer + 00009h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00244	        Temp.0=P2Keys.9
	MOVE?TT	_P2Keys??9, _Temp??0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00245	        Temp.1=P2Keys.10
	MOVE?TT	_P2Keys??10, _Temp??1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00246	        Temp.2=P2Keys.1
	MOVE?TT	_P2Keys??1, _Temp??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00247	        Temp.3=P2Keys.2
	MOVE?TT	_P2Keys??2, _Temp??3

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00248	        Temp.4=P2Keys.3
	MOVE?TT	_P2Keys??3, _Temp??4

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00249	        Temp.5=P2Keys.4
	MOVE?TT	_P2Keys??4, _Temp??5

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00250	        Temp.6=0
	MOVE?CT	000h, _Temp??6

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00251	        Temp.7=0
	MOVE?CT	000h, _Temp??7

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00253	        USBBuffer[10]=Temp;P2Keys.highbyte
	MOVE?BB	_Temp, _USBBuffer + 0000Ah

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00254	        gosub DoUSBOut
	GOSUB?L	_DoUSBOut

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00255	    endif
	LABEL?L	L00017	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00257	    if AllFlags.3=1 then
	CMPNE?TCL	_AllFlags??3, 001h, L00019

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00258	        AllFlags.3=0
	MOVE?CT	000h, _AllFlags??3

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00259	        idtx=3 'Keyboard
	MOVE?CB	003h, _IDTX

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00260	        for i=0  to 7
	MOVE?CB	000h, _i
	LABEL?L	L00021	
	CMPGT?BCL	_i, 007h, L00022

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00261	            USBBuffer[i]=0
	AIN?CBB	000h, _USBBuffer, _i

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00262	        next i
	NEXT?BCL	_i, 001h, L00021
	LABEL?L	L00022	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00263	        x=2
	MOVE?CB	002h, _x

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00264	        if mediak.0=1 then USBBuffer[x]=41 : x=x+1
	CMPNE?TCL	_MEDIAK??0, 001h, L00023
	AIN?CBB	029h, _USBBuffer, _x
	ADD?BCB	_x, 001h, _x
	LABEL?L	L00023	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00266	        if porta.5=1 then
	CMPNE?TCL	_PORTA??5, 001h, L00025

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00267	            if mediak.1=1 then USBBuffer[x]=82 : x=x+1
	CMPNE?TCL	_MEDIAK??1, 001h, L00027
	AIN?CBB	052h, _USBBuffer, _x
	ADD?BCB	_x, 001h, _x
	LABEL?L	L00027	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00268	            if mediak.2=1 then USBBuffer[x]=81 : x=x+1
	CMPNE?TCL	_MEDIAK??2, 001h, L00029
	AIN?CBB	051h, _USBBuffer, _x
	ADD?BCB	_x, 001h, _x
	LABEL?L	L00029	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00269	            if mediak.3=1 then USBBuffer[x]=80 : x=x+1
	CMPNE?TCL	_MEDIAK??3, 001h, L00031
	AIN?CBB	050h, _USBBuffer, _x
	ADD?BCB	_x, 001h, _x
	LABEL?L	L00031	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00270	            if mediak.4=1 then USBBuffer[x]=79 : x=x+1
	CMPNE?TCL	_MEDIAK??4, 001h, L00033
	AIN?CBB	04Fh, _USBBuffer, _x
	ADD?BCB	_x, 001h, _x
	LABEL?L	L00033	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00271	            if mediak.5=1 then USBBuffer[x]=40 : x=x+1
	CMPNE?TCL	_MEDIAK??5, 001h, L00035
	AIN?CBB	028h, _USBBuffer, _x
	ADD?BCB	_x, 001h, _x
	LABEL?L	L00035	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00272	        endif
	LABEL?L	L00025	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00274	        USBBuffer[0]=1
	MOVE?CB	001h, _USBBuffer

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00275	        USBBuffer[1]=0
	MOVE?CB	000h, _USBBuffer + 00001h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00276	        gosub DoUSBOut
	GOSUB?L	_DoUSBOut

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00278	        idtx=2
	MOVE?CB	002h, _IDTX

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00279	        USBBuffer[0]=3
	MOVE?CB	003h, _USBBuffer

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00280	        if mediak.6=1 then USBBuffer[1]=233
	CMPNE?TCL	_MEDIAK??6, 001h, L00037
	MOVE?CB	0E9h, _USBBuffer + 00001h
	LABEL?L	L00037	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00281	        if mediak.7=1 then USBBuffer[1]=234
	CMPNE?TCL	_MEDIAK??7, 001h, L00039
	MOVE?CB	0EAh, _USBBuffer + 00001h
	LABEL?L	L00039	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00282	        USBBuffer[2]=0
	MOVE?CB	000h, _USBBuffer + 00002h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00283	        gosub DoUSBOut 
	GOSUB?L	_DoUSBOut

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00284	    endif
	LABEL?L	L00019	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00286	    USBService
	USBSERVICE?	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00287	goto mainloop
	GOTO?L	_MainLoop

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00292	READIN:

	LABEL?L	_READIN	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00296	    FunctionKeys.1 = ~ PORTD.4   'service-
	NOT?TT	_PORTD??4, _FunctionKeys??1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00297	    FunctionKeys.2 = ~ PORTD.5   'Tilt-
	NOT?TT	_PORTD??5, _FunctionKeys??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00298	    FunctionKeys.4 = ~ PORTD.6   'coin2-
	NOT?TT	_PORTD??6, _FunctionKeys??4

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00299	    P2Keys.0 = ~ PORTD.7   'start-
	NOT?TT	_PORTD??7, _P2Keys??0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00301	    P2Keys.1 = ~ PORTB.0   'up
	NOT?TT	_PORTB??0, _P2Keys??1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00302	    P2Keys.2 = ~ PORTB.1   'down
	NOT?TT	_PORTB??1, _P2Keys??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00303	    P2Keys.3 = ~ PORTB.2   'left
	NOT?TT	_PORTB??2, _P2Keys??3

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00304	    P2Keys.4 = ~ PORTB.3   'right
	NOT?TT	_PORTB??3, _P2Keys??4

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00306	    P2Keys.5 = ~ PORTB.4   'Button1-
	NOT?TT	_PORTB??4, _P2Keys??5

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00307	    P2Keys.6 = ~ PORTB.5   'Button2-
	NOT?TT	_PORTB??5, _P2Keys??6

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00308	    P2Keys.7 = ~ PORTB.6   'Button3-
	NOT?TT	_PORTB??6, _P2Keys??7

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00309	    P2Keys.8 = ~ PORTB.7   'Button4-
	NOT?TT	_PORTB??7, _P2Keys??8

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00311	    P2Keys.9 = ~ PORTE.2   'Button5-
	NOT?TT	_PORTE??2, _P2Keys??9

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00312	    P2Keys.10 = ~ PORTE.1  'Button6-
	NOT?TT	_PORTE??1, _P2Keys??10

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00313	    MEDIAK.6 = ~ PORTE.0   'Key Vol+
	NOT?TT	_PORTE??0, _MEDIAK??6

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00320	    LATA.4=1                     
	MOVE?CT	001h, _LATA??4

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00321	    pauseus 1 'HC257 PAUSEUS 1
	PAUSEUS?C	001h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00324	    FunctionKeys.0 = ~ PORTD.4   'test-
	NOT?TT	_PORTD??4, _FunctionKeys??0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00325	    FunctionKeys.3 = ~ PORTD.5   'coin1-
	NOT?TT	_PORTD??5, _FunctionKeys??3

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00326	    P1Keys.0 = ~ PORTD.6   'start-
	NOT?TT	_PORTD??6, _P1Keys??0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00327	    P1Keys.1 = ~ PORTD.7   'up
	NOT?TT	_PORTD??7, _P1Keys??1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00329	    P1Keys.2 = ~ PORTB.0   'down
	NOT?TT	_PORTB??0, _P1Keys??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00330	    P1Keys.3 = ~ PORTB.1   'left
	NOT?TT	_PORTB??1, _P1Keys??3

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00331	    P1Keys.4 = ~ PORTB.2   'right
	NOT?TT	_PORTB??2, _P1Keys??4

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00332	    P1Keys.5 = ~ PORTB.3   'Button1
	NOT?TT	_PORTB??3, _P1Keys??5

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00334	    MEDIAK.1 = ~ PORTD.7
	NOT?TT	_PORTD??7, _MEDIAK??1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00335	    MEDIAK.2 = ~ PORTB.0
	NOT?TT	_PORTB??0, _MEDIAK??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00336	    MEDIAK.3 = ~ PORTB.1
	NOT?TT	_PORTB??1, _MEDIAK??3

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00337	    MEDIAK.4 = ~ PORTB.2
	NOT?TT	_PORTB??2, _MEDIAK??4

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00338	    MEDIAK.5 = ~ PORTB.3
	NOT?TT	_PORTB??3, _MEDIAK??5

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00340	    P1Keys.6 = ~ PORTB.4   'Button2
	NOT?TT	_PORTB??4, _P1Keys??6

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00341	    P1Keys.7 = ~ PORTB.5   'Button3-
	NOT?TT	_PORTB??5, _P1Keys??7

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00342	    P1Keys.8 = ~ PORTB.6   'Button4-
	NOT?TT	_PORTB??6, _P1Keys??8

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00343	    P1Keys.9 = ~ PORTB.7   'Button5-
	NOT?TT	_PORTB??7, _P1Keys??9

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00345	    P1Keys.10 = ~ PORTE.2  'Button6-
	NOT?TT	_PORTE??2, _P1Keys??10

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00347	    MEDIAK.0 = ~ PORTE.1   'key ESC   
	NOT?TT	_PORTE??1, _MEDIAK??0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00348	    MEDIAK.7 = ~ PORTE.0   'key Vol-
	NOT?TT	_PORTE??0, _MEDIAK??7

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00350	    LATA.4=0
	MOVE?CT	000h, _LATA??4

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00352	    gosub RPOV
	GOSUB?L	_RPOV

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00353	    P1Keys.1=pov1.0
	MOVE?TT	_POV1??0, _P1Keys??1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00354	    P1Keys.2=pov1.1
	MOVE?TT	_POV1??1, _P1Keys??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00355	    P1Keys.3=pov1.2
	MOVE?TT	_POV1??2, _P1Keys??3

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00356	    P1Keys.4=pov1.3
	MOVE?TT	_POV1??3, _P1Keys??4

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00357	    P2Keys.1=pov2.0
	MOVE?TT	_POV2??0, _P2Keys??1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00358	    P2Keys.2=pov2.1
	MOVE?TT	_POV2??1, _P2Keys??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00359	    P2Keys.3=pov2.2
	MOVE?TT	_POV2??2, _P2Keys??3

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00360	    P2Keys.4=pov2.3
	MOVE?TT	_POV2??3, _P2Keys??4

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00363	    if vconfig.3=1 and vconfig.0=1 then
	CMPEQ?TCB	_VConfig??3, 001h, T1
	CMPEQ?TCB	_VConfig??0, 001h, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00041

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00364	        if FunctionKeys.3=1 then trigger1 = trigger1 + 1
	CMPNE?TCL	_FunctionKeys??3, 001h, L00043
	ADD?BCB	_TRIGGER1, 001h, _TRIGGER1
	LABEL?L	L00043	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00365	        if FunctionKeys.3=0 and trigger1<6 then trigger1=0
	CMPEQ?TCB	_FunctionKeys??3, 000h, T1
	CMPLT?BCB	_TRIGGER1, 006h, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00045
	MOVE?CB	000h, _TRIGGER1
	LABEL?L	L00045	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00366	        if FunctionKeys.3=0 and trigger1>5 then trigger1=0 : CHUTES0=CHUTES0+1 : write 1,chutes0
	CMPEQ?TCB	_FunctionKeys??3, 000h, T1
	CMPGT?BCB	_TRIGGER1, 005h, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00047
	MOVE?CB	000h, _TRIGGER1
	ADD?BCB	_CHUTES0, 001h, _CHUTES0
	WRITEADDRESS?C	001h
	WRITE?B	_CHUTES0
	LABEL?L	L00047	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00368	        if FunctionKeys.4=1 then trigger2 = trigger2 + 1
	CMPNE?TCL	_FunctionKeys??4, 001h, L00049
	ADD?BCB	_TRIGGER2, 001h, _TRIGGER2
	LABEL?L	L00049	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00369	        if FunctionKeys.4=0 and trigger2<6 then trigger2=0
	CMPEQ?TCB	_FunctionKeys??4, 000h, T1
	CMPLT?BCB	_TRIGGER2, 006h, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00051
	MOVE?CB	000h, _TRIGGER2
	LABEL?L	L00051	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00371	        if FunctionKeys.4=0 and trigger2>5 then
	CMPEQ?TCB	_FunctionKeys??4, 000h, T1
	CMPGT?BCB	_TRIGGER2, 005h, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00053

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00372	            trigger2=0
	MOVE?CB	000h, _TRIGGER2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00373	            if vconfig.4=1 then 
	CMPNE?TCL	_VConfig??4, 001h, L00055

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00374	                CHUTES0=CHUTES0+1
	ADD?BCB	_CHUTES0, 001h, _CHUTES0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00375	                write 1,chutes0
	WRITEADDRESS?C	001h
	WRITE?B	_CHUTES0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00376	            else
	GOTO?L	L00056
	LABEL?L	L00055	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00377	                CHUTES1=CHUTES1+1
	ADD?BCB	_CHUTES1, 001h, _CHUTES1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00378	                write 2,chutes1
	WRITEADDRESS?C	002h
	WRITE?B	_CHUTES1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00379	            endif
	LABEL?L	L00056	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00380	        endif
	LABEL?L	L00053	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00381	    endif
	LABEL?L	L00041	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00383	    if FKeytemp != FunctionKeys then        'Flag FunctionKeys
	CMPEQ?BBL	_FKeytemp, _FunctionKeys, L00057

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00384	        AllFlags.0=1
	MOVE?CT	001h, _AllFlags??0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00386	        if FunctionKeys.0 != FKeytemp.0 then        'Player 1 FunctionKeys
	CMPEQ?TTL	_FunctionKeys??0, _FKeytemp??0, L00059

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00387	            AllFlags.1=1
	MOVE?CT	001h, _AllFlags??1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00388	            AllFlags.0=0
	MOVE?CT	000h, _AllFlags??0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00389	        endif
	LABEL?L	L00059	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00390	        if FunctionKeys.3 != FKeytemp.3 then        'Player 1 FunctionKeys
	CMPEQ?TTL	_FunctionKeys??3, _FKeytemp??3, L00061

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00391	            AllFlags.1=1
	MOVE?CT	001h, _AllFlags??1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00392	            AllFlags.0=0
	MOVE?CT	000h, _AllFlags??0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00393	        endif
	LABEL?L	L00061	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00395	        if FunctionKeys.1 != FKeytemp.1 then        'Player 2 FunctionKeys
	CMPEQ?TTL	_FunctionKeys??1, _FKeytemp??1, L00063

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00396	            AllFlags.2=1
	MOVE?CT	001h, _AllFlags??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00397	            AllFlags.0=0
	MOVE?CT	000h, _AllFlags??0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00398	        endif
	LABEL?L	L00063	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00399	        if FunctionKeys.2 != FKeytemp.2 then        'Player 2 FunctionKeys
	CMPEQ?TTL	_FunctionKeys??2, _FKeytemp??2, L00065

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00400	            AllFlags.2=1
	MOVE?CT	001h, _AllFlags??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00401	            AllFlags.0=0
	MOVE?CT	000h, _AllFlags??0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00402	        endif
	LABEL?L	L00065	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00403	        if FunctionKeys.4 != FKeytemp.4 then        'Player 2 FunctionKeys
	CMPEQ?TTL	_FunctionKeys??4, _FKeytemp??4, L00067

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00404	            AllFlags.2=1
	MOVE?CT	001h, _AllFlags??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00405	            AllFlags.0=0
	MOVE?CT	000h, _AllFlags??0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00406	        endif
	LABEL?L	L00067	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00407	        FKeytemp=FunctionKeys
	MOVE?BB	_FunctionKeys, _FKeytemp

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00408	    endif
	LABEL?L	L00057	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00410	    if F1Keys != P1Keys then        'Flag Player 1
	CMPEQ?WWL	_F1Keys, _P1Keys, L00069

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00411	        AllFlags.1=1
	MOVE?CT	001h, _AllFlags??1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00412	        F1Keys = P1Keys
	MOVE?WW	_P1Keys, _F1Keys

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00413	    endif
	LABEL?L	L00069	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00414	    if F2Keys != P2Keys then        'Flag Player 2
	CMPEQ?WWL	_F2Keys, _P2Keys, L00071

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00415	        AllFlags.2=1
	MOVE?CT	001h, _AllFlags??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00416	        F2Keys = P2Keys
	MOVE?WW	_P2Keys, _F2Keys

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00417	    endif
	LABEL?L	L00071	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00419	    if TMEDIAK != MEDIAK then
	CMPEQ?BBL	_TMEDIAK, _MEDIAK, L00073

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00420	        AllFlags.3=1
	MOVE?CT	001h, _AllFlags??3

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00421	        TMEDIAK = MEDIAK
	MOVE?BB	_MEDIAK, _TMEDIAK

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00422	    endif
	LABEL?L	L00073	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00423	return
	RETURN?	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00428	READAN:

	LABEL?L	_READAN	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00430	    LATA.2=0
	MOVE?CT	000h, _LATA??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00431	    LATA.3=0
	MOVE?CT	000h, _LATA??3

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00432	    ADCIN 0, aninput
	ADCIN?CW	000h, _ANINPUT

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00434	    ANALOG0=aninput
	MOVE?WW	_ANINPUT, _ANALOG0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00436	    ADCIN 1, aninput
	ADCIN?CW	001h, _ANINPUT

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00438	    ANALOG1=aninput
	MOVE?WW	_ANINPUT, _ANALOG1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00441	    LATA.2=1
	MOVE?CT	001h, _LATA??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00442	    LATA.3=0   
	MOVE?CT	000h, _LATA??3

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00443	    ADCIN 0, aninput
	ADCIN?CW	000h, _ANINPUT

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00445	    ANALOG2=aninput
	MOVE?WW	_ANINPUT, _ANALOG2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00447	    ADCIN 1, aninput
	ADCIN?CW	001h, _ANINPUT

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00449	    ANALOG3=aninput
	MOVE?WW	_ANINPUT, _ANALOG3

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00451	    LATA.2=0
	MOVE?CT	000h, _LATA??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00452	    LATA.3=1
	MOVE?CT	001h, _LATA??3

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00453	    ADCIN 0, aninput
	ADCIN?CW	000h, _ANINPUT

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00455	    ANALOG4=aninput
	MOVE?WW	_ANINPUT, _ANALOG4

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00457	    ADCIN 1, aninput
	ADCIN?CW	001h, _ANINPUT

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00459	    ANALOG5=aninput
	MOVE?WW	_ANINPUT, _ANALOG5

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00461	    LATA.2=1
	MOVE?CT	001h, _LATA??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00462	    LATA.3=1
	MOVE?CT	001h, _LATA??3

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00463	    ADCIN 0, aninput
	ADCIN?CW	000h, _ANINPUT

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00465	    ANALOG6=aninput
	MOVE?WW	_ANINPUT, _ANALOG6

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00467	    ADCIN 1, aninput
	ADCIN?CW	001h, _ANINPUT

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00469	    ANALOG7=aninput
	MOVE?WW	_ANINPUT, _ANALOG7

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00471	    if ANTemp0 != ANALOG0 then
	CMPEQ?WWL	_ANTemp0, _ANALOG0, L00075

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00472	        AllFlags.2=1
	MOVE?CT	001h, _AllFlags??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00473	        ANTemp0=ANALOG0
	MOVE?WW	_ANALOG0, _ANTemp0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00474	    endif
	LABEL?L	L00075	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00476	    if ANTemp1 != ANALOG1 then
	CMPEQ?WWL	_ANTemp1, _ANALOG1, L00077

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00477	        AllFlags.1=1
	MOVE?CT	001h, _AllFlags??1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00478	        ANTemp1=ANALOG1
	MOVE?WW	_ANALOG1, _ANTemp1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00479	    endif
	LABEL?L	L00077	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00481	    if ANTemp2 != ANALOG2 then
	CMPEQ?WWL	_ANTemp2, _ANALOG2, L00079

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00482	        AllFlags.2=1
	MOVE?CT	001h, _AllFlags??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00483	        ANTemp2=ANALOG2
	MOVE?WW	_ANALOG2, _ANTemp2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00484	    endif
	LABEL?L	L00079	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00486	    if ANTemp3 != ANALOG3 then
	CMPEQ?WWL	_ANTemp3, _ANALOG3, L00081

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00487	        AllFlags.1=1
	MOVE?CT	001h, _AllFlags??1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00488	        ANTemp3=ANALOG3
	MOVE?WW	_ANALOG3, _ANTemp3

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00489	    endif
	LABEL?L	L00081	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00491	    if ANTemp4 != ANALOG4 then
	CMPEQ?WWL	_ANTemp4, _ANALOG4, L00083

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00492	        AllFlags.2=1
	MOVE?CT	001h, _AllFlags??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00493	        ANTemp4=ANALOG4
	MOVE?WW	_ANALOG4, _ANTemp4

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00494	    endif
	LABEL?L	L00083	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00496	    if ANTemp5 != ANALOG5 then
	CMPEQ?WWL	_ANTemp5, _ANALOG5, L00085

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00497	        AllFlags.1=1
	MOVE?CT	001h, _AllFlags??1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00498	        ANTemp5=ANALOG5
	MOVE?WW	_ANALOG5, _ANTemp5

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00499	    endif
	LABEL?L	L00085	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00501	    if ANTemp6 != ANALOG6 then
	CMPEQ?WWL	_ANTemp6, _ANALOG6, L00087

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00502	        AllFlags.2=1
	MOVE?CT	001h, _AllFlags??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00503	        ANTemp6=ANALOG6
	MOVE?WW	_ANALOG6, _ANTemp6

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00504	    endif
	LABEL?L	L00087	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00506	    if ANTemp7 != ANALOG7 then
	CMPEQ?WWL	_ANTemp7, _ANALOG7, L00089

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00507	        AllFlags.1=1
	MOVE?CT	001h, _AllFlags??1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00508	        ANTemp7=ANALOG7
	MOVE?WW	_ANALOG7, _ANTemp7

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00509	    endif
	LABEL?L	L00089	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00511	RETURN
	RETURN?	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00516	COUNTER:

	LABEL?L	_COUNTER	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00517	    if chutes0>0 and COUNTS1 = 0 then
	CMPGT?BCB	_CHUTES0, 000h, T1
	CMPEQ?TCB	_COUNTS1, 000h, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00091

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00518	        OUTPUTS2.4=1'buffersalida 1 counter 1
	MOVE?CT	001h, _OUTPUTS2??4

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00519	        gosub wout
	GOSUB?L	_wout

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00520	        COUNTS1 = 1
	MOVE?CT	001h, _COUNTS1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00521	        timer1=0
	MOVE?CB	000h, _TIMER1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00522	    endif
	LABEL?L	L00091	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00524	    if COUNTS1=1 then
	CMPNE?TCL	_COUNTS1, 001h, L00093

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00525	        timer1=timer1+1
	ADD?BCB	_TIMER1, 001h, _TIMER1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00526	        if timer1=40 then
	CMPNE?BCL	_TIMER1, 028h, L00095

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00527	            OUTPUTS2.4=0'buffer 1 off
	MOVE?CT	000h, _OUTPUTS2??4

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00528	            gosub wout
	GOSUB?L	_wout

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00529	        endif
	LABEL?L	L00095	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00530	        if timer1>80 then timer1=0 :  COUNTS1=0 : chutes0 = chutes0 - 1 : write 1,CHUTES0
	CMPLE?BCL	_TIMER1, 050h, L00097
	MOVE?CB	000h, _TIMER1
	MOVE?CT	000h, _COUNTS1
	SUB?BCB	_CHUTES0, 001h, _CHUTES0
	WRITEADDRESS?C	001h
	WRITE?B	_CHUTES0
	LABEL?L	L00097	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00531	    endif
	LABEL?L	L00093	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00533	    if chutes1>0 and COUNTS2 = 0 then
	CMPGT?BCB	_CHUTES1, 000h, T1
	CMPEQ?TCB	_COUNTS2, 000h, T2
	LAND?BBW	T1, T2, T2
	CMPF?WL	T2, L00099

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00534	        OUTPUTS2.5=1'buffersalida 1
	MOVE?CT	001h, _OUTPUTS2??5

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00535	        gosub wout
	GOSUB?L	_wout

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00536	        COUNTS2 = 1
	MOVE?CT	001h, _COUNTS2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00537	        timer2=0
	MOVE?CB	000h, _TIMER2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00538	    endif
	LABEL?L	L00099	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00540	    if COUNTS2=1 then
	CMPNE?TCL	_COUNTS2, 001h, L00101

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00541	        timer2=timer2+1
	ADD?BCB	_TIMER2, 001h, _TIMER2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00542	        if timer2=40 then
	CMPNE?BCL	_TIMER2, 028h, L00103

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00543	            OUTPUTS2.5=0'buffer 1 off
	MOVE?CT	000h, _OUTPUTS2??5

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00544	            gosub wout
	GOSUB?L	_wout

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00545	        endif
	LABEL?L	L00103	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00546	        if timer2>80 then timer2=0 :  COUNTS2=0 : chutes1 = chutes1 - 1 : write 2,CHUTES1
	CMPLE?BCL	_TIMER2, 050h, L00105
	MOVE?CB	000h, _TIMER2
	MOVE?CT	000h, _COUNTS2
	SUB?BCB	_CHUTES1, 001h, _CHUTES1
	WRITEADDRESS?C	002h
	WRITE?B	_CHUTES1
	LABEL?L	L00105	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00547	    endif
	LABEL?L	L00101	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00548	return
	RETURN?	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00553	WOUT:

	LABEL?L	_wout	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00554	    LATD.0=1
	MOVE?CT	001h, _LATD??0

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00555	    LATD.1=1
	MOVE?CT	001h, _LATD??1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00556	    Shiftout  portd.3 , portd.1, 5, [OUTPUTS2,OUTPUTS1,OUTPUTS0]
	SHIFTDATA?T	_PORTD??3
	SHIFTCLOCK?T	_PORTD??1
	SHIFTMODE?C	005h
	SHIFTOUT?BC	_OUTPUTS2, 008h
	SHIFTOUT?BC	_OUTPUTS1, 008h
	SHIFTOUT?BC	_OUTPUTS0, 008h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00557	    LATD.2=1
	MOVE?CT	001h, _LATD??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00558	    pauseus 2
	PAUSEUS?C	002h

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00559	    USBService
	USBSERVICE?	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00560	    LATD.2=0
	MOVE?CT	000h, _LATD??2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00561	return
	RETURN?	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00566	DoUSBOut:

	LABEL?L	_DoUSBOut	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00568	    select case idtx

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00569	        caSE 1
	CMPNE?BCL	_IDTX, 001h, L00109

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00570	            USBBufferCount = USBBufferSizeTX              ' TX buffer size
	MOVE?CB	_USBBufferSizeTX, _USBBufferCount

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00571	            epTX=1 
	MOVE?CB	001h, _epTX

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00572	        CASE 2
	GOTO?L	L00108
	LABEL?L	L00109	
	CMPNE?BCL	_IDTX, 002h, L00110

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00573	            USBBufferCount = USBMediaTX                   ' TX buffer size
	MOVE?CB	_USBMediaTX, _USBBufferCount

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00574	            epTX=2
	MOVE?CB	002h, _epTX

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00575	        CASE 3
	GOTO?L	L00108
	LABEL?L	L00110	
	CMPNE?BCL	_IDTX, 003h, L00111

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00576	            USBBufferCount = USBkeyTX                     ' TX buffer size
	MOVE?CB	_USBkeyTX, _USBBufferCount

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00577	            epTX=2
	MOVE?CB	002h, _epTX

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00578	    END SELECT
	LABEL?L	L00111	
	LABEL?L	L00108	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00580	   USBService                                    ' keep connection alive
	USBSERVICE?	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00581	   USBOut epTX, USBBuffer, USBBufferCount, DoUSBOut ' if bus available, transmit data
	USBOUT?BBBL	_epTX, _USBBuffer, _USBBufferCount, _DoUSBOut

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00583	   Toggle porta.6
	TOGGLE?T	_PORTA??6

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00584	return
	RETURN?	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00586	RPOV:

	LABEL?L	_RPOV	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00591	    POV1=0  
	MOVE?CB	000h, _POV1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00592	    if P1keys.3 then
	CMPF?TL	_P1Keys??3, L00112

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00593	        if P1keys.2 then
	CMPF?TL	_P1Keys??2, L00114

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00594	            POV1=6
	MOVE?CB	006h, _POV1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00595	        elseif P1keys.1 then
	GOTO?L	L00115
	LABEL?L	L00114	
	CMPF?TL	_P1Keys??1, L00116

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00596	            POV1=8
	MOVE?CB	008h, _POV1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00597	        else
	GOTO?L	L00115
	LABEL?L	L00116	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00598	            pov1=7
	MOVE?CB	007h, _POV1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00599	        endif 
	LABEL?L	L00115	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00600	        goto RPOV2
	GOTO?L	_RPOV2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00601	    endif
	LABEL?L	L00112	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00602	    if P1keys.2 then
	CMPF?TL	_P1Keys??2, L00118

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00603	        if P1keys.4 then
	CMPF?TL	_P1Keys??4, L00120

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00604	            POV1=4
	MOVE?CB	004h, _POV1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00605	        else
	GOTO?L	L00121
	LABEL?L	L00120	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00606	            pov1=5
	MOVE?CB	005h, _POV1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00607	        endif
	LABEL?L	L00121	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00608	        goto RPOV2
	GOTO?L	_RPOV2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00609	    endif 
	LABEL?L	L00118	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00610	    if P1keys.4 then
	CMPF?TL	_P1Keys??4, L00122

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00611	        if P1keys.1 then
	CMPF?TL	_P1Keys??1, L00124

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00612	            POV1=2
	MOVE?CB	002h, _POV1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00613	        else
	GOTO?L	L00125
	LABEL?L	L00124	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00614	            pov1=3
	MOVE?CB	003h, _POV1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00615	        endif
	LABEL?L	L00125	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00616	        goto RPOV2
	GOTO?L	_RPOV2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00617	    endif 
	LABEL?L	L00122	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00618	    if P1keys.1 then
	CMPF?TL	_P1Keys??1, L00126

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00619	        if P1keys.3 then
	CMPF?TL	_P1Keys??3, L00128

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00620	            POV1=8
	MOVE?CB	008h, _POV1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00621	        else
	GOTO?L	L00129
	LABEL?L	L00128	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00622	            pov1=1
	MOVE?CB	001h, _POV1

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00623	        endif
	LABEL?L	L00129	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00624	    endif
	LABEL?L	L00126	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00625	RPOV2:

	LABEL?L	_RPOV2	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00626	    POV2=0
	MOVE?CB	000h, _POV2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00627	    if P2keys.3 then
	CMPF?TL	_P2Keys??3, L00130

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00628	        if P2keys.2 then
	CMPF?TL	_P2Keys??2, L00132

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00629	            POV2=6
	MOVE?CB	006h, _POV2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00630	        elseif P2keys.1 then
	GOTO?L	L00133
	LABEL?L	L00132	
	CMPF?TL	_P2Keys??1, L00134

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00631	            POV2=8
	MOVE?CB	008h, _POV2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00632	        else
	GOTO?L	L00133
	LABEL?L	L00134	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00633	            pov2=7
	MOVE?CB	007h, _POV2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00634	        endif 
	LABEL?L	L00133	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00635	        return
	RETURN?	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00636	    endif
	LABEL?L	L00130	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00637	    if P2keys.2 then
	CMPF?TL	_P2Keys??2, L00136

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00638	        if P2keys.4 then
	CMPF?TL	_P2Keys??4, L00138

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00639	            POV2=4
	MOVE?CB	004h, _POV2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00640	        else
	GOTO?L	L00139
	LABEL?L	L00138	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00641	            pov2=5
	MOVE?CB	005h, _POV2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00642	        endif
	LABEL?L	L00139	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00643	        return
	RETURN?	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00644	    endif 
	LABEL?L	L00136	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00645	    if P2keys.4 then
	CMPF?TL	_P2Keys??4, L00140

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00646	        if P2keys.1 then
	CMPF?TL	_P2Keys??1, L00142

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00647	            POV2=2
	MOVE?CB	002h, _POV2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00648	        else
	GOTO?L	L00143
	LABEL?L	L00142	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00649	            pov2=3
	MOVE?CB	003h, _POV2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00650	        endif
	LABEL?L	L00143	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00651	        return
	RETURN?	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00652	    endif 
	LABEL?L	L00140	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00653	    if P2keys.1 then
	CMPF?TL	_P2Keys??1, L00144

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00654	        if P2keys.3 then
	CMPF?TL	_P2Keys??3, L00146

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00655	            POV2=8
	MOVE?CB	008h, _POV2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00656	        else
	GOTO?L	L00147
	LABEL?L	L00146	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00657	            pov2=1
	MOVE?CB	001h, _POV2

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00658	        endif
	LABEL?L	L00147	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00659	    endif       
	LABEL?L	L00144	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00660	return
	RETURN?	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00662	disable
	DISABLE?	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00663	SerialIn:

	LABEL?L	_SerialIn	

; C:\TEMP\DCLFI32V1.0\FIRMAC01.PBP	00665	resume 
	RESUME?	

	END
