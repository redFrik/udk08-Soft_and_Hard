//example piece with mixed manual instructions and automation
//---------init
(
s.waitForBoot{
	"hello - i'm ready".postln;
	s.meter;
	NdefMixer(s);
	Ndef(\testSound, {PinkNoise.ar(0.1)!2}).play(vol: 0);
	Ndef(\testSound2, {WhiteNoise.ar(0.1)!2}).play(vol: 0);
	Ndef(\testSound3, {BrownNoise.ar(0.1)!2}).play(vol: 0);
}
)

//---------start of the piece
//start with pink noise - fade in to ~0.4

//then fade in brown after 1min - fade in to ~0.8
//then fade out brown after 1min - fade in to 0.0

//last run this to wobble...
(
Ndef(\testSound).fadeTime= 20;//cross fade in 20sec
Ndef(\testSound, {PinkNoise.ar(SinOsc.ar(2)*0.1)!2});
)

//---------finish end
Ndef(\testSound).release(10);//fade out in 10sec
Ndef(\testSound2).stop
Ndef(\testSound3).stop;

//for distriburing code see the Standalone Template
