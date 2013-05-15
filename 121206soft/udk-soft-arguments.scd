s.boot

NdefMixer(s)

Ndef(\test).play

Ndef(\test, {SinOsc.ar([400, 404])})
Ndef(\test).play
Ndef(\test).stop

//--arguments
Ndef(\test, {|freq= 400| SinOsc.ar([freq, freq+4])})
Ndef(\test).set(\freq, 600)
Ndef(\test).set(\freq, 900)
Ndef(\test).set(\freq, 400)
Ndef(\test).set(\freq, 400.rrand(4000))

//arguments are specified between vertical bars ||
//they are like 'inputs' to your sounding functions
//you can change them while the ndef is running with .set
//or use the 'ed' in ndefmixer

//bonus: click a slider to focus and press keys...
//r for random
//x for maximum
//c for center
//n for minimum


//now adding another argument...
Ndef(\test, {|freq= 400, detune= 4| SinOsc.ar([freq, freq+detune])})

//and adding two more + rewriting to use ring modulation
Ndef(\test, {|freq= 400, detune= 4, ringModFreq= 200, ringModAmp= 1| SinOsc.ar([freq, freq+detune])*SinOsc.ar(ringModFreq, 0, ringModAmp)})

//now a second ndef (like another track or channel)
Ndef(\coffee).play
//watch ndefmixer window - now 2 separate 'tracks'
Ndef(\coffee, {|freq= 400, detune= 4, phaseModFreq= 200, phaseModAmp= 1| SinOsc.ar([freq, freq+detune], SinOsc.ar(phaseModFreq, 0, phaseModAmp))})

//notice how phaseModFreq has the 'wrong' range in ndefmixer ed window
\freq.asSpec
\amp.asSpec
\pan.asSpec
\hello.asSpec
\phaseModFreq.asSpec
Spec.add(\phaseModFreq, ControlSpec(0.5, 500, \exp))
NdefMixer(s)

//Spec is mainly used to gui sliders to have the correct range

/*
//to reset or remove a ndef use .clear
Ndef(\test).clear;
Ndef(\coffee).clear;
*/




//repetition teaches humans....
Ndef(\fff).play
Ndef(\fff, {|freq= 400, amp= 0.1, detune= 4| SinOsc.ar([freq, freq+detune], 0, amp)})
Ndef(\fff).set(\freq, 800)
Ndef(\fff).set(\amp, 0.05)
Ndef(\fff).set(\detune, 15)
Ndef(\fff).stop

//redefine the node (change the sound) but keep the same arguments
Ndef(\fff).play
Ndef(\fff, {|freq= 400, amp= 0.1, detune= 4| Saw.ar([freq, freq+detune], amp)})

Ndef(\fff).fadeTime= 4
Ndef(\fff).xset(\freq, 1600)
Ndef(\fff).xset(\freq, 600)
Ndef(\fff).xset(\freq, 900)
Ndef(\fff).xset(\detune, 1)
Ndef(\fff).xset(\detune, 10)

//adding a filter
Ndef(\fff, {|freq= 400, amp= 0.1, detune= 4, cutoff= 900, rq= 1| BLowPass.ar(Saw.ar([freq, freq+detune], amp), cutoff, rq)})

\rq.asSpec
\cutoff.asSpec

//subtractive synthesis
Ndef(\ggg).play
Ndef(\ggg, {|amp= 0.1, cutoff= 900, rq= 1| BLowPass.ar(WhiteNoise.ar([amp, amp]), cutoff, rq)})
Ndef(\ggg, {|amp= 0.1, cutoff= 900, rq= 1| BLowPass.ar(ClipNoise.ar([amp, amp]), cutoff, rq)})

Ndef(\ggg, {|amp= 0.1, cutoff= 900, rq= 1| BHiPass.ar(ClipNoise.ar([amp, amp]), cutoff, rq)})

Ndef(\ggg, {|amp= 0.1, cutoff= 900, rq= 1| BBandPass.ar(ClipNoise.ar([amp, amp]), cutoff, rq)})

//also see BBandStop

//compare BLowPass and BLowPass4
Ndef(\ggg, {|amp= 0.1, cutoff= 900, rq= 1| BLowPass4.ar(WhiteNoise.ar([amp, amp]), cutoff, rq)})
Ndef(\ggg, {|amp= 0.1, cutoff= 900, rq= 1| BLowPass.ar(WhiteNoise.ar([amp, amp]), cutoff, rq)})


Ndef(\fff).clear;
Ndef(\ggg).clear;


//--repetition teaches humans
Ndef(\noise1).play
Ndef(\noise2).play
Ndef(\noise3).play
Ndef(\noise4).play
Ndef(\noise5).play

Ndef(\noise1, {|amp= 0.1, cutoff= 400, rq= 1, pan= 0| Pan2.ar(BBandPass.ar(WhiteNoise.ar(amp), cutoff, rq), pan)})
Ndef(\noise2, {|amp= 0.1, cutoff= 400, rq= 1, pan= 0| Pan2.ar(BBandPass.ar(WhiteNoise.ar(amp), cutoff, rq), pan)})
Ndef(\noise3, {|amp= 0.1, cutoff= 400, rq= 1, pan= 0| Pan2.ar(BBandPass.ar(WhiteNoise.ar(amp), cutoff, rq), pan)})
Ndef(\noise4, {|amp= 0.1, cutoff= 400, rq= 1, pan= 0| Pan2.ar(BBandPass.ar(WhiteNoise.ar(amp), cutoff, rq), pan)})
Ndef(\noise5, {|amp= 0.1, cutoff= 400, rq= 1, pan= 0| Pan2.ar(BBandPass.ar(WhiteNoise.ar(amp), cutoff, rq), pan)})

