(
s.waitForBoot{
	SynthDef(\audioSerial, {|thresh= 0.0025| //for receiving serial via audio
		var raw= 0-SoundIn.ar(0);	//input sound
		var src= raw>MouseX.kr(0, 1);	//mouse set threshold
		var reading= DelayC.ar(Trig1.ar(src, 1/9600*9), 1/9600/2, 1/9600/2);
		var osc= Phasor.ar(reading, 9600/SampleRate.ir);
		var clock= (osc-Delay1.ar(osc))<0+Impulse.ar(0);
		var index= PulseCount.ar(clock, reading);
		var stopTrig= index>7;
		var data= Latch.ar(src, index>=#[7, 6, 5, 4, 3, 2, 1]);
		var byte= (1-data).sum{|x, i| 2**(6-i)*x};
		SendReply.ar(stopTrig, '/data', byte);//send back 8bit result to sclang
		DC.ar(0);
		Out.ar(0, raw);
	}).add;
	OSCresponder(s.addr, '/data', {|t, r, msg| msg[3].asInteger.postln}).add;//sc3.4
	s.sync;
	Synth(\audioSerial);
};
)

/*
65.asAscii
70.asAscii
*/
