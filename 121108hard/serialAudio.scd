(
//GUI.qt;
//s.scope;
s.waitForBoot{
	SynthDef(\serialAudio, {|vol= 1|			//for sending out serial via audio
		var data= Control.names([\data]).kr(Array.fill(10, 0));
		var src= Duty.ar(1/9600, 0, Dseq(data), 2);
		Out.ar(0, src*vol!2);
	}).add;
	s.sync;

	Routine.run({
		inf.do{|i|
			var x= sin(i*0.05).lincurve(-1, 1, 0, 255, 3).asInteger;
			var z= [1]++(1-x.asBinaryDigits.reverse)++[0];
			Synth(\serialAudio, [\data, z.postln]);
			0.01.wait;
		};
	});

};
)
 