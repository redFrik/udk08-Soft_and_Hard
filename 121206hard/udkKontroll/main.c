//f.olofsson dec2012


#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/wdt.h>
#include <avr/pgmspace.h>
#include "usbdrv.h"
#include <util/delay.h>

static uchar reportBuffer[2];				//buffer for HID reports
static uchar idleRate;						//in 4 ms units
uchar changed;
uchar lastPINB, lastPIND;

uchar usbFunctionSetup(uchar data[8]) {
	usbRequest_t *rq = (void *)data;
    
    usbMsgPtr = reportBuffer;
    if((rq->bmRequestType & USBRQ_TYPE_MASK) == USBRQ_TYPE_CLASS){
        if(rq->bRequest == USBRQ_HID_GET_REPORT){
            return sizeof(reportBuffer);
        }else if(rq->bRequest == USBRQ_HID_GET_IDLE){
            usbMsgPtr = &idleRate;
            return 1;
        }else if(rq->bRequest == USBRQ_HID_SET_IDLE){
            idleRate = rq->wValue.bytes[1];
        }
    }else{
    }
	return 0;
}

int main() {
    
    //--setup
    changed= 0;
    PORTB= 0b11111111;      //internal pull-ups
    PORTD= 0b01110011;      //internal pull-ups
    lastPINB= 0;           //used to detect changes
    lastPIND= 0;           //used to detect changes
    wdt_enable(WDTO_1S);    //enable 1s watchdog timer
    usbInit();
    usbDeviceDisconnect();  //enforce re-enumeration, do this while interrupts are disabled!
    uchar i= 0;
    while(--i) {            //fake USB disconnect for > 250 ms
        wdt_reset();
        _delay_ms(1);
    }
    usbDeviceConnect();
    sei();                  //Enable interrupts after re-enumeration
    
    //--loop
    while(1) {
        wdt_reset(); // keep the watchdog happy
        usbPoll();
        
        if(PINB!=lastPINB) {
            changed= 1;
            lastPINB= PINB;
            reportBuffer[0]= lastPINB;
        }
        if((PIND&0b01110011)!=lastPIND) {
            changed= 1;
            lastPIND= PIND&0b01110011;
            reportBuffer[1]= lastPIND;
        }
        
        if(usbInterruptIsReady()&&changed) {
			usbSetInterrupt(reportBuffer, sizeof(reportBuffer));
			changed= 0;
		}
    }
    return 0;
}

const PROGMEM char usbHidReportDescriptor[USB_CFG_HID_REPORT_DESCRIPTOR_LENGTH] = { //USB report descriptor
	0x05, 0x01,        // USAGE_PAGE (Generic Desktop)
	0x09, 0x04,        // USAGE (Joystick)
	0xa1, 0x01,        // COLLECTION (Application)
	
	0x09, 0x30,        // USAGE (dig0)
	0x15, 0x00,        // LOGICAL_MINIMUM (0)
	0x26, 0xff, 0x00,  // LOGICAL_MAXIMUM (255)
	0x75, 0x08,        // REPORT_SIZE (8)
	0x95, 0x01,        // REPORT_COUNT (1)
	0x81, 0x02,        // INPUT (Data,Var,Abs)
	
	0x09, 0x31,        // USAGE (dig1)
	0x15, 0x00,        // LOGICAL_MINIMUM (0)
	0x26, 0xff, 0x00,  // LOGICAL_MAXIMUM (255)
	0x75, 0x08,        // REPORT_SIZE (8)
	0x95, 0x01,        // REPORT_COUNT (1)
	0x81, 0x02,        // INPUT (Data,Var,Abs)
	
	0xc0               // END_COLLECTION
};
