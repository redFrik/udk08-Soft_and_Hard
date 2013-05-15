//demand more

Ndef(\ddd).play
Ndef(\ddd, {SinOsc.ar(Demand.ar(Impulse.ar(4), 0, Dseq([303, 404, 505], inf)))!2})
Ndef(\ddd).fadeTime= 15
Ndef(\ddd, {SinOsc.ar(Demand.ar(Impulse.ar(6), 0, Dseq([303, 404, 505], inf)))!2})
Ndef(\ddd, {SinOsc.ar(Demand.ar(Impulse.ar(7), 0, Dseq([303, 404, 505], inf)))!2})
Ndef(\ddd, {SinOsc.ar(Demand.ar(Impulse.ar(8), 0, Dseq([303, 404, 505], inf)))!2})
Ndef(\ddd, {SinOsc.ar(Demand.ar(Impulse.ar(9), 0, Dseq([303, 404, 505], inf)))!2})
Ndef(\ddd, {SinOsc.ar(Demand.ar(Impulse.ar(10), 0, Dseq([303, 404, 505], inf)))!2})
Ndef(\ddd).stop

//---------------
//same but with different frequencies
Ndef(\eee).play
Ndef(\eee).fadeTime= 15
Ndef(\eee, {SinOsc.ar(Demand.ar(Impulse.ar(4), 0, Dseq([303, 402, 505], inf)))!2})
Ndef(\eee, {SinOsc.ar(Demand.ar(Impulse.ar(6), 0, Dseq([303, 434, 505], inf)))!2})
Ndef(\eee, {SinOsc.ar(Demand.ar(Impulse.ar(7), 0, Dseq([307, 404, 605], inf)))!2})
Ndef(\eee, {SinOsc.ar(Demand.ar(Impulse.ar(8), 0, Dseq([313, 404, 499, 600, 700, 800], inf)))!2})
Ndef(\eee, {SinOsc.ar(Demand.ar(Impulse.ar(9), 0, Dseq([303, 405, 505], inf)))!2})
Ndef(\eee, {SinOsc.ar(Demand.ar(Impulse.ar(10), 0, Dseq([302, 403, 501], inf)))!2})
Ndef(\eee).release(10)


//--------------
//same but playing with rate/speed of the trigger impulse
Ndef(\fff).play
Ndef(\fff).fadeTime= 15
Ndef(\fff, {SinOsc.ar(Demand.ar(Impulse.ar(4.88), 0, Dseq([303, 404, 505], inf)))!2})
Ndef(\fff, {SinOsc.ar(Demand.ar(Impulse.ar(6.2), 0, Dseq([303, 404, 505], inf)))!2})
Ndef(\fff, {SinOsc.ar(Demand.ar(Impulse.ar(7), 0, Dseq([303, 404, 505], inf)))!2})
Ndef(\fff, {SinOsc.ar(Demand.ar(Impulse.ar(8.5), 0, Dseq([303, 404, 505], inf)))!2})
Ndef(\fff, {SinOsc.ar(Demand.ar(Dust.ar(9), 0, Dseq([303, 404, 505], inf)))!2})
Ndef(\fff, {SinOsc.ar(Demand.ar(Impulse.ar(10.1), 0, Dseq([303, 404, 505], inf)))!2})
Ndef(\fff).release(10)

//------------
//same but playing each ndef panned to a random position (-1.0 to 1.0)
Ndef(\ggg).play
Ndef(\ggg).fadeTime= 15
Ndef(\ggg, {Pan2.ar(SinOsc.ar(Demand.ar(Impulse.ar(4.88), 0, Dseq([303, 404, 505], inf))), 1.0.rand2)})
Ndef(\ggg, {Pan2.ar(SinOsc.ar(Demand.ar(Impulse.ar(5.88), 0, Dseq([303, 404, 505], inf))), 1.0.rand2)})
Ndef(\ggg, {Pan2.ar(SinOsc.ar(Demand.ar(Impulse.ar(6.88), 0, Dseq([303, 404, 505], inf))), 1.0.rand2)})
Ndef(\ggg, {Pan2.ar(SinOsc.ar(Demand.ar(Impulse.ar(7.88), 0, Dseq([303, 404, 505, 606], inf))), 1.0.rand2)})
Ndef(\ggg, {Pan2.ar(SinOsc.ar(Demand.ar(Impulse.ar(8.88), 0, Dseq([303, 404, 505], inf))), 1.0.rand2)})
Ndef(\ggg).release(10)

1.0.rand2		//gives random numbers between -1.0 and 1.0


