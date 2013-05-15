s.waitForBoot{
	Ndef(\seq3).play;
	Ndef(\seq3, {SinOsc.ar(Demand.ar(Impulse.ar(40), 0, Dseq([SinOsc.kr(1).exprange(400, 4000), SinOsc.kr(1.1).exprange(400, 4000)], inf)))!2})
}
