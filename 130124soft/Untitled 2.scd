s.boot
Ndef(\seq1).play
Ndef(\seq1, {SinOsc.ar(Duty.ar(0.25, 0, Dseq([400, 600, 500, 530], inf)))})
Ndef(\seq1, {SinOsc.ar(Duty.ar(0.25, 0, Dseq([1400, 600, 500, 530], inf)))})
Ndef(\seq1, {SinOsc.ar(Duty.ar(0.025, 0, Dseq([400, 1600, 500, 530, 500, 600, 700], inf)))})
Ndef(\seq1, {SinOsc.ar(Duty.ar(0.25, 0, Dseq([400, 600, 1500, 530], inf)))})
Ndef(\seq1, {SinOsc.ar(Duty.ar(0.25, 0, Dseq([400, 600, 500, 1530], inf)))})
Ndef(\seq1).release

//see Demand and Duty helpfiles
//similar to Patterns but run on the server

//now with cross fade time
Ndef(\seq1).fadeTime= 10
//all changes will cross fade with 10sec from now on
Ndef(\seq1).play



Ndef(\seq1).clear
Ndef(\seq1).play
Ndef(\seq1).numChannels
Ndef(\seq1).fadeTime= 10
//now in stereo
Ndef(\seq1, {SinOsc.ar(Duty.ar(0.25, 0, Dseq([400, 600, 1500, 530], inf)))})
Ndef(\seq1, {SinOsc.ar(Duty.ar([0.25, 0.3], 0, Dseq([400, 600, 1500, 530], inf)))})
Ndef(\seq1, {SinOsc.ar(Duty.ar([0.125, 0.124], 0, Dseq([400, 600, 1500, 530], inf)))})
Ndef(\seq1, {SinOsc.ar(Duty.ar([0.125, 0.124], 0, Dseq([400, 600, 1500, 1530, 2530], inf)))})

Ndef(\seq1, {Splay.ar(SinOsc.ar(Duty.ar([0.125, 0.124, 0.12, 0.11, 0.3], 0, Dseq([400, 600, 1500, 1530, 2530], inf))))})
Ndef(\seq1).release(2)

//compare these two...
Ndef(\seq1).play
Ndef(\seq1, {SinOsc.ar(Duty.ar([0.25, 0.24], 0, Dseq([400, 600, 1500, 530], inf)))})
Ndef(\seq1, {SinOsc.ar(Duty.ar([0.25, 0.24], 0, {Dseq([400, 600, 1500, 530], inf)}!2))})





//multi channel expations
Ndef(\test).play
Ndef(\test, {Splay.ar(SinOsc.ar([400, 500, 600, 700, 800, 900], 0, 0.1))})


//--more d stuff - nesting Dseq
Ndef(\seq2).play
Ndef(\seq2, {SinOsc.ar(Duty.ar(0.25, 0, Dseq([400, 500, 600, 700], inf)))!2})
//and now we replace 700 with another Dseq
Ndef(\seq2, {SinOsc.ar(Duty.ar(0.25, 0, Dseq([400, 500, 600, Dseq([1500, 1440], 3)], inf)))!2})
Ndef(\seq2, {SinOsc.ar(Duty.ar(0.125, 0, Dseq([400, 500, 600, Dseq([Dseq([500, 400, Dseq([2000, 3000], 4), 100], 2), 1440], 3)], inf)))!2})


//--random choice with Drand
Ndef(\seq2).play
Ndef(\seq2, {SinOsc.ar(Duty.ar(0.25, 0, Drand([400, 500, 600, 700], inf)))!2})
Ndef(\seq2, {SinOsc.ar(Duty.ar(0.25, 0, Dxrand([400, 500, 600, 700], inf)))!2})
Ndef(\seq2, {SinOsc.ar(Duty.ar(0.25, 0, Dseq([400, 500, 600, Drand([700, 800], 1)], inf)))!2})
Ndef(\seq2, {SinOsc.ar(Duty.ar(0.25, 0, Dseq([400, 500, 600, Drand([700, Dseq([800, 900, 1000], 1)], 1)], inf)))!2})

//also see Dwrand helpfile, and search in docs for 'demand rate' to read more


//Demand - uses a 'trigger' like Impulse to step through the sequence (Dseq)
Ndef(\seq3).play
Ndef(\seq3, {SinOsc.ar(Demand.kr(Impulse.kr(4), 0, Dseq([400, 500, 600, 700], inf)))!2})
Ndef(\seq3, {SinOsc.ar(Demand.kr(Amplitude.kr(SoundIn.ar, 0.5, 1)>0.5, 0, Dseq([400, 500, 600, 700], inf)))!2})

Ndef(\seq3, {SinOsc.ar(Demand.ar(SinOsc.ar(MouseX.kr(2, 200, 1)), 0, Dseq([400, 500, 600, 700, 800, 900], inf)))!2})



Ndef(\seq3, {SinOsc.ar(Demand.ar(Pulse.ar(MouseX.kr(2, 200, 1)), 0, Dseq([Dseq([1000, 200], 5), MouseY.kr(500, 5000, 1), 600, Drand([700, 720, 730], 1), 800, 900], inf)))!2})


Ndef(\seq3).play
Ndef(\seq3, {SinOsc.ar(Demand.ar(Impulse.ar(4), 0, Dseq([SinOsc.kr(1).exprange(400, 4000), SinOsc.kr(1.1).exprange(400, 4000)], inf)))!2})
Ndef(\seq3, {SinOsc.ar(Demand.ar(Impulse.ar(40), 0, Dseq([SinOsc.kr(1).exprange(400, 4000), SinOsc.kr(1.1).exprange(400, 4000)], inf)))!2})
Ndef(\seq3).release