//------------
//until now only crossfading between two.  let us mix more at the same time
NdefMixer(s)



//optional play in 8channels...
Ndef(\multi).ar(8)
Ndef(\multi).fadeTime= 15
Ndef(\multi, {PanAz.ar(8, SinOsc.ar(Demand.ar(Impulse.ar(4.88), 0, Dseq([303, 404, 505], inf))), 1.0.rand2)})
Ndef(\multi).release



//----------
//slow changes using low frequency oscillators (lfo)
Ndef(\hhh).play
Ndef(\hhh).fadeTime= 1
(
Ndef(\hhh, {
	var rate= Impulse.ar(SinOsc.ar(0.1).range(5, 9));
	var pan= SinOsc.ar(0.12);
	var amp= SinOsc.ar(0.14).range(0, 1);
	var pitch= SinOsc.ar(0.16).range(0.98, 1.02);
	Pan2.ar( SinOsc.ar(Demand.ar(rate, 0, Dseq([303, 404, 505], inf))*pitch), pan, amp);
})
)
Ndef(\hhh).stop




//-------------
Ndef(\ggg).play
Ndef(\ggg).fadeTime= 1
(
Ndef(\ggg, {
	var rate= Demand.ar(Impulse.ar(5), 0, Dseq([2, 2, 2, 2, 4, 4], inf));
	var pan= Demand.ar(Impulse.ar(2.5), 0, Dseq([-1, 0, 1, 0], inf));
	var amp= Demand.ar(Impulse.ar(5), 0, Dseq([1, 0.5], inf));
	var pitch= Demand.ar(Impulse.ar(5), 0, Dseq([1, 1, 1, 0.5, 1, 1, 1.125, 2], inf));
	Pan2.ar( SinOsc.ar(Demand.ar(rate, 0, Dseq([303, 404, 505, 606], inf))*pitch.lagud(0.01, 0.5)), pan, amp);
})
)





(
Ndef(\ggg, {
	var rate= Demand.ar(Impulse.ar(10), 0, Dseq([2, 2, 2, 2, 4, 4, 6, 6, 6, 6, 6, 8, 8, 8, 8, 8, 8], inf));
	var pan= Demand.ar(Impulse.ar(2.5), 0, Dseq([-1, 0, 1, 0], inf));
	var amp= Demand.ar(Impulse.ar(5), 0, Dseq([1, 0.5], inf));
	var pitch= Demand.ar(Impulse.ar(5), 0, Dseq([1, 1, 1, 0.5, 1, 1, 1.125, 2, 3], inf))/2;
	var cutoff= Demand.ar(Impulse.ar(1), 0, Drand([400, 500, 900, 5000, 200], inf)).lag(10);
	var rq= Demand.ar(Impulse.ar(1), 0, Drand([0.1, 0.2, 2, 1], inf)).lag(10);
	Pan2.ar( BLowPass4.ar(LFSaw.ar(Demand.ar(rate, 0, Dseq([303, 404, 505, 606], inf))*pitch.lag(0.1)), cutoff, rq), pan, amp);
})
)
Ndef(\ggg).play
Ndef(\ggg).release(5)






//-------------------
//interconnecting ndefs and doing mixing, ring and frequency modulation (rm and fm)
Ndef(\mmm).play
Ndef(\mmm).fadeTime= 10
Ndef(\mmm, {SinOsc.ar(Demand.ar(Impulse.ar(4), 0, Dseq([303, 404, 505], inf)))!2})
Ndef(\mmm).stop

Ndef(\nnn).play
Ndef(\nnn).fadeTime= 10
Ndef(\nnn, {SinOsc.ar(Demand.ar(Impulse.ar(2.3), 0, Dseq([700, 600, 500, 400], inf)))!2})
Ndef(\nnn).stop

Ndef(\mainmixer).play
Ndef(\mainmixer, {Ndef(\mmm).ar+Ndef(\nnn).ar})
Ndef(\mainmixer).fadeTime= 5
Ndef(\mainmixer, {Ndef(\mmm).ar*Ndef(\nnn).ar})
Ndef(\mainmixer).stop


Ndef(\fm).play
Ndef(\fm, {SinOsc.ar(Demand.ar(Impulse.ar(4), 0, Dseq([1000, 900, 100, 700, 701], inf))*Ndef(\mainmixer).ar)!2})
//using mmm as a trigger
Ndef(\fm, {SinOsc.ar(Demand.ar(Ndef(\mmm).ar>0.75, 0, Dseq([1000, 900, 100, 700, 701], inf))*Ndef(\mainmixer).ar)!2})
Ndef(\fm).release(5)
