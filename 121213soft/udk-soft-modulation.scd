//modulation

s.boot
s.meter

Ndef(\test).play		//will create an ndef in stereo
Ndef(\test, {SinOsc.ar})
Ndef(\test, {SinOsc.ar([440, 440])})
Ndef(\test, {SinOsc.ar!2})
Ndef(\test).numChannels

Ndef(\test).isPlaying
Ndef(\test).clear	//compare with Ndef(\test).stop
Ndef(\test).isPlaying

NdefMixer(s)


Ndef(\modamp).play
Ndef(\modamp, {SinOsc.ar([654, 654])*MouseX.kr(0, 1)})
Ndef(\modamp, {SinOsc.ar([654, 654])*SinOsc.ar(3).range(0, 1)})	//3hz= 3 cycles per second

//amplutitude modulation (AM) = multiply a signal with another signal ranging from 0 to 1

//more AM
Ndef(\modamp, {SinOsc.ar([700, 700])*SinOsc.ar(4).range(0, 1)*SinOsc.ar(3).range(0, 1)})
Ndef(\modamp, {SinOsc.ar([700, 700])*Pulse.ar(5).range(0, 1)})
Ndef(\modamp, {SinOsc.ar([700, 700])*Pulse.ar(5).range(0, 1)*Pulse.ar(4).range(0, 1)})
Ndef(\modamp, {SinOsc.ar([700, 700])*Pulse.ar(5).range(0, 1)*Pulse.ar(4.02).range(0, 1)})

//here you get 'sidebands' (additional tones) for AM
Ndef(\modamp, {SinOsc.ar([400, 400])*SinOsc.ar(100).range(0, 1)})
Ndef(\modamp).play

orgininal freq 400, modulator freq 100:
sideband #1 400+100= 500
sideband #2 400-100= 300

Ndef(\modamp, {SinOsc.ar([400, 400])*SinOsc.ar(200).range(0, 1)})
orgininal freq 400, modulator freq 200:
sideband #1 400+200= 600
sideband #2 400-200= 200

//the above sideband calculations are true for simple sine oscillators

//with more complex oscillators - same calculations are true but many more sidebands
Ndef(\modamp, {SinOsc.ar([400, 400])*LFSaw.ar(200).range(0, 1)})

//mouse experiments
Ndef(\modamp, {SinOsc.ar([400, 400])*SinOsc.ar(MouseX.kr(0, 300)).range(0, 1)})
Ndef(\modamp, {SinOsc.ar([400, 400])*LFSaw.ar(MouseX.kr(0, 300)).range(0, 1)})

//mic experiments
Ndef(\modamp, {SinOsc.ar([400, 400])*Amplitude.ar(SoundIn.ar).poll}).play


Ndef(\modamp).stop


//ring modulation (RM) = multiply a signal with another signal ranging from -1 to 1 (NOTE -1 to 1, compared to 0 to 1 in AM)
Ndef(\modring).play
Ndef(\modring, {SinOsc.ar([400, 400])*SinOsc.ar(4).range(-1, 1)}) //range here is unneccesary
Ndef(\modring, {SinOsc.ar([400, 400])*SinOsc.ar(4)})	//sinosc defaults to range -1 to 1 anyway

Ndef(\modring, {SinOsc.ar([400, 400])*SinOsc.ar(100)}).play
//only sidebands are left - no carrier freq (400)
sideband#1: 400-100= 300
sideband#2: 400+100= 500
and no freq 400 sounds

Ndef(\modring, {SinOsc.ar([400, 400])*SinOsc.ar(200)}).play
sidebands at 600 and 200

Ndef(\modring, {SinOsc.ar([400, 400])*LFSaw.ar(200)}).play

//mouse experiments
Ndef(\modring, {SinOsc.ar([400, 400])*SinOsc.ar(MouseX.kr(0, 600))}).play

//mic experiments
//here the classic ring modulator
Ndef(\modring, {SinOsc.ar([400, 400])*SoundIn.ar})

//here changing the carrier frequency with the mouse.  no longer 400 but from 200 to 2000
Ndef(\modring, {SinOsc.ar([400, 400]*MouseX.kr(0.5, 5))*SoundIn.ar})

