//(im)pulses


s.boot

1+4+6

2+3+100000

Ndef(\impulse, {Impulse.ar([1, 1.05])}).play
//multi-channel expansion []

Ndef(\impulse).stop


//german keyboard layout
(		//shift+8
)       //shift+9
[		//alt+5
]       //alt+6
{		//alt+8
}       //alt+9

//regular rhythms

Ndef(\impulse, {Impulse.ar([4, 5])}).play
//click 4times per sec in left and click 5times/sec in right speaker

Ndef(\impulse, {Impulse.ar([2, 3])}).play
Ndef(\impulse, {Impulse.ar([2.5, 3.6])}).play

Ndef(\impulseTwo, {Mix(Impulse.ar([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]))}).play
Ndef(\impulseTwo, {Mix(Impulse.ar([7/5, 8/5]))}).play
Ndef(\impulseTwo, {Mix(Impulse.ar([2/3, 1/3]))}).play

Ndef(\rhythm, {Resonz.ar(Mix(Impulse.ar([3, 4])), 500, 0.1, 10)}).play;
Ndef(\rhythm2, {Resonz.ar(Mix(Impulse.ar([1, 1])), 800, 0.1, 10)}).play;
Ndef(\rhythm3, {Resonz.ar(Mix(Impulse.ar([0.5, 0.5])), 1600, 0.1, 10)}).play;


//bpm 114/60
//bpm 120/60
Ndef(\bassdrum).quant= 1;
Ndef(\ping).quant= 1;
Ndef(\bassdrum, {Ringz.ar(Mix(Impulse.ar(114/60)), 60, 0.6, 0.5)}).play;
Ndef(\ping, {Ringz.ar(Mix(Impulse.ar(114/60*2)), 500, 1, 0.4)}).play;





//nesting unit-generators
Ndef(\ping, {GVerb.ar(Mix(Impulse.ar(114/60*2)), 50)}).play
Ndef(\ping, {FreeVerb.ar(Mix(Impulse.ar(114/60*2)), 0.5)}).play

//impulses -> ringing filter -> reverb -> speaker:
Ndef(\ping, {GVerb.ar(Ringz.ar(Mix(Impulse.ar(114/60*2)), 500, 1, 0.4), 50)}).play





//irregular rhythms:

Ndef(\myDust, {Dust.ar(1)}).play //rougly once per second
Ndef(\myDust, {Dust.ar(10)}).play //roughly 10 per second
Ndef(\myDust, {Dust.ar(100)}).play //roughly 100 per second


Ndef(\ping, {GVerb.ar(Ringz.ar(Mix(Dust.ar(114/60*2)), 500, 1, 0.4), 50)}).play
Ndef(\ping).fadeTime= 15;	//now with five seconds crossfade

Ndef(\ping, {GVerb.ar(Ringz.ar(Mix(Dust.ar(0.1)), 400, 1, 0.7), 50)}).play
Ndef(\ping, {GVerb.ar(Ringz.ar(Mix(Dust.ar(0.2)), 500, 1, 0.6), 40)}).play
Ndef(\ping, {GVerb.ar(Ringz.ar(Mix(Dust.ar(0.3)), 600, 1, 0.5), 30)}).play
Ndef(\ping, {GVerb.ar(Ringz.ar(Mix(Dust.ar(0.4)), 700, 1, 0.4), 20)}).play
Ndef(\ping, {GVerb.ar(Ringz.ar(Mix(Dust.ar(0.5)), 800, 1, 0.4), 20)}).play
Ndef(\ping, {GVerb.ar(Ringz.ar(Mix(Dust.ar(0.5)), 900, 1, 0.4), 20)}).play
Ndef(\ping, {GVerb.ar(Ringz.ar(Mix(Impulse.ar(5)), 1000, 1, 0.4), 20)}).play
Ndef(\ping, {GVerb.ar(Ringz.ar(Mix(Impulse.ar(5)), 1100, 1, 0.4), 20)}).play
Ndef(\ping, {GVerb.ar(Ringz.ar(Mix(Impulse.ar(5)), 1200, 1, 0.4), 20)}).play
Ndef(\ping).release

//nesting 2 gverbs to get even longer reverberation:
Ndef(\ping, {GVerb.ar(GVerb.ar(Ringz.ar(Mix(Dust.ar(0.1)), 400, 1, 0.7), 50), 80)}).play



