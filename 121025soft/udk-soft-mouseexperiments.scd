asdlkgfjhkljdfhgasdasd
asdasd
asd

1+1
4+4

4/100

s.boot

{SinOsc.ar(700)}.play

{SinOsc.ar(800+50)}.play


//windows -> install gedit and activate sced plugin in gedit settings

{Saw.ar(MouseY.kr(400, 4000))}.play

//this one is 'fun' to have in the background
{SinOsc.ar(MouseButton.kr(400, 4000))}.play

//s.sampleRate= 48000

sclang		//programming language
scserver	//synth application (hidden)

{Saw.ar(MouseX.kr(3, 500))}.play

//good values for min and max circa 20-20000

{Pulse.ar(MouseX.kr(50, 500))}.play

//basic building oscillators: SinOsc, Saw, Pulse, LFTri


//check Tour of UGens in helpfile for a list of oscillators

s.record
s.stopRecording


//--our little chord/pad thingie
{LPF.ar( Saw.ar(MouseX.kr(50, 500)), MouseY.kr(50, 1500))}.play
{LPF.ar( Saw.ar(MouseX.kr(60, 600)), MouseY.kr(60, 1600))}.play
{LPF.ar( Saw.ar(MouseX.kr(75, 1700)), MouseY.kr(70, 1700))}.play
{LPF.ar( Saw.ar(MouseX.kr(80, 800)), MouseY.kr(80, 1800))}.play


//--same thing but as a 'block' ();
(
{LPF.ar( Saw.ar(MouseX.kr(50, 500)), MouseY.kr(50, 1500))}.play;
{LPF.ar( Saw.ar(MouseX.kr(60, 600)), MouseY.kr(60, 1600))}.play;
{LPF.ar( Saw.ar(MouseX.kr(75, 1700)), MouseY.kr(70, 1700))}.play;
{LPF.ar( Saw.ar(MouseX.kr(80, 800)), MouseY.kr(80, 1800))}.play;
)



//--using variables to store synths - start and stop individually
a= {Saw.ar(MouseX.kr(400, 4000))}.play
a.release(2)

b= {Saw.ar(MouseY.kr(200, 2500))}.play
b.release(0.2)

(
a= {LPF.ar( Saw.ar(MouseX.kr(50, 500)), MouseY.kr(50, 1500))}.play;
b= {LPF.ar( Saw.ar(MouseX.kr(60, 600)), MouseY.kr(60, 1600))}.play;
c= {LPF.ar( Saw.ar(MouseX.kr(75, 1700)), MouseY.kr(70, 1700))}.play;
d= {LPF.ar( Saw.ar(MouseX.kr(80, 800)), MouseY.kr(80, 1800))}.play;
)

a.release(2)
b.release(1)
d.release(0.1)
c.release(4)

(
a.release(1);
b.release(2);
c.release(3);
d.release(4);
)


//--same thing with fade in time - fade in and out with individual fadetimes
(
a= {LPF.ar( Saw.ar(MouseX.kr(50, 500)), MouseY.kr(50, 1500))}.play(fadeTime:5);
b= {LPF.ar( Saw.ar(MouseX.kr(60, 600)), MouseY.kr(60, 1600))}.play(fadeTime:4);
c= {LPF.ar( Saw.ar(MouseX.kr(75, 1700)), MouseY.kr(70, 1700))}.play(fadeTime:3);
d= {LPF.ar( Saw.ar(MouseX.kr(80, 800)), MouseY.kr(80, 1800))}.play(fadeTime:2);
)
(
a.release(1);
b.release(2);
c.release(3);
d.release(4);
)



//osx only extra...
Quarks.checkoutAll
Quarks.install("Spectrogram")
Spectrogram.new.start

wiki

https://supercollider.github.io/community/sc140.html

https://sccode.org/search?q=twitter
