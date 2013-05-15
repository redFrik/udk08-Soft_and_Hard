//--example: select something and press 'esc'
(
Document.current.keyDownAction= {|...args|
	var str;
	if(args[3]==27, {	//esc key
		"".postln;
		str= args[0].selectedString.ascii.clump(6);
		fork{
			str.do{|bytes|
				var data= bytes.collect{|x| [1]++(1-x.asBinaryDigits.reverse)++[0]}.flat;
				Synth(\serialAudio, [\data, data]);
				(1/9600*61+0.005).wait;
			};
		};
	});
};
s.waitForBoot{
	SynthDef(\serialAudio, {|vol= 0.5|			//for sending out serial via audio
		var data= Control.names([\data]).kr(Array.fill(60, 0));
		var src= Duty.ar(Dseq(1/9600!61), 0, Dseq(data++0, inf), 2);
		Out.ar([0, 1, 10], src*vol);
	}).add;
	SynthDef(\audioSerial, {|thresh= 0.0025|	//for receiving serial via audio
		var raw= InFeedback.ar(10);	//input sound
		var src= raw>thresh;
		var reading= DelayC.ar(Trig1.ar(src, 1/9600*9), 1/9600/2, 1/9600/2);
		var osc= Phasor.ar(reading, 9600/SampleRate.ir);
		var clock= (osc-Delay1.ar(osc))<0+Impulse.ar(0);
		var index= PulseCount.ar(clock, reading);
		var stopTrig= index>7;
		var data= Latch.ar(src, index>=#[7, 6, 5, 4, 3, 2, 1]);
		var byte= (1-data).sum{|x, i| 2**(6-i)*x};
		SendReply.ar(stopTrig, '/data', byte);	//send back 8bit result to sclang
		DC.ar(0);
	}).add;
	//OSCFunc({|msg| msg[3].asInteger.asAscii.post}, '/data');//sc3.5
	OSCresponder(s.addr, '/data', {|t, r, msg| msg[3].asInteger.asAscii.post}).add;//sc3.4
	s.sync;
	Synth(\audioSerial);
};
)