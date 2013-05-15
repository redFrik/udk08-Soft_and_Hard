
//manual rebuild
//fading in and out - creating a soundscape of machine-like sounds
d= Buffer.read(s, Document.current.path.dirname++"/51483__suonho__suonho-rmx-berklee-briantranseau-132-let-me-see-ya-bounce-i-crusher.wav");
d.plot
Ndef(\maskin).play
Ndef(\maskin).fadeTime= 8
Ndef(\maskin, {PlayBuf.ar(d.numChannels, d, 0.8.rrand(1.5), Impulse.kr([2, 4, 8, 16].choose), d.numFrames.rand, loop:1)})
Ndef(\maskin).rebuild		//run many times - maybe once per second
Ndef(\maskin).release


//1.rrand(20)
//1.0.rrand(20)
//[2, 4, 8, 16].choose


//automatic rebuild
d= Buffer.read(s, Document.current.path.dirname++"/51483__suonho__suonho-rmx-berklee-briantranseau-132-let-me-see-ya-bounce-i-crusher.wav");
Ndef(\maskinAuto).play
Ndef(\maskinAuto).fadeTime= 8
Ndef(\maskinAuto, {PlayBuf.ar(d.numChannels, d, 0.8.rrand(1.5), Impulse.kr([2, 4, 8, 16].choose), d.numFrames.rand, loop:1)})
Tdef(\auto, {fork{inf.do{Ndef(\maskinAuto).rebuild; 4.wait}}}).play
Tdef(\auto).stop
Ndef(\maskinAuto).release
