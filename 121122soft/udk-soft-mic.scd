
//sound input mic/line


s.boot
s.meter	//(also you can click in localhost gui window and press 'l')


//be prepared to stop with cmd+.
Ndef(\feedback, {SoundIn.ar(0)}).play
//play with volume control


//#1 prevent feedback by separating mic and speaker in space
Ndef(\feedback).clear	//reset ndef
Ndef(\feedback, {Pan2.ar(SoundIn.ar(0), 1)}).play//recreate with 2 channels

//#2 prevent feedback by lowering amplitude
Ndef(\feedback, {Pan2.ar(SoundIn.ar(0), 1)*MouseX.kr(0, 1)}).play

//#3 prevent feedback by separating in time
//here 2 sec delay
Ndef(\feedback, { DelayN.ar( Pan2.ar(SoundIn.ar(0), 1), 2, 2) }).play

DelayN, DelayL, DelayC

//rule of thumb: use DelayN with static (fixed) delaytimes
//use DelayL or DelayC with dynamic delaytimes

//20seconds delay line
Ndef(\feedback, { DelayN.ar( Pan2.ar(SoundIn.ar(0), 1), 20, 20) }).play

//take care not allocating too long delay - will run out of memory

//#4 filter with needle (band reject filters)
//#5 pitchshifting input slowly

//LPF= low pass filter (only passes low frequencies)
//HPF= high pass filter (only passes high frequences)
Ndef(\feedback, { LPF.ar(DelayN.ar( Pan2.ar(SoundIn.ar(0), 1), 1, 1), 700) }).play
Ndef(\feedback, { HPF.ar(DelayN.ar( Pan2.ar(SoundIn.ar(0), 1), 1, 1), 5000) }).play


(
Ndef(\delayeffect, {
	var src= SoundIn.ar(0);
	var efx= DelayN.ar(src, 1, 1);
	var efx2= DelayN.ar(src, 1.5, 1.5);
	Pan2.ar(src+efx+efx2, 1);
}).play;
)

(
Ndef(\delayeffect, {
	var src= SoundIn.ar(0);
	var efx= DelayN.ar(src, 1, 1);
	var efx2= DelayN.ar(src, 1.5, 1.5);
	var efx3= DelayN.ar(src, 1.75, 1.75);
	var efx4= DelayN.ar(src, 1.95, 1.95);
	Pan2.ar(efx+efx2+efx3+efx4, 1);
}).play;
)


(
Ndef(\delayeffect, {
	var src= SoundIn.ar(0);
	var efx= DelayN.ar(src, 1, 1, 0.4);
	var efx2= DelayN.ar(src, 1.5, 1.5, 0.3);
	var efx3= DelayN.ar(src, 1.75, 1.75, 0.2);
	var efx4= DelayN.ar(src, 1.95, 1.95, 0.1);
	Pan2.ar(efx+efx2+efx3+efx4, 1);
}).play;
)

//comb filters - good for 'echo' effects

CombN, CombL, CombC


Ndef(\comb, {Pan2.ar( CombN.ar(SoundIn.ar(0), 1, 1, 4), 1)}).play
Ndef(\comb, {Pan2.ar( CombN.ar(SoundIn.ar(0), 0.1, 0.1, 4), 1)}).play
Ndef(\comb, {Pan2.ar( CombN.ar(SoundIn.ar(0), 0.05, 0.05, 4), 1)}).play
Ndef(\comb, {Pan2.ar( CombN.ar(SoundIn.ar(0), 0.01, 0.01, 4), 1)}).play
//try in headphones!

//400hz ringing comb filter
Ndef(\comb, {Pan2.ar( CombN.ar(SoundIn.ar(0), 1/400, 1/400, 0.1), 1)}).play

//50hz
Ndef(\comb, {Pan2.ar( CombN.ar(SoundIn.ar(0), 1/50, 1/50, 0.5), 1)}).play


//varying delaytime (doppler)
//as soon as changing delaytimes - use DelayC
Ndef(\delayVary, {Pan2.ar( DelayC.ar(SoundIn.ar(0), 1, MouseX.kr(0, 1)), 1)}).play
Ndef(\delayVary, {Pan2.ar( DelayC.ar(SoundIn.ar(0), 5, SinOsc.ar(0.01).range(0.1, 5)), 1)}).play

//10 times per second - it randomizes the delay time
Ndef(\delayVary, {Pan2.ar( DelayC.ar(SoundIn.ar(0), 1, LFNoise0.ar(10).range(0, 1)), 1)}).play



//varying delaytime with comb filter...
Ndef(\combVary, {Pan2.ar( CombC.ar(SoundIn.ar(0), 1, MouseX.kr(0, 1), 0.5), 1)}).play
Ndef(\combVary, {Pan2.ar( CombC.ar(SoundIn.ar(0), 1, SinOsc.ar(1).range(0.1, 1), 0.5), 1)}).play

//10 times per second - randomize delay time
Ndef(\combVary, {Pan2.ar( CombC.ar(SoundIn.ar(0), 1, LFNoise0.ar(10).range(0.1, 1), 0.5), 1)}).play


//switch to line in (in system prefereces) and reboot server
s.reboot

Ndef(\direct, {SoundIn.ar([0, 1])}).play//direct sound
Ndef(\direct, {CombC.ar(SoundIn.ar([0, 1]), 1, MouseX.kr(0, 1))})//use mouse to mess up
Ndef(\direct, {CombC.ar(SoundIn.ar([0, 1]), 1, SinOsc.ar(MouseX.kr(0.1, 2)).range(0.1, 1))})//another mouse mess
Ndef(\direct, {LPF.ar(SoundIn.ar([0, 1]), MouseX.kr(50, 5000))})//mouse filter
Ndef(\direct, {SinOsc.ar(MouseX.kr(50, 5000))*SoundIn.ar([0, 1])})//ring modulator
Ndef(\direct, {var src= SoundIn.ar([0, 1]); src+DelayC.ar(src, 1, MouseX.kr(0, 1), MouseY.kr(0, 1))})
Ndef(\direct, {var src= SoundIn.ar([0, 1]); src+CombC.ar(src, 1, MouseX.kr(0, 1), MouseY.kr(0, 2))})
Ndef(\direct).release

//(secret weapon: SoundIn in republic)
