//a bunch of effects based on delay and line-in
Ndef(\direct, {SoundIn.ar([0, 1])}).play//direct sound
Ndef(\direct, {CombC.ar(SoundIn.ar([0, 1]), 1, MouseX.kr(0, 1))})//use mouse to mess up
Ndef(\direct, {CombC.ar(SoundIn.ar([0, 1]), 1, SinOsc.ar(MouseX.kr(0.1, 2)).range(0.1, 1))})//another mouse mess
Ndef(\direct, {LPF.ar(SoundIn.ar([0, 1]), MouseX.kr(50, 5000))})//mouse filter
Ndef(\direct, {SinOsc.ar(MouseX.kr(50, 5000))*SoundIn.ar([0, 1])})//ring modulator
Ndef(\direct, {var src= SoundIn.ar([0, 1]); src+DelayC.ar(src, 1, MouseX.kr(0, 1), MouseY.kr(0, 1))})
Ndef(\direct, {var src= SoundIn.ar([0, 1]); src+CombC.ar(src, 1, MouseX.kr(0, 1), MouseY.kr(0, 2))})
Ndef(\direct).release
