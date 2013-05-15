//transpose sound from mic.  0.01 is rate of transposition
Ndef(\doppler, {Pan2.ar( DelayC.ar(SoundIn.ar(0), 5, SinOsc.ar(0.01).range(0.1, 5)), 1)}).play