//nesting 3 gverbs...
Ndef(\ping, {GVerb.ar(GVerb.ar(GVerb.ar(Ringz.ar(Mix(Impulse.ar(0.25)), 500, 1, 0.5), 50), 80), 90)}).play

//same thing but formatted differently
(
Ndef(\ping, {
	GVerb.ar(
		GVerb.ar(
			GVerb.ar(
				Ringz.ar(
					Mix(
						Impulse.ar(0.25)
					), 500, 1, 0.5
				), 50
			), 80
		), 90
	)
}).play
)

//yet another way of writing the same thing (using variables)...
(
Ndef(\ping, {
	var imp, filt, rev1, rev2, rev3;
	imp= Mix(Impulse.ar(0.25));
	filt= Ringz.ar(imp, 500, 1, 0.5);
	rev1= GVerb.ar(filt, 50);
	rev2= GVerb.ar(rev1, 80);
	rev3= GVerb.ar(rev2, 90);
	rev3;
}).play
)


////////////////////////////////////////
(
Ndef(\seq, {
	var tick, mel, freq, dec;	//declare variables here
	tick= Impulse.ar(3);	//three times per second
	freq= TRand.ar(400, 4000, tick); //(trigger random) pick random frequency
	dec= TRand.ar(0.2, 0.7, tick); //another trigger random for decay time
	mel= Ringz.ar(tick, freq, dec);
	mel;
}).play;
)


Ndef(\seq).fadeTime= 4

(
Ndef(\seq, {
	var tick, mel, freq, dec;	//declare variables here
	tick= Impulse.ar(30);	//three times per second
	freq= TRand.ar(400, 4000, tick); //(trigger random) pick random frequency
	dec= TRand.ar(0.2, 0.7, tick); //another trigger random for decay time
	mel= Ringz.ar(tick, freq, dec);
	mel;
}).play;
)
(
Ndef(\seq, {
	var tick, mel, freq, dec;	//declare variables here
	tick= Impulse.ar(30);	//three times per second
	freq= TRand.ar(4000, 5000, tick); //(trigger random) pick random frequency
	dec= TRand.ar(0.2, 0.7, tick); //another trigger random for decay time
	mel= Ringz.ar(tick, freq, dec);
	mel;
}).play;
)
(
Ndef(\seq, {
	var tick, mel, freq, dec;	//declare variables here
	tick= XFade2.ar(Impulse.ar(40), Dust.ar(40), MouseX.kr(-1, 1));//crossfade using mouse
	freq= TRand.ar(400, 4000, tick); //(trigger random) pick random frequency
	dec= TRand.ar(0.01, 0.03, tick); //another trigger random for decay time
	mel= Ringz.ar(tick, freq, dec);
	mel;
}).play;
)
Ndef(\seq).release



//using Line to do simple gestures




Ndef(\gesture, {Impulse.ar(Line.ar(1, 100, 5))}).play //from 1 to 100 in 5sec
Ndef(\gesture, {Impulse.ar(Line.ar(400, 5, 3))}).play
Ndef(\gesture, {Impulse.ar(Line.ar(5, 0.4, 1))}).play


(
Ndef(\seq, {
	var tick, mel, freq, dec;	//declare variables here
	tick= Impulse.ar(Line.ar(3, 60, 10));
	freq= TRand.ar(Line.ar(4000, 100, 10), Line.ar(5000, 8000, 10), tick); //(trigger random) pick random frequency
	dec= TRand.ar(0.2, 0.7, tick); //another trigger random for decay time
	mel= Ringz.ar(tick, freq, dec);
	mel;
}).play;
)



//extra confusion - if you want
(
Ndef(\seq, {
	var tick, mel, freq, dec;	//declare variables here
	tick= Impulse.ar(Line.ar(0, 1, 4).lincurve(0, 1, 4, 400, -10));
	freq= TRand.ar(4000, 5000, tick); //(trigger random) pick random frequency
	dec= TRand.ar(0.2, 0.7, tick); //another trigger random for decay time
	mel= Ringz.ar(tick, freq, dec);
	mel;
}).play;
)
(
Ndef(\seq, {
	var tick, mel, freq, dec;	//declare variables here
	tick= Impulse.ar(Phasor.ar(0, 0.001, 4, 40));
	freq= TRand.ar(4000, 5000, tick); //(trigger random) pick random frequency
	dec= TRand.ar(0.2, 0.7, tick); //another trigger random for decay time
	mel= Ringz.ar(tick, freq, dec);
	mel;
}).play;
)
//use Phasor for 'repeating' Line
//or EnvGen or LFSaw

