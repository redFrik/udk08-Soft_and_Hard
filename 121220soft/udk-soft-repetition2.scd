s.meter
Ndef(\mouse).clear
Ndef(\mouse).play
Ndef(\mouse, {SinOsc.ar(MouseX.kr(400, 4000))!2})
Ndef(\mouse, {Saw.ar(MouseX.kr(400, 4000))!2})
Ndef(\mouse).stop


Ndef(\mouse).numChannels

//if you pressed Cmd+. then play again to hear
Ndef(\mouse).play


Ndef(\mouse, {SinOsc.ar( MouseX.kr(100, 500) )!2})
Ndef(\mouse, {SinOsc.ar( MouseY.kr(500, 1000) )!2})
Ndef(\mouse, {SinOsc.ar( MouseButton.kr(500, 1000, 0.001) )!2})
Ndef(\mouse).stop

//amplitude contol using mouse y, button toggles chords, mousex scale lagtime

Ndef(\mouseChord).play
Ndef(\mouseChord, {SinOsc.ar( MouseButton.kr( [500, 550, 600, 650], [1000, 2000, 3000, 4000], [0.5, 1, 1.5, 2])).mean!2})
Ndef(\mouseChord, {SinOsc.ar( MouseButton.kr( [500, 550, 600, 650], 1000, [0.5, 1, 1.5, 2])).mean!2})
Ndef(\mouseChord, {SinOsc.ar( MouseButton.kr( [500, 550, 600, 650], MouseX.kr(400, 4000), [0.5, 1, 1.5, 2])).mean!2})

//here the four maximum values are set with four mice x
Ndef(\mouseChord, {SinOsc.ar( MouseButton.kr( [500, 550, 600, 650], [MouseX.kr(400, 4000), MouseX.kr(300, 3000), MouseX.kr(200, 2000), MouseX.kr(100, 1000)], [0.5, 1, 1.5, 2])).mean!2})

Ndef(\mouseChord, {SinOsc.ar( MouseButton.kr( [500, 550, 600, 650], 1000, MouseX.kr(0, 10))).mean*MouseY.kr(1, 0)!2})
Ndef(\mouseChord).stop
Ndef(\mouseChord).play
Ndef(\mouseChord).stop



Ndef(\curve).play
Ndef(\curve, {SinOsc.ar(MouseX.kr(100, 1000, 0).poll)!2})
Ndef(\curve, {SinOsc.ar(MouseX.kr(100, 1000, 1).poll)!2})
Ndef(\curve, {SinOsc.ar(MouseX.kr(100, 1000, \linear).poll)!2})
Ndef(\curve, {SinOsc.ar(MouseX.kr(100, 1000, \exponential).poll)!2})

//typical application... freq is exponential, amp is linear
Ndef(\curve, {SinOsc.ar(MouseX.kr(100, 1000, \exponential))*MouseY.kr(0, 1, \linear)!2})

//never cross or go to zero when using exponetial curvature
Ndef(\curve, {SinOsc.ar(MouseX.kr(100, 1000, \exponential))*MouseY.kr(0.0001, 1, \exponential)!2})

Ndef(\curve).stop


//--ndef
Ndef(\noise).play
Ndef(\noise, {WhiteNoise.ar(0.2)!2})
Ndef(\noise).fadeTime= 5
Ndef(\noise, {BrownNoise.ar(0.5)!2})
Ndef(\noise, {ClipNoise.ar(0.4)!2})
Ndef(\noise, {GrayNoise.ar(0.1)!2})
Ndef(\noise, {PinkNoise.ar(0.4)!2})

Ndef(\noise, {ClipNoise.ar(SinOsc.ar(MouseX.kr(0, 10).poll)*0.2)!2})
Ndef(\noise, {ClipNoise.ar(SinOsc.ar(1.24)*0.2)!2})
Ndef(\noise, {ClipNoise.ar(SinOsc.ar(1.24).clip(0, 1)*0.2)!2})
Ndef(\noise).release(8) //fade out and stop 8 sec


//see Tour of UGens

//--pulses
Ndef(\pulse).play
Ndef(\pulse, {Impulse.ar(200)!2})
Ndef(\pulse, {Impulse.ar(20)!2})
Ndef(\pulse, {Impulse.ar(2)!2})
Ndef(\pulse, {Impulse.ar(2000)!2})

Ndef(\pulse).source.plot(duration: 0.01)

