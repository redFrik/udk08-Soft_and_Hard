//for debugging osc...
//NetAddr.langPort
//OSCFunc.trace(true)
//OSCFunc.trace(false)


//start udkKontroll.pd in pure-data extended
//or udkKontroll.maxpat in maxmsp
(
var lastDataX= 0, lastDataY= 0;
var xFunctions= [
	{|state| ("x0"+state).postln},
	{|state| ("x1"+state).postln},
	{|state| ("x2"+state).postln},
	{|state| ("x3"+state).postln},
	{|state| ("x4"+state).postln},
	{|state| ("x5"+state).postln},
	{|state| ("x6"+state).postln},
	{|state| ("x7"+state).postln},
];
var yFunctions= [
	{|state| ("y0"+state).postln},
	{|state| ("y1"+state).postln},
	nil,
	nil,
	{|state| ("y4"+state).postln},
	{|state| ("y5"+state).postln},
	{|state| ("y6"+state).postln},
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
					var bit= (2**i).asInteger;
					if((data&bit)!=(lastDataX&bit), {
						xFunctions[i].value((data&bit).booleanValue.not);
					});
				};
				lastDataX= data;
			},
			'abs_y', {
				data= msg[3];
				8.do{|i|
					var bit= (2**i).asInteger;
					if((data&bit)!=(lastDataY&bit), {
						yFunctions[i].value((data&bit).booleanValue.not);
					});
				};
				lastDataY= data;
			}
		);
	});
}, '/hid');
)