{SinOsc.ar(500)}.play

Ndef(\name, {SinOsc.ar(500)}).play

//Ndef(...somename..., ...somefunction...)



Ndef(\name).play
Ndef(\name).stop

Ndef(\other, {Ndef(\name).ar*SinOsc.ar(1)})
Ndef(\other).play
Ndef(\other).stop

//Ndef is great for 'patching' together sound functions

//also built in GUI...
NdefMixer(s)

//and change it while it is playing...
//check what is happening here...
Ndef(\other).play
Ndef(\name, {BrownNoise.ar(0.2)})
Ndef(\other).stop

//cross fade times...
Ndef(\other).play
Ndef(\name).fadeTime= 10
Ndef(\name, {Pulse.ar(700)})
Ndef(\name, {Pulse.ar(200)})
Ndef(\other).release(5)


Ndef(\yetAnother, {GVerb.ar(Ndef(\other).ar*0.4, 80)})
Ndef(\yetAnother).play
Ndef(\yetAnother).stop


//-----------------------------
//careful, use headphones or keep volume down
Ndef(\feedback).play
Ndef(\feedback, {SoundIn.ar([0, 1])})
Ndef(\feedback, {DelayN.ar(SoundIn.ar([0, 1]), 1, 1)})
Ndef(\feedback, {DelayC.ar(SoundIn.ar([0, 1]), 1, MouseX.kr(0, 1))})
//move mouse slowly left to right to pitch down
//move mouse slowly right to left to pitch up
//doppler effect




Ndef(\saw, {LFSaw.ar(250)}).play
Ndef(\saw).source.plot(minval: -1, maxval: 1)


Ndef(\feedback, {DelayC.ar(SoundIn.ar([0, 1]), 1, LFSaw.ar(-0.2).range(0, 1))})
//try different values instead of -0.2
//positive values will pitch down, negative up



//drawbacks with this simple pitchshifter:
//always a click when LFSaw jumps from 1 to -1
//(advanced: the way to solve it is with 2 pitchshifters 50% out of phase + fade in/out envelopes)

//also see PitchShift helpfile

//improved version with longer delay line.  better for extreme pitch shifting
Ndef(\feedback, {DelayC.ar(SoundIn.ar([0, 1]), 10, LFSaw.ar(-0.1).range(0, 10))})
Ndef(\feedback, {DelayC.ar(SoundIn.ar([0, 1]), 0.2, LFSaw.ar(-0.1).range(0, 0.2))})



//3 extra crazyness techniques...
Ndef(\feedback, {DelayC.ar(SoundIn.ar([0, 1]), 1, LFSaw.ar(MouseX.kr(-1, 0.1)).range(0, 1))})	//mouse control over readhead speed
Ndef(\feedback, {DelayC.ar(SoundIn.ar([0, 1]), 1, SinOsc.ar(MouseX.kr(-1, 1)).range(0, 1))})	//different readhead oscillator
Ndef(\feedback, {CombC.ar(SoundIn.ar([0, 1]), 1, LFSaw.ar(MouseX.kr(-1, 1)).range(0.05, 1), MouseY.kr(0.5, 4))})

Ndef(\feedback).stop
NdefMixer(s)


Ndef(\dry, {SoundIn.ar([0, 1])}).play

//now change to line-in in system pref and connect a mp3 player with minijack
//use ndef mixer to mix dry (no effect) and wet (effect) sound


//sound file

b= Buffer.read(s, Document.current.path.dirname++"/../121129soft/24966__mich3d__catpurring-01.wav")
b.plot
b.numChannels
Ndef(\sample, {PlayBuf.ar(b.numChannels, b, loop:1)}).play
Ndef(\sample).stop

Ndef(\feedback, {DelayC.ar(Ndef(\sample).ar, 1, SinOsc.ar(MouseX.kr(-1, 1)).range(0, 1))})
Ndef(\feedback).play
Ndef(\feedback).stop



//osc control (from smartphone or other computer)
//android: touchOSC, andOSC, Kontrolleur
//ios: touchOSC, msacontrol...

//* first connect to same (wireless) network
//* then look up computer's ip in system pref / network
//* then set touchOSC program's host to this ip and outgoing port 57120 (sc default port)
//* run this command and look in post window...
OSCFunc.trace(true)	//should post info from touchOSC
OSCFunc.trace(false)	//turn posting off

//--simple
OSCFunc({|msg| msg.postln; Ndef(\feedback).vol= msg[1]}, "/1/fader2")
NdefMixer(s)

OSCFunc({|msg| msg.postln; if(msg[1]==1, {Ndef(\feedback).play}, {Ndef(\feedback).stop})}, "/1/toggle1")

//--more advanced
Ndef(\sample, {|rate= 1| PlayBuf.ar(b.numChannels, b, rate, loop:1)})
Ndef(\feedback, {|pitch= 1| DelayC.ar(Ndef(\sample).ar, 1, LFSaw.ar(pitch).range(0, 1))}).play
OSCFunc({|msg| msg.postln; Ndef(\feedback).set(\pitch, msg[1].linlin(0, 1, 0.5, 5))}, "/1/fader1")

NetAddr.langPort	//good to double check.  should say 57120 else change in touchOSC