//here average of 200 ones per second
Ndef(\pulse, {Dust.ar(200)!2})//stochastic
Ndef(\pulse).source.plot
Ndef(\pulse, {Dust.ar(2)!2})//chance of two ones per sec
Ndef(\pulse, {Dust.ar(2000)!2})
Ndef(\pulse, {Dust.ar(20)!2})

//toggle on/off (squarewave)
Ndef(\pulse, {Pulse.ar(200)!2})//normal pulse (anti-aliased)
Ndef(\pulse).source.plot
Ndef(\pulse, {LFPulse.ar(200)!2})//low frequency pulse (aliased)
Ndef(\pulse).source.plot

//more square wave sounds...
Ndef(\pulse, {LFPulse.ar( LFPulse.ar(1).range(100, 800) )!2})
Ndef(\pulse, {LFPulse.ar( LFPulse.ar( LFPulse.ar(1).range(4, 8) ).range(100, 800) )!2})
Ndef(\pulse, {LFPulse.ar( LFPulse.ar( LFPulse.ar(3).range(4, 20) ).range(LFPulse.ar(0.75).range(50, 70), LFPulse.ar(0.5).range(100, 200)) )!2})



Ndef(\pulse).numChannels
Ndef(\pulse).clear
Ndef(\pulse).play
Ndef(\pulse).numChannels

Ndef(\pulse).fadeTime= 5

Ndef(\pulse, {SinOsc.ar( SinOsc.ar( SinOsc.ar(3).range(4, 20) ).range(SinOsc.ar(0.75).range(50, 70), SinOsc.ar(0.5).range(100, 200)) )!2})
Ndef(\pulse, {LFSaw.ar( LFSaw.ar( LFSaw.ar(3).range(4, 20) ).range(LFSaw.ar(0.75).range(50, 70), LFSaw.ar(0.5).range(100, 200)) )!2})
Ndef(\pulse, {LFSaw.ar( LFPulse.ar( SinOsc.ar(3).range(4, 20) ).range(LFSaw.ar(0.75).range(50, 70), LFPulse.ar(0.5).range(100, 200)) )!2})


//variables:

//--original
Ndef(\pulse, {LFPulse.ar( LFPulse.ar( LFPulse.ar(3).range(4, 20) ).range(LFPulse.ar(0.75).range(50, 70), LFPulse.ar(0.5).range(100, 200)) )!2})

//--here original rewritten using variables...
(
Ndef(\pulse, {
	var mod1= LFPulse.ar(0.75).range(50, 70);
	var mod2= LFPulse.ar(0.5).range(100, 200);
	var mod0= LFPulse.ar(3).range(4, 20);
	LFPulse.ar( LFPulse.ar( mod0 ).range(mod1, mod2) )!2;
})
)

//--here original rewritten with added arguments
(
Ndef(\pulse, {|freqChange= 3|
	var mod1= LFPulse.ar(0.75).range(50, 70);
	var mod2= LFPulse.ar(0.5).range(100, 200);
	var mod0= LFPulse.ar(freqChange).range(4, 20);
	LFPulse.ar( LFPulse.ar( mod0 ).range(mod1, mod2) )!2;
})
)
Ndef(\pulse).play
Ndef(\pulse).set(\freqChange, 1)
Ndef(\pulse).set(\freqChange, 2)
Ndef(\pulse).set(\freqChange, 0.2)
Ndef(\pulse).stop



//--mic
Ndef(\mic).play
Ndef(\mic, {SoundIn.ar(0)!2}) //warning: keep down volume
//with a delay...
Ndef(\mic, {DelayN.ar(SoundIn.ar(0), 1, 1)!2})
Ndef(\mic, {DelayN.ar(SoundIn.ar(0), 2, 2)!2})//two sec delay
//doppler effect
Ndef(\mic, {DelayC.ar(SoundIn.ar(0), 2, MouseX.kr(0, 2))!2})
Ndef(\mic, {DelayC.ar(SoundIn.ar(0), 2, SinOsc.ar(1).range(0, 2))!2})
Ndef(\mic).stop

Ndef(\echo).play
Ndef(\echo, {CombN.ar(SoundIn.ar, 0.5, 0.5, 3)!2})
Ndef(\echo, {CombC.ar(SoundIn.ar, 0.5, MouseX.kr(0.0001, 0.5), 3)!2})
Ndef(\echo, {CombC.ar(SoundIn.ar, 0.5, 1/200, 0.05)!2})
Ndef(\echo).stop


