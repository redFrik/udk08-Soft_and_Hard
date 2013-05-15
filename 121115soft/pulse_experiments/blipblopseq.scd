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
	tick= Impulse.ar(30);	//three times per second
	freq= TRand.ar(400, 4000, tick); //(trigger random) pick random frequency
	dec= TRand.ar(0.01, 0.03, tick); //another trigger random for decay time
	mel= Ringz.ar(tick, freq, dec);
	mel;
}).play;
)
Ndef(\seq).release
