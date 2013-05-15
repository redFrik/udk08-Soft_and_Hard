//for debugging osc...
//NetAddr.langPort
//OSCFunc.trace(true)
//OSCFunc.trace(false)


//start udkKontroll.pd in pure-data extended
//or udkKontroll.maxpat in maxmsp
(
s.waitForBoot{
	~buffers= SoundFile.collectIntoBuffers(Document.current.path.dirname++"/samples/*");
	s.sync;
	Ndef(\x0, {|state= 0, delta= 999|
		var buf= ~buffers[0];
		Splay.ar(PlayBuf.ar(buf.numChannels, buf, 1-delta, state, loop: state));
	}).play;
	Ndef(\x1, {|state= 0, delta= 999|
		var buf= ~buffers[1];
		Splay.ar(PlayBuf.ar(buf.numChannels, buf, 1-delta, state, loop: state));
	}).play;
	Ndef(\x2, {|state= 0, delta= 999|
		var buf= ~buffers[2];
		Splay.ar(PlayBuf.ar(buf.numChannels, buf, 1-delta, state, loop: state));
	}).play;
	Ndef(\x3, {|state= 0, delta= 999|
		var buf= ~buffers[3];
		Splay.ar(PlayBuf.ar(buf.numChannels, buf, 1-delta, state, loop: state));
	}).play;
	Ndef(\x4, {|state= 0, delta= 999|
		var buf= ~buffers[4];
		Splay.ar(PlayBuf.ar(buf.numChannels, buf, 1-delta, state, loop: state));
	}).play;
	Ndef(\x5, {|state= 0, delta= 999|
		var buf= ~buffers[5];
		Splay.ar(PlayBuf.ar(buf.numChannels, buf, 1-delta, state, loop: state));
	}).play;
	Ndef(\x6, {|state= 0, delta= 999|
		var buf= ~buffers[6];
		Splay.ar(PlayBuf.ar(buf.numChannels, buf, 1-delta, state, loop: state));
	}).play;
	Ndef(\x7, {|state= 0, delta= 999|
		var buf= ~buffers[7];
		Splay.ar(PlayBuf.ar(buf.numChannels, buf, 1-delta, state, loop: state));
	}).play;
	
	Ndef(\y0, {|state= 0, delta= 999|
		var buf= ~buffers[8];
		Splay.ar(PlayBuf.ar(buf.numChannels, buf, 1-delta, state, loop: state));
	}).play;
	Ndef(\y1, {|state= 0, delta= 999|
		var buf= ~buffers[9];
		Splay.ar(PlayBuf.ar(buf.numChannels, buf, 1-delta, state, loop: state));
	}).play;
	Ndef(\y2, {|state= 0, delta= 999|
		var buf= ~buffers[10];
		Splay.ar(PlayBuf.ar(buf.numChannels, buf, 1-delta, state, loop: state));
	}).play;
	Ndef(\y3, {|state= 0, delta= 999|
		var buf= ~buffers[11];
		Splay.ar(PlayBuf.ar(buf.numChannels, buf, 1-delta, state, loop: state));
	}).play;
	Ndef(\y4, {|state= 0, delta= 999|
		var buf= ~buffers[11];
		Splay.ar(PlayBuf.ar(buf.numChannels, buf, 1-delta, state, loop: state));
	}).play;
	CmdPeriod.doOnce({~buffers.do{|x| x.free}});
};
)

(
var lastDataX= 0, lastDataY= 0, lastTimes= Array.fill(16, {0});
var xFunctions= [
	{|state, delta| ("x0"+state+delta).postln; Ndef(\x0).set(\state, state.binaryValue, \delta, delta)},
	{|state, delta| ("x1"+state+delta).postln; Ndef(\x1).set(\state, state.binaryValue, \delta, delta)},
	{|state, delta| ("x2"+state+delta).postln; Ndef(\x2).set(\state, state.binaryValue, \delta, delta)},
	{|state, delta| ("x3"+state+delta).postln; Ndef(\x3).set(\state, state.binaryValue, \delta, delta)},
	{|state, delta| ("x4"+state+delta).postln; Ndef(\x4).set(\state, state.binaryValue, \delta, delta)},
	{|state, delta| ("x5"+state+delta).postln; Ndef(\x5).set(\state, state.binaryValue, \delta, delta)},
	{|state, delta| ("x6"+state+delta).postln; Ndef(\x6).set(\state, state.binaryValue, \delta, delta)},
	{|state, delta| ("x7"+state+delta).postln; Ndef(\x7).set(\state, state.binaryValue, \delta, delta)}
];
var yFunctions= [
	{|state, delta| ("y0"+state+delta).postln; Ndef(\y0).set(\state, state.binaryValue, \delta, delta)},
	{|state, delta| ("y1"+state+delta).postln; Ndef(\y1).set(\state, state.binaryValue, \delta, delta)},
	nil,
	nil,
	{|state, delta| ("y4"+state+delta).postln; Ndef(\y2).set(\state, state.binaryValue, \delta, delta)},
	{|state, delta| ("y5"+state+delta).postln; Ndef(\y3).set(\state, state.binaryValue, \delta, delta)},
	{|state, delta| ("y6"+state+delta).postln; Ndef(\y4).set(\state, state.binaryValue, \delta, delta)},
	nil,
];
OSCFunc({|msg|
	var data;
	//msg.postln;	//debug
	if(msg[1]=='abs', {
		switch(msg[2],
			'abs_x', {
				data= msg[3];
				8.do{|i|
					var delta;
					var bit= (2**i).asInteger;
					if((data&bit)!=(lastDataX&bit), {//filter out repetitions
						delta= Main.elapsedTime-lastTimes[i];//time since last change
						xFunctions[i].value((data&bit).booleanValue.not, delta);
						lastTimes= lastTimes.put(i, Main.elapsedTime);
					});
				};
				lastDataX= data;
			},
			'abs_y', {
				data= msg[3];
				8.do{|i|
					var delta;
					var bit= (2**i).asInteger;
					if((data&bit)!=(lastDataY&bit), {//filter out repetitions
						delta= Main.elapsedTime-lastTimes[i];//time since last change
						yFunctions[i].value((data&bit).booleanValue.not, delta);
						lastTimes= lastTimes.put(i, Main.elapsedTime);
					});
				};
				lastDataY= data;
			}
		);
	});
}, '/hid');
)