Ndef(\modring).stop

//frequency modulation (FM)
Ndef(\modfreq).play
Ndef(\modfreq, {SinOsc.ar([400, 400]*SinOsc.ar(0.1).range(0.5, 1.5))})	//modualtor changing carrier freq from 200 to 600
Ndef(\modfreq, {SinOsc.ar([400, 400]*SinOsc.ar(1).range(0.5, 1.5))})
Ndef(\modfreq, {SinOsc.ar([400, 400]*SinOsc.ar(10).range(0.5, 1.5))})
Ndef(\modfreq, {SinOsc.ar([400, 400]*SinOsc.ar(100).range(0.5, 1.5))})
Ndef(\modfreq, {SinOsc.ar([400, 400]*SinOsc.ar(MouseX.kr(0, 1000)).range(0.5, 1.5))})
Ndef(\modfreq, {SinOsc.ar([400, 400]*LFSaw.ar(1).range(0.5, 1.5))})
Ndef(\modfreq, {SinOsc.ar([400, 400]*LFSaw.ar(10).range(0.5, 1.5))})
Ndef(\modfreq, {SinOsc.ar([400, 400]*LFSaw.ar(100).range(0.5, 1.5))})
Ndef(\modfreq, {SinOsc.ar([400, 400]*LFSaw.ar(100).range(0.0001, 1.2))})

Ndef(\modfreq, {SinOsc.ar(SinOsc.ar(100).range(300, 3000))!2})
Ndef(\modfreq, {SinOsc.ar(SinOsc.ar(100).exprange(300, 3000))!2})
Ndef(\modfreq, {SinOsc.ar(SinOsc.ar(100).exprange(30, 1300))!2})
Ndef(\modfreq, {SinOsc.ar(SinOsc.ar(100).exprange(300, 1300))!2})
Ndef(\modfreq, {SinOsc.ar(SinOsc.ar(100).exprange(50, 300))!2})
Ndef(\modfreq, {SinOsc.ar(SinOsc.ar(200).exprange(300, 400))!2})

Ndef(\modfreq, {SinOsc.ar(SinOsc.ar(SinOsc.ar(50).exprange(100, 3000)).exprange(100, 4000))!2})
Ndef(\modfreq, {SinOsc.ar(SinOsc.ar(SinOsc.ar(SinOsc.ar(0.4).exprange(1, 10)).exprange(100, 3000)).exprange(100, 4000))!2})
Ndef(\modfreq).stop


//phase modulation (PM)
Ndef(\modphase).play
//no change from normal sinosc...
Ndef(\modphase, {SinOsc.ar(0, LFSaw.ar(400).range(0, 2pi))})
Ndef(\modphase, {SinOsc.ar(0, SinOsc.ar([400, 400]).range(0, 2pi))})

Ndef(\modphase, {SinOsc.ar(0, SinOsc.ar([400, 400]).range(0, MouseX.kr(0, 10)))})

Ndef(\modphase, {SinOsc.ar(0, SinOsc.ar([400, 400]).range(0, MouseX.kr(0, 10)))})




//-reusable ring modulator effect

Ndef(\ringEfx).play;
(
Ndef(\ringEfx, {|freq= 400, detune= 1, modAmp= 1|
	var mic= SoundIn.ar;
	var mod= SinOsc.ar(freq*[1, detune], 0, modAmp);
	mic*mod;
});
)
NdefMixer(s)




//ring mod on a drumloop...
b= Buffer.read(s, "/Applications/SuperCollider344/sounds/Drum_Loop_01.wav")
b.numChannels
Ndef(\bufferPlayRing).play;
(
Ndef(\bufferPlayRing, {|freq= 400, detune= 1, modAmp= 1|
	var src= PlayBuf.ar(b.numChannels, b, loop:1);
	var mod= SinOsc.ar(freq*[1, detune], 0, modAmp);
	src*mod;
});
)


//so RM (and AM) are good for cheap effects - work on any sound source
//FM (and PM) are only for generating sounds - you can not 'fm' effect any sound


s.freqscope
//if you have sc3.5.x
GUI.qt
s.freqscope

//if older sc version
//set internal server as default and boot it
s.freqscope
