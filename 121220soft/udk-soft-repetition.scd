s.boot

//--mouse experiments

Ndef(\mouse).play

Ndef(\mouse, {Saw.ar(MouseY.kr(400, 4000))})

Ndef(\mouse).stop

Ndef(\mouse, {SinOsc.ar(MouseButton.kr(400, 4000))}).play
Ndef(\mouse).stop

Ndef(\chord).play
(
Ndef(\chord, {
	LPF.ar(Saw.ar(MouseX.kr(50, 500)), MouseY.kr(50, 1500))
	+
	LPF.ar(Saw.ar(MouseX.kr(60, 600)), MouseY.kr(60, 1600))
	+
	LPF.ar(Saw.ar(MouseX.kr(75, 1700)), MouseY.kr(70, 1700))
	+
	LPF.ar(Saw.ar(MouseX.kr(80, 800)), MouseY.kr(80, 1800))
});
)
Ndef(\chord).release(4)


//--ndef

Ndef(\windy).play
Ndef(\windy).fadeTime= 3 //set crossfade time to 3sec
Ndef(\windy, {FreeVerb.ar(ClipNoise.ar*LFNoise2.ar(1), 0.5, 1)})
Ndef(\windy, {FreeVerb.ar(GrayNoise.ar*LFNoise2.ar(10), 0.8, 0.8)})
//smaller and smaller roomsize...
Ndef(\windy, {FreeVerb.ar(GrayNoise.ar*LFNoise2.ar(10), 0.8, 0.5)})
Ndef(\windy, {FreeVerb.ar(GrayNoise.ar*LFNoise2.ar(10), 0.8, 0.25)})
Ndef(\windy, {FreeVerb.ar(GrayNoise.ar*LFNoise2.ar(10), 0.8, 0.05)})
Ndef(\windy).release(4) //4sec fade out


//--pulses
Ndef(\click).play
Ndef(\click, {Impulse.ar(1)})
Ndef(\click, {Impulse.ar(1)+Impulse.ar(1.5)})
//nesting reverbs
Ndef(\click, {GVerb.ar(Impulse.ar(1)*0.5, 50)})
Ndef(\click, {GVerb.ar(GVerb.ar(Impulse.ar(1)*0.25, 50), 80)})
Ndef(\click, {GVerb.ar(GVerb.ar(GVerb.ar(Impulse.ar(1)*0.125, 50), 80), 90)})
Ndef(\click).stop


//--mic
//be prepared to stop with cmd+.
Ndef(\feedback).play
Ndef(\feedback, {SoundIn.ar([0, 1])})
Ndef(\feedback).stop
//play with volume control

//2 sec delay
Ndef(\feedback, {DelayN.ar(SoundIn.ar([0, 1]), 2, 2) }).play
//echo
Ndef(\feedback, {CombN.ar(SoundIn.ar([0, 1]), 1, 1, 4)}).play
//400hz ringing comb filter
Ndef(\feedback, {CombN.ar(SoundIn.ar([0, 1]), 1/400, 1/400, 0.1)}).play
//varying delaytime (doppler)
Ndef(\feedback, {DelayC.ar(SoundIn.ar([0, 1]), 1, MouseX.kr(0, 1))}).play
Ndef(\feedback, {DelayC.ar(SoundIn.ar([0, 1]), 5, SinOsc.ar(0.01).range(0.1, 5))}).play
Ndef(\feedback, {DelayC.ar(SoundIn.ar([0, 1]), 1, LFNoise0.ar(10).range(0, 1))}).play
Ndef(\feedback, {CombC.ar(SoundIn.ar([0, 1]), 1, LFNoise0.ar(10).range(0.1, 1), 0.5)}).play


//--soundfiles
b= Buffer.read(s, Document.current.path.dirname++"/../121129soft/51483__suonho__suonho-rmx-berklee-briantranseau-132-let-me-see-ya-bounce-i-crusher.wav");
Ndef(\sampler).play
Ndef(\sampler, {PlayBuf.ar(b.numChannels, b, MouseX.kr(-10, 10), loop: 1)}).play
Ndef(\sampler, {var trig= Impulse.kr(10); PlayBuf.ar(b.numChannels, b, 1, trig, TChoose.kr(trig, [0, b.numFrames*0.2, b.numFrames*0.86]), loop:1)})


//--arguments
Ndef(\test).play
Ndef(\test, {|freq= 400, detune= 4| SinOsc.ar([freq, freq+detune])})
Ndef(\test).set(\detune, 2)
Ndef(\test).set(\detune, 20)
Ndef(\test).set(\freq, 500)
Ndef(\test).stop


//--modulation
//am, rm, fm, pm
Ndef(\modfreq).play
Ndef(\modfreq, {|freq= 300, freqMax= 3000, freqMod= 100| SinOsc.ar(SinOsc.ar(freqMod).range(freq, freqMax))})
Ndef(\modfreq).set(\freq, 400)
Ndef(\modfreq).set(\freq, 500)
Ndef(\modfreq).set(\freqMod, 50)
Ndef(\modfreq).set(\freqMax, 1000)
Ndef(\modfreq).set(\freqMod, 5)
Ndef(\modfreq).stop
//ring modulation
Ndef(\modring, {SinOsc.ar([400, 400])*SoundIn.ar})
