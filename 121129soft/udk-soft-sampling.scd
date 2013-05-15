s.boot

s.meter


//soundfiles

//sc: no mp3 - only wav or aif

http://freesound.org
http://audacity.sourceforge.net



//--how to record in different formats (default is float 32bit)
s.recHeaderFormat= "wav"
s.recSampleFormat= "int16"
a= {SoundIn.ar([0, 1])}.play
s.record
s.stopRecording
a.free



//either from RAM or streaming from disk

//ram is limited.  only load shorter files into ram.  use Buffer
//there's lots of diskspace so for longer soundfiles use DiskIn which stream from disk

//start using Buffer and later learn about DiskIn

s.boot
b= Buffer.read(s, Document.current.path.dirname++"/24966__mich3d__catpurring-01.wav");
c= Buffer.read(s, Document.current.path.dirname++"/51483__suonho__suonho-rmx-berklee-briantranseau-132-let-me-see-ya-bounce-i-crusher.wav");

b.play
c.play

b.plot		//cat is in mono
c.plot		//drumloop is in stereo



//--optional release/clear buffers from ram memory
//b.free
//c.free



b.play		//for testing only
//use PlayBuf or BufRead for better playing back of buffer


//one shot sampler - play once from beginning to end
Ndef(\sampler).play
Ndef(\sampler, {PlayBuf.ar(b.numChannels, b, loop: 0)}).play
Ndef(\sampler, {PlayBuf.ar(c.numChannels, c, loop: 0)}).play


Ndef(\samplerLoop).play
Ndef(\samplerLoop, {PlayBuf.ar(b.numChannels, b, loop: 1)})
Ndef(\samplerLoop).release(3) //fade out and stop after 3sec




Ndef(\playbackRateSampler).play
Ndef(\playbackRateSampler, {PlayBuf.ar(c.numChannels, c, 2, loop:1)})//double speed
Ndef(\playbackRateSampler, {PlayBuf.ar(c.numChannels, c, 3, loop:1)})//tripple speed
Ndef(\playbackRateSampler, {PlayBuf.ar(c.numChannels, c, 30, loop:1)})//30x faster
Ndef(\playbackRateSampler, {PlayBuf.ar(c.numChannels, c, 1, loop:1)})//original speed
Ndef(\playbackRateSampler, {PlayBuf.ar(c.numChannels, c, 0.5, loop:1)})//half speed
Ndef(\playbackRateSampler, {PlayBuf.ar(c.numChannels, c, -1, loop:1)})//backwards original speed
Ndef(\playbackRateSampler, {PlayBuf.ar(c.numChannels, c, -2, loop:1)})//backwards double speed
Ndef(\playbackRateSampler).release


Ndef(\playbackRateSampler).play
Ndef(\playbackRateSampler, {PlayBuf.ar(c.numChannels, c, MouseX.kr(-5, 5), loop:1)})//drums
Ndef(\playbackRateSampler, {PlayBuf.ar(b.numChannels, b, MouseX.kr(-15, 15), loop:1)})//cat
Ndef(\playbackRateSampler, {PlayBuf.ar(c.numChannels, c, MouseX.kr(-1, 1).round(1), loop:1)})//drums
Ndef(\playbackRateSampler).release



//round will round-off mouse values to nearest whole number: -1, 0 or 1
{var m= MouseX.kr(-1, 1); [m, m.round(1)].poll; DC.ar(0)}.play




//now use offset
Ndef(\offsetSampler).play
Ndef(\offsetSampler, {PlayBuf.ar(c.numChannels, c, 1, MouseButton.kr(0, 1, lag:0), c.numFrames*0.25, loop:1)})
//every time mouse click jump to position 25% in the total soundfile
c.plot

Ndef(\offsetSampler).play
Ndef(\offsetSampler, {var trig= MouseButton.kr(0, 1, lag:0); PlayBuf.ar(c.numChannels, c, 1, trig, TRand.kr(0, c.numFrames, trig), loop:1)})
//this will jump to random position every time mouse is clicked

Ndef(\offsetSampler).play
Ndef(\offsetSampler, {var trig= Impulse.kr(10); PlayBuf.ar(c.numChannels, c, 1, trig, TRand.kr(0, c.numFrames, trig), loop:1)})
//now with automatic trigger 10 times per second (using Impulse)


Ndef(\offsetSampler).play
Ndef(\offsetSampler, {var trig= Impulse.kr(10); PlayBuf.ar(c.numChannels, c, 1, trig, TChoose.kr(trig, [0, c.numFrames*0.2, c.numFrames*0.86]), loop:1)})




//manual fade
//fading in and out - creating a soundscape of machine-like sounds
d= Buffer.read(s, Document.current.path.dirname++"/51483__suonho__suonho-rmx-berklee-briantranseau-132-let-me-see-ya-bounce-i-crusher.wav");
Ndef(\maskin).play
Ndef(\maskin).fadeTime= 8
Ndef(\maskin, {PlayBuf.ar(d.numChannels, d, 0.8.rrand(1.5), Impulse.kr([2, 4, 8, 16].choose), d.numFrames.rand, loop:1)})
Ndef(\maskin).rebuild		//run many times - maybe once per second
Ndef(\maskin).release


//1.rrand(20)
//1.0.rrand(20)
//[2, 4, 8, 16].choose



//automatic rebuild
d.free
d= Buffer.read(s, Document.current.path.dirname++"/51483__suonho__suonho-rmx-berklee-briantranseau-132-let-me-see-ya-bounce-i-crusher.wav");
Ndef(\maskinAuto).play
Ndef(\maskinAuto).fadeTime= 8
Ndef(\maskinAuto, {PlayBuf.ar(d.numChannels, d, 0.8.rrand(1.5), Impulse.kr([2, 4, 8, 16].choose), d.numFrames.rand, loop:1)})
Tdef(\auto, {fork{inf.do{Ndef(\maskinAuto).rebuild; 4.wait}}}).play
Tdef(\auto).stop
Ndef(\maskinAuto).release









//for next time: 10sec recording with your own soundfile
