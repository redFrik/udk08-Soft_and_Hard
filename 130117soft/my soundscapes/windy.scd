//this one is ok for windy type soundscapes...
s.boot
Ndef(\wave0).play
Ndef(\wave1).play
Ndef(\wave2).play
Ndef(\wave3).play
(
Ndef(\wave0, {
	var amp= LFNoise2.kr(0.6).lagud(0, 15);
	var src= WhiteNoise.ar(amp);
	var pan= LFNoise2.kr(0.1);
	var flt= BPF.ar(src, LFNoise2.kr(0.2).exprange(500, 5000), 0.1);
	Pan2.ar(flt, pan);
});
Ndef(\wave1, {
	var amp= LFNoise2.kr(0.6).lagud(0, 15);
	var src= BrownNoise.ar(amp);
	var pan= LFNoise2.kr(0.1);
	Pan2.ar(src, pan);
});
Ndef(\wave2, {
	var amp= LFNoise2.kr(0.6).lagud(0, 15);
	var src= PinkNoise.ar(amp);
	var pan= LFNoise2.kr(0.1);
	var flt= BPF.ar(src, LFNoise2.kr(0.2).exprange(500, 5000), 0.4);
	Pan2.ar(flt, pan);
});
Ndef(\wave3, {
	var amp= LFNoise2.kr(0.6).lagud(0, 15);
	var src= GrayNoise.ar(amp);
	var pan= LFNoise2.kr(0.1);
	var flt= BPF.ar(src, LFNoise2.kr(0.2).exprange(500, 5000), 1);
	Pan2.ar(flt, pan);
});
)
