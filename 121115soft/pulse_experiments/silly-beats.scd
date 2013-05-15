//this will play a silly little beat

Ndef(\bassdrum).quant= 1;
Ndef(\ping).quant= 1;
Ndef(\bassdrum, {Ringz.ar(Mix(Impulse.ar(114/60)), 60, 0.6, 0.5)}).play;
Ndef(\ping, {Ringz.ar(Mix(Impulse.ar(114/60*2)), 500, 1, 0.4)}).play;
