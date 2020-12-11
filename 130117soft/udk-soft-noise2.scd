//--noise

//(and pd<->sc communication with osc if there's time/interest)


s.boot

Ndef(\noise).play

Ndef(\noise, {WhiteNoise.ar([0.2, 0.2])})
Ndef(\noise, {WhiteNoise.ar([MouseX.kr(0, 0.2), MouseY.kr(0, 0.2)])})
Ndef(\noise).stop

white noise = 1.0.rand2  //from -1.0 to 1.0 random float value

prev= 0.5
newSample= prev+0.1.rand2

PinkNoise is sometimes called 1/f noise

{WhiteNoise.ar}.play
{PinkNoise.ar}.play
Ndef(\noise, {LPF.ar(WhiteNoise.ar([0.2, 0.2]), MouseX.kr(100, 10000, 1))})
Ndef(\noise).play

Ndef(\noise, {BrownNoise.ar([0.3, 0.3])})
Ndef(\noise).play

//automatic control of the filter
Ndef(\noise, {LPF.ar(WhiteNoise.ar([0.2, 0.2]), SinOsc.kr(1).exprange(100, 10000))})


Ndef(\noise, {WhiteNoise.ar([0.1, 0.1])})
Ndef(\noise, {PinkNoise.ar([0.1, 0.1])})
Ndef(\noise, {BrownNoise.ar([0.1, 0.1])})


//more variants...
Ndef(\noise, {ClipNoise.ar([0.1, 0.1])})
Ndef(\noise, {GrayNoise.ar([0.1, 0.1])})
Ndef(\noise, {Crackle.ar([1.98, 1.98])})//from 1.6 up 1.999
Ndef(\noise, {Crackle.ar([1.8, 1.8])})
Ndef(\noise, {Crackle.ar([1.6, 1.6])})
Ndef(\noise, {Dust2.ar([100, 100])})//Dust2 is from -1 to 1, Dust 0 to 1

//these are good for controlling things (lfo)
Ndef(\noise, {LFNoise2.ar([1000, 1000])})
Ndef(\noise, {LFNoise1.ar([1000, 1000])})
Ndef(\noise, {LFNoise0.ar([1000, 1000])})
//LFNoise stand for LowFrequencyNoise
LFNoise0 is discrete (jumps between random values)
LFNoise1 is smoothed (ramps between random values)
LFNoise2 is more smoothed (ramps slower between random values)

//see sc3-plugins for Perlin3 noise ugen

Ndef(\lfo).play
Ndef(\lfo, {SinOsc.ar(LFNoise2.kr(5).exprange(400, 4000))*0.1!2})
Ndef(\lfo, {SinOsc.ar(LFNoise2.kr([5, 5]).exprange(400, 4000))*0.1})
Ndef(\lfo).stop


//--useful?
Ndef(\waves).play
(
Ndef(\waves, {
	var amp= LFNoise2.kr(0.6).lagud(0, 15);
	var src= GrayNoise.ar(amp);
	var pan= LFNoise2.kr(0.1);
	Pan2.ar(src, pan);
});
)
Ndef(\waves).release(5)



(
Ndef(\waves, {
	var amp= LFNoise2.kr(0.6).lagud(0, 15);
	var src= GrayNoise.ar(amp);
	var pan= LFNoise2.kr(0.1);
	var flt= BPF.ar(src, LFNoise2.kr(0.2).exprange(500, 5000));
	Pan2.ar(flt, pan);
});
)
Ndef(\waves).release(5)




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

Ndef(\test, {Pan2.ar(WhiteNoise.ar)})
50.do{|i| Ndef(\test++i, {Pan2.ar(WhiteNoise.ar)})}


//Randomness in sc help
//https://www.earslap.com/instruction/recreating-the-thx-deep-note






//subtractive synthesis & filtered noise
Ndef(\pitch).play
Ndef(\pitch, {WhiteNoise.ar([0.2, 0.2])})
Ndef(\pitch, {BPF.ar(WhiteNoise.ar([0.2, 0.2]), 900, 0.001)*7})
Ndef(\pitch).stop

Ndef(\pitch0).play
Ndef(\pitch0, {BPF.ar(WhiteNoise.ar([0.2, 0.2]), 900, 0.001)*7})
Ndef(\pitch1).play
Ndef(\pitch1, {BPF.ar(WhiteNoise.ar([0.2, 0.2]), 1000, 0.001)*7})
Ndef(\pitch2).play
Ndef(\pitch2, {BPF.ar(WhiteNoise.ar([0.2, 0.2]), 1200, 0.001)*7})
Ndef(\pitch3).play
Ndef(\pitch3, {BPF.ar(WhiteNoise.ar([0.2, 0.2]), 1400, 0.001)*7})
Ndef(\pitch4).play
Ndef(\pitch4, {BPF.ar(WhiteNoise.ar([0.2, 0.2]), 1500, 0.001)*7})
Ndef(\pitch3).release(10)
Ndef(\pitch1).release(10)
Ndef(\pitch0).release(10)
Ndef(\pitch2).release(10)
Ndef(\pitch4).release(10)

Ndef(\pitch).play
Ndef(\pitch, {WhiteNoise.ar([0.2, 0.2])})
Ndef(\pitch, {BPF.ar(WhiteNoise.ar([0.2, 0.2]), LFNoise2.ar(0.4).exprange(880, 920), 0.001)*7})

Ndef(\pitch, {LPF.ar(WhiteNoise.ar([0.2, 0.2]), MouseX.kr(100, 10000, 1))})
Ndef(\pitch, {HPF.ar(WhiteNoise.ar([0.2, 0.2]), MouseX.kr(100, 10000, 1))})
Ndef(\pitch, {LPF.ar(HPF.ar(WhiteNoise.ar([0.2, 0.2]), 700), 600)}) //almost like a BPF at 650hz with 100hz width

//BandRejectFilter is the opposite of BandPassFilter
Ndef(\pitch, {BRF.ar(WhiteNoise.ar([0.2, 0.2]), MouseX.kr(100, 10000, 1), 0.5)})


Ndef(\pitch, {MoogFF.ar(WhiteNoise.ar([0.2, 0.2]), MouseX.kr(100, 10000, 1), 3)})
Ndef(\pitch, {MoogFF.ar(WhiteNoise.ar([0.2, 0.2]), MouseX.kr(100, 10000, 1), LFNoise2.kr(1).range(2, 3.8))})
Ndef(\pitch).play
Ndef(\pitch).stop

Ndef(\pitch, {Resonz.ar(WhiteNoise.ar([0.2, 0.2]), MouseX.kr(100, 10000, 1), MouseY.kr(0.05, 1))})


//install and try DFM1 from sc3-plugins

//BEQ collection of filters (BEQ suite)
Ndef(\pitch, {BLowPass.ar(WhiteNoise.ar([0.2, 0.2]), MouseX.kr(100, 10000, 1), MouseY.kr(0.05, 1))})
Ndef(\pitch).play

Ndef(\pitch, {BHiPass.ar(WhiteNoise.ar([0.2, 0.2]), MouseX.kr(100, 10000, 1), MouseY.kr(0.05, 1))})
Ndef(\pitch, {BBandPass.ar(WhiteNoise.ar([0.2, 0.2]), MouseX.kr(100, 10000, 1), MouseY.kr(0.05, 1))})
Ndef(\pitch, {BLowPass4.ar(WhiteNoise.ar([0.2, 0.2]), MouseX.kr(100, 10000, 1), MouseY.kr(0.05, 1))})
