(
1+1;

2+2;
)

s.boot


(
{SinOsc.ar(400)*MouseX.kr(0, 1)}.play;

{SinOsc.ar(700)*MouseY.kr(0, 1)}.play;
)


//-- 20 - 20000 Hz (cycles per second)
(
Ndef(\myFirstNdef, {SinOsc.ar(2000)*MouseY.kr(0, 1)}).play;
)
(
Ndef(\myFirstNdef, {WhiteNoise.ar*LFNoise2.ar(1)}).play;
)


.ar = audio rate				(what we listen to - updated 44100/sec)
.kr = control rate		(slower controller - 64 times slower than ar)



{SinOsc.ar(2000)}.plot(minval: -1, maxval: 1)
{SinOsc.kr(2000)}.plot(minval: -1, maxval: 1)
{SinOsc.ar(2000)}.play
{SinOsc.kr(2000)}.play



//--soundscape with fade in/out
Ndef(\windy).play;
Ndef(\windy).fadeTime= 4; //4seconds
Ndef(\windy, {WhiteNoise.ar*LFNoise2.ar(20)})
Ndef(\windy, {BrownNoise.ar*LFNoise2.ar(0.4)})
Ndef(\windy, {PinkNoise.ar*LFNoise2.ar(2)})
Ndef(\windy, {ClipNoise.ar*LFNoise2.ar(1)})
Ndef(\windy, {GrayNoise.ar*LFNoise2.ar(1)})
Ndef(\windy, {SinOsc.ar(400)})
Ndef(\ping, {SinOsc.ar(500)}).play
Ndef(\ping).stop

Ndef(\windy).play
Ndef(\windy, {FreeVerb.ar(GrayNoise.ar*LFNoise2.ar(10), 0.8, 0.8)})
Ndef(\windy, {FreeVerb.ar(GrayNoise.ar*LFNoise2.ar(10), 0.8, 0.5)})
Ndef(\windy, {FreeVerb.ar(GrayNoise.ar*LFNoise2.ar(10), 0.8, 0.25)})
Ndef(\windy, {FreeVerb.ar(GrayNoise.ar*LFNoise2.ar(10), 0.8, 0.05)})
Ndef(\windy).stop

Ndef(\windy).play
Ndef(\windy, {GVerb.ar(GrayNoise.ar*LFNoise2.ar(10), 90)})



//see helpfile 'Tour of UGens'


Ndef(\windy).play
Ndef(\windy).fadeTime= 4
Ndef(\windy, {WhiteNoise.ar*MouseX.kr(-1, 1).poll})
Ndef(\windy, {WhiteNoise.ar*LFNoise2.ar(1).poll})
Ndef(\windy, {WhiteNoise.ar*SinOsc.ar(2)})
Ndef(\windy, {WhiteNoise.ar*SinOsc.ar(3)})
Ndef(\windy, {WhiteNoise.ar*SinOsc.ar(4)})

//for amplitude negative and positive values sounds the same

//also for frequencies - sounds no different with negative freq
Ndef(\windy, {SinOsc.ar(-400)})
Ndef(\windy, {SinOsc.ar(400)})

Ndef(\windy).play
Ndef(\windy, {SinOsc.ar(MouseX.kr(100, 1000))})
Ndef(\windy, {SinOsc.ar(LFNoise2.ar(1)*1000)})
Ndef(\windy, {SinOsc.ar(LFNoise2.ar(1)*5000)})//between -5000 and 5000hz
Ndef(\windy, {SinOsc.ar(LFNoise2.ar(1)*100)})//between -100 and 100hz
Ndef(\windy, {SinOsc.ar(LFNoise2.ar(1)*100+500)})//between 400 and 600hz
[-1, 1]*100+500
-100+500= 400
100+500= 600

Ndef(\windy, {SinOsc.ar(LFNoise2.ar(1).range(400, 600))})




//--
Ndef(\track1).play
Ndef(\track1).fadeTime= 2
Ndef(\track1, {SinOsc.ar(MouseX.kr(400, 4000))*LFNoise2.ar(10)})
Ndef(\track2).play
Ndef(\track2).fadeTime= 3
Ndef(\track2, {SinOsc.ar(MouseY.kr(900, 1200)*SinOsc.ar(20))})
Ndef(\track1).release
Ndef(\track2).release
Ndef(\track2).vol= 0.1//individual volume control
Ndef(\track2).gui	//individual user interface
Ndef(\track1).gui
NdefMixer(s)

//next thursday... tick, rhythms, clicks, pulses
Impulse, Dust, LFPulse
