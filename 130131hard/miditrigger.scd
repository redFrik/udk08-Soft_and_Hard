s.latency= 0;

MIDIIn.connectAll;
MIDIClient.sources

Ndef(\sound1, {|t_trig= 0| Pan2.ar(WhiteNoise.ar(EnvGen.ar(Env.perc, t_trig)*0.1))})
Ndef(\sound2, {|onoff= 0| Pan2.ar(Saw.ar(400, EnvGen.ar(Env.asr, onoff)))})
Ndef(\sound1).play
Ndef(\sound2).play
(
MIDIFunc.noteOn({|val, note|		//one shot trigger
	[val, note].postln;
	Ndef(\sound1).set(\t_trig, 1);
}, 80);		//listen to midinote 80 on

MIDIFunc.noteOn({|val, note|		//gate trigger with on and off
	[val, note].postln;
	Ndef(\sound2).set(\onoff, 1);
}, 81);		//listen to midinote 81 on
MIDIFunc.noteOff({|val, note|
	[val, note].postln;
	Ndef(\sound2).set(\onoff, 0);
}, 81);		//listen to midinote 81 off
)
