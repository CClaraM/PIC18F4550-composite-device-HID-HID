
' USB descriptors for a HID device
'USBMEMORYADDRESS Con	$400	' USB RAM starts here (set in device header file)
USBMEMORYSIZE	Con	256	' USB RAM size in bytes
USBReservedMemory Var Byte[USBMEMORYSIZE] USBMEMORYADDRESS	' Reserve memory used by USB assembler code

goto	hid_desc_end	' Skip over all of the USB assembler code
asm

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
endasm
hid_desc_end
 
 
