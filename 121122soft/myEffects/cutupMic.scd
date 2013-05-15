//this will mess up sound from mic
Ndef(\cutup, {Pan2.ar( DelayC.ar(SoundIn.ar(0), 1, LFNoise0.ar(10).range(0, 1)), 0)}).play
