
/*
//arduino mega code
void setup() {
  Serial.begin(115200);
}
void loop() {
  Serial.write(253);
  Serial.write(254);
  serialPrint(analogRead(A0));
  serialPrint(analogRead(A1));
  serialPrint(analogRead(A2));
  serialPrint(analogRead(A3));
  serialPrint(analogRead(A4));
  serialPrint(analogRead(A5));
  serialPrint(analogRead(A6));
  serialPrint(analogRead(A7));
  serialPrint(analogRead(A8));
  serialPrint(analogRead(A9));
  Serial.write(255);
  //delay(1);
}
void serialPrint(int val) {
  Serial.write(val>>2);  //bits 2-9
  Serial.write(val&3);   //bits 0-1
}
*/


//supercollider code for reading ten 10bit analog values
//protocol: 253 254 nn nn nn nn nn nn nn nn nn nn nn nn nn nn nn nn nn nn nn nn 255
//nn comes in pairs. first nn are the upper 8bits and the second are the lower 2 bits. A0 to A9 in order
(
var port= SerialPort("/dev/tty.usbmodemfa131", 115200, crtscts: true);
Routine.run({
	var byte, index= 0, payload= Array.newClear(20), data= Array.newClear(10);
	inf.do{
		while({byte= port.read; byte.notNil}, {
			//byte.postln;	//debug
			if(index==0 and:{byte==253}, {
				index= 1;
			}, {
				if(index==1 and:{byte==254}, {
					index= 2;
				}, {
					if(index>=2 and:{index<22}, {
						payload[index-2]= byte;
						index= index+1;
					}, {
						if(index==22 and:{byte==255}, {
							//payload.postln;	//debug
							//--everything seems ok so decode payload
							10.do{|i|
								data[i]= (payload[i*2]<<2)+payload[i*2+1];
							};
							//--finished - do something here
							data.postln;

							index= 0;
						}, {
							//--something broke or beginning - restart
							"restart".postln;	//debug
							index= 0;
						});
					});
				});
			});

		});
	};
});
CmdPeriod.doOnce({port.close});
